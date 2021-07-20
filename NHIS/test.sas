*--------1---------2---------3---------4---------5---------6---------7---------8;
/* REPRODUCE RESULTS IN EXAMPLE A, 
   National Center for Health Statistics, Guidelines for Analysis of Trends
   https://www.cdc.gov/nchs/data/series/sr_02/sr02_179.pdf */

DM "CLEAR LOG; CLEAR OUT;" ;

proc format;
   value anyeruse
   1 = "None"
   2 = "One or more"
   ;
   value instype
   1 = "Uninsured"
   2 = "Medicaid"
   3 = "Private"
   4 = "Other"
   ;
run;

/* multiyear data table from CSV exported from R
   crude frequencies match */
PROC IMPORT OUT= WORK.nhis 
            DATAFILE= "C:\Users\michael.j.laviolette\Desktop\Trends\NHIS\data\nhis.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; 
RUN;

data nhis00_15;
  set nhis;
  /* CODE PROVIDED BY NCHS */
************* HEALTH INSURANCE****************;
  IF SRVY_YR > 2007 
  THEN DO;
         OTHERPUB = OTHPUB;
       END;
  IF SRVY_YR > 2003 
  THEN DO
         CHIP = SCHIP;
       END;
  IF SRVY_YR < 2004 
  THEN DO;
         *** MEDICAID/PUBLIC ASSISTANCE ;
         *** MCAID=1 IF YES, HAS MEDICAID OR PUBLIC ASSISTANCE ;
         *** MCAID=0 IF NO, DOES NOT HAVE MEDICAID OR PUBLIC ASSISTANCE OR 
             UNKNOWN ON SUCH COVERAGE ;
         IF MEDICAID IN (1,2) OR OTHERPUB IN (1) OR CHIP IN (1)
         THEN MCAID = 1;
         ELSE IF (MEDICAID > 3 OR MEDICAID <= 0) OR (CHIP > 2 OR CHIP <= 0) OR 
                 (OTHERPUB > 2 OR OTHERPUB <= 0) 
              THEN MCAID = 9;
              ELSE MCAID = 2;
       END;
  ELSE IF SRVY_YR > 2003 
       THEN DO;
              *** MEDICAID/PUBLIC ASSISTANCE;
              *** MCAID = 1 IF YES, HAS MEDICAID OR PUBLIC ASSISTANCE ;
              *** MCAID = 0 IF NO, DOES NOT HAVE MEDICAID OR PUBLIC ASSISTANCE
                  OR UNKNOWN ON SUCH COVERAGE ;
              IF MEDICAID IN (1,2) OR OTHERPUB IN (1,2) OR CHIP IN (1,2)
              THEN MCAID = 1;
              ELSE IF (MEDICAID > 3 OR MEDICAID <= 0) OR (CHIP > 3 OR CHIP <= 0) OR (OTHERPUB > 3 OR OTHERPUB <= 0) 
                   THEN MCAID = 9;
                   ELSE MCAID = 2;
            END;
  *DICHOTOMIZED PRIVATE COVERAGE;
  IF PRIVATE IN (1 2) 
  THEN PRICOV = 1;
  ELSE IF PRIVATE = 3 
       THEN PRICOV = 2;
       ELSE IF PRIVATE > 3 
            THEN PRICOV = 3;
  *THIS CODE IS A HIERARCHY, COULD ALSO USE THE OVERLAPPING CODE FROM HUS;
  IF NOTCOV = 1 AND PRICOV = 2 AND MCAID = 2 
  THEN INSTYPE = 1; *UNINSURED, NOT PRIVATE, NOT MEDICAID;
  IF NOTCOV = 2 AND PRICOV = 2 AND MCAID = 1 
  THEN INSTYPE = 2; *MEDICAID (INCL OTHPUB AND CHIP), NOT PRIVATE, NOT UNINSURED;
  IF NOTCOV = 2 AND PRICOV = 1 
  THEN INSTYPE = 3; *PRIVATE, NOT MEDICAID, NOT UNINSURED;
  IF NOTCOV = 2 AND PRICOV = 2 AND MCAID = 2 
  THEN INSTYPE = 4; *OTHER INSURED -- ABOUT 10%;
  /* add variable for age 18-64, subject of analysis */
  under65 = (18 <= age_p <= 64);
  format instype instype. anyeruse anyeruse.;
  if instype NE 4;
run;

title "Ages 18-64";
proc freq data = nhis00_15;
  where(18 <= age_p <= 64);
  table srvy_yr * (mcaid pricov instype) /nocum nopercent norow nocol missing;
run;

proc sort data =nh00_15;
  by stratum psu;
run;


proc surveyfreq data = nhis00_15 nomcar;
  *ods output ResponseTable = Results;
  strata stratum;
  cluster psu;
  weight wtfa_sa;
  table under65 * srvy_yr * instype * anyeruse / row nototal;
run;
/* POINT ESTIMATES MATCH, STD ERRORS SLIGHTLY OFF FROM PUBLISHED
   WOULD THEY MATCH IN SUDAAN? */
title;

