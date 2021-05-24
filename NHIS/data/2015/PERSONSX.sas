*********************************************************************
 JUNE 9, 2016 12:24 PM
 
 This is an example of a SAS program that creates a SAS
 file from the 2015 NHIS Public Use PERSONSX.DAT ASCII file
 
 This is stored in PERSONSX.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2015";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2015";

FILENAME ASCIIDAT 'C:\NHIS2015\PERSONSX.dat';

* DEFINE VARIABLE VALUES FOR REPORTS;

*  USE THE STATEMENT "PROC FORMAT LIBRARY=LIBRARY"
     TO PERMANENTLY STORE THE FORMAT DEFINITIONS;

*  USE THE STATEMENT "PROC FORMAT" IF YOU DO NOT WISH
      TO PERMANENTLY STORE THE FORMATS;

PROC FORMAT LIBRARY=LIBRARY;
*PROC FORMAT;

   VALUE $GROUPC
      ' '< - HIGH   = "Range of Values"
   ;
   VALUE GROUPN
      LOW - HIGH   = "Range of Values"
   ;
   VALUE PEP001X
      10                 = "10 Household"
      20                 = "20 Person"
      25                 = "25 Income Imputation"
      30                 = "30 Sample Adult"
      31                 = "31 Sample Adult Cancer"
      38                 = "38 Functioning and Disability"
      40                 = "40 Sample Child"
      60                 = "60 Family"
      63                 = "63 Family Disability Questions"
      65                 = "65 Paradata"
      70                 = "70 Injury/Poisoning Episode"
      75                 = "75 Injury/Poisoning Verbatim"
   ;
   VALUE PEP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE PEP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE PEP005X
      01                 = "01 January"
      02                 = "02 February"
      03                 = "03 March"
      04                 = "04 April"
      05                 = "05 May"
      06                 = "06 June"
      07                 = "07 July"
      08                 = "08 August"
      09                 = "09 September"
      10                 = "10 October"
      11                 = "11 November"
      12                 = "12 December"
   ;
   VALUE PEP010X
      1                  = "1 Northeast"
      2                  = "2 Midwest"
      3                  = "3 South"
      4                  = "4 West"
   ;
   VALUE PEP013X
      1                  = "1 Male"
      2                  = "2 Female"
   ;
   VALUE PEP014X
      1                  = "1 Yes"
      2                  = "2 No"
   ;
   VALUE PEP015X
      1                  = "1 Imputed: was 'refused' Hispanic Origin"
      2                  = "2 Imputed: was 'not ascertained' Hispanic Origin"
      3                  = "3 Imputed: was 'does not know' Hispanic Origin"
      4                  = "4 Hispanic origin given by respondent/proxy"
   ;
   VALUE PEP016X
      00                 = "00 Multiple Hispanic"
      01                 = "01 Puerto Rico"
      02                 = "02 Mexican"
      03                 = "03 Mexican-American"
      04                 = "04 Cuban/Cuban American"
      05                 = "05 Dominican (Republic)"
      06                 = "06 Central or South American"
      07                 = "07 Other Latin American, type not specified"
      08                 = "08 Other Spanish"
      09                 = "09 Hispanic/Latino/Spanish, non-specific type"
      10                 = "10 Hispanic/Latino/Spanish, type refused"
      11                 = "11 Hispanic/Latino/Spanish, type not ascertained"
      12                 = "12 Not Hispanic/Spanish origin"
   ;
   VALUE PEP017X
      1                  = "1 Imputed: was 'refused' Hispanic Origin"
      2                  = "2 Imputed: was 'not ascertained' Hispanic Origin"
      3                  = "3 Imputed: was 'does not know' Hispanic Origin"
      4                  = "4 Hispanic Origin type given by respondent/proxy"
   ;
   VALUE PEP018X
      01                 = "01 White only"
      02                 = "02 Black/African American only"
      03                 = "03 AIAN only"
      04                 = "04 Asian only"
      05                 = "05 Race group not releasable (See file layout)"
      06                 = "06 Multiple race"
   ;
   VALUE PEP019X
      1                  = "1 Imputed: was 'refused'"
      2                  = "2 Imputed: was 'not ascertained'"
      3                  = "3 Imputed: was 'does not know'"
      4                  = "4 Imputed: was other race'"
      5                  = "5 Imputed: was 'unspecified multiple race'"
      6                  = "6 Race given by respondent/proxy"
   ;
   VALUE PEP020X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American), Alaska Native"
      09                 = "09 Asian Indian"
      10                 = "10 Chinese"
      11                 = "11 Filipino"
      15                 = "15 Other Asian (See file layout)"
      16                 = "16 Primary race not releasable (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE PEP021X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American) (includes Eskimo, Aleut)"
      06                 = "06 Chinese"
      07                 = "07 Filipino"
      12                 = "12 Asian Indian"
      16                 = "16 Other race (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE PEP022X
      1                  = "1 White"
      2                  = "2 Black"
      3                  = "3 Asian"
      4                  = "4 All other race groups (See file layout)"
   ;
   VALUE PEP023X
      1                  = "1 Hispanic"
      2                  = "2 Non-Hispanic White"
      3                  = "3 Non-Hispanic Black"
      4                  = "4 Non-Hispanic Asian"
      5                  = "5 Non-Hispanic All other race groups"
   ;
   VALUE PEP024X
      1                  = "1 Ethnicity/race imputed"
      2                  = "2 Ethnicity/race given by respondent/proxy"
   ;
   VALUE PEP025X
      1                  = "1 Armed Forces"
      2                  = "2 Not Armed Forces"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP026X
      01                 = "01 Household reference person"
      02                 = "02 Spouse (husband/wife)"
      03                 = "03 Unmarried Partner"
      04                 = "04 Child (biological/adoptive/in-law/step/foster)"
      05                 = "05 Child of partner"
      06                 = "06 Grandchild"
      07                 = "07 Parent (biological/adoptive/in-law/step/foster)"
      08                 = 
"08 Brother/sister (biological/adoptive/in-law/step/foster)"
      09                 = "09 Grandparent (Grandmother/Grandfather)"
      10                 = "10 Aunt/Uncle"
      11                 = "11 Niece/Nephew"
      12                 = "12 Other relative"
      13                 = "13 Housemate/roommate"
      14                 = "14 Roomer/Boarder"
      15                 = "15 Other nonrelative"
      16                 = "16 Legal guardian"
      17                 = "17 Ward"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE $PEP027X
      "8"                = "8 Not ascertained"
      "P"                = "P HH Reference person"
   ;
   VALUE PEP028X
      01                 = "01 Family reference person"
      02                 = "02 Spouse (husband/wife)"
      03                 = "03 Unmarried Partner"
      04                 = "04 Child (biological/adoptive/in-law/step/foster)"
      05                 = "05 Child of partner"
      06                 = "06 Grandchild"
      07                 = "07 Parent (biological/adoptive/in-law/step/foster)"
      08                 = 
"08 Brother/sister (biological/adoptive/in-law/step/foster)"
      09                 = "09 Grandparent (Grandmother/Grandfather)"
      10                 = "10 Aunt/Uncle"
      11                 = "11 Niece/Nephew"
      12                 = "12 Other relative"
      16                 = "16 Legal guardian"
      17                 = "17 Ward"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE $PEP029X
      OTHER              = "Birth Year"
      ' '                 = ' '
      "9997"             = "9997 Refused"
      "9998"             = "9998 Not ascertained"
      "9999"             = "9999 Don't know"
   ;
   VALUE PEP030X
      00                 = "00 Under 1 year"
      85                 = "85 85+ years"
   ;
   VALUE PEP031X
      1                  = "1 Change on AGE due to data entry error"
   ;
   VALUE $PEP032X
      "8"                = "8 Not ascertained"
      "B"                = "B Family respondent"
   ;
   VALUE $PEP033X
      "8"                = "8 Not ascertained"
      "P"                = "P Family reference person"
   ;
   VALUE PEP034X
      0                  = "0 Under 14 years"
      1                  = "1 Married - spouse in household"
      2                  = "2 Married - spouse not in household"
      3                  = "3 Married - spouse in household unknown"
      4                  = "4 Widowed"
      5                  = "5 Divorced"
      6                  = "6 Separated"
      7                  = "7 Never married"
      8                  = "8 Living with partner"
      9                  = "9 Unknown marital status"
   ;
   VALUE $PEP035X
      "98"               = "98 Not ascertained"
   ;
   VALUE PEP036X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP037X
      1                  = "1 Married"
      2                  = "2 Widowed"
      3                  = "3 Divorced"
      4                  = "4 Separated"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP039X
      1                  = "1 Separated"
      2                  = "2 Divorced"
      3                  = "3 Married"
      4                  = "4 Single/never married"
      5                  = "5 Widowed"
      9                  = "9 Unknown marital status"
   ;
   VALUE PEP040X
      1                  = "1 Full or Adopted {brother/sister}"
      2                  = "2 Half {brother/sister}"
      3                  = "3 Step {brother/sister}"
      4                  = "4 {Brother/Sister}-in-law"
      9                  = "9 Other and unknown"
   ;
   VALUE $PEP041X
      "00"               = "00 Mother not a household member"
      "97"               = "97 Refused"
      "98"               = "98 Not ascertained"
      "99"               = "99 Don't know"
   ;
   VALUE PEP042X
      1                  = "1 Biological or adoptive"
      2                  = "2 Step"
      3                  = "3 In-law"
      9                  = "9 Other and unknown"
   ;
   VALUE $PEP043X
      "00"               = "00 Father not in household"
      "97"               = "97 Refused"
      "98"               = "98 Not ascertained"
      "99"               = "99 Don't know"
   ;
   VALUE PEP045X
      1                  = "1 Mother, no father"
      2                  = "2 Father, no mother"
      3                  = "3 Mother and father"
      4                  = "4 Neither mother nor father"
      9                  = "9 Unknown"
   ;
   VALUE PEP046X
      01                 = "01 Less than/equal to 8th grade"
      02                 = "02 9-12th grade, no high school diploma"
      03                 = "03 High school graduate/GED recipient"
      04                 = "04 Some college, no degree"
      05                 = "05 AA degree, technical or vocational"
      06                 = "06 AA degree, academic program"
      07                 = "07 Bachelor's degree"
      08                 = "08 Master's, professional, or doctoral degree"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP048X
      0                  = "0 Sample Adult - no record"
      1                  = "1 Sample Adult - has record"
      2                  = "2 Not selected as Sample Adult"
      3                  = "3 No one selected as Sample Adult"
      4                  = "4 Armed Force member"
      5                  = "5 Armed Force member - selected as Sample Adult"
   ;
   VALUE PEP049X
      0                  = "0 Sample Child - no record"
      1                  = "1 Sample Child - has record"
      2                  = "2 Not selected as Sample Child"
      3                  = "3 No one selected as Sample Child"
      4                  = "4 Emancipated minor"
   ;
   VALUE PEP050X
      1                  = "1 No sample adult record due to quality reasons"
   ;
   VALUE PEP051X
      1                  = "1 No sample child record due to quality reasons"
   ;
   VALUE PEP052X
      1                  = 
"1 Families selected to receive AFD (sample adults) section"
      2                  = 
"2 Families selected to receive FDB (all persons 1 year and older) section"
   ;
   VALUE PEP066X
      0                  = "0 Unable to work"
      1                  = "1 Limited in work"
      2                  = "2 Not limited in work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP069X
      0                  = "0 Limitation previously mentioned"
      1                  = "1 Yes, limited in some other way"
      2                  = "2 Not limited in any way"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP070X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE PEP071X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP086X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP087X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP088X
      00                 = "00 Less than 1 year"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP089X
      0                  = "0 Since birth and child <1 year of age"
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP090X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE PEP199X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP200X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP377X
      1                  = 
"1 At least one condition causing limitation of activity is chronic"
      2                  = 
"2 No condition causing limitation of activity is chronic"
      9                  = 
"9 Unknown if any condition causing limitation of activity is chronic"
   ;
   VALUE PEP378X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE PEP379X
      1                  = "1 Excellent"
      2                  = "2 Very good"
      3                  = "3 Good"
      4                  = "4 Fair"
      5                  = "5 Poor"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP383X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE PEP386X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP392X
      1                  = "1 Not covered"
      2                  = "2 Covered"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP393X
      1                  = "1 Private"
      2                  = "2 Medicaid and other public"
      3                  = "3 Other coverage"
      4                  = "4 Uninsured"
      5                  = "5 Don't know"
   ;
   VALUE PEP394X
      1                  = "1 Private"
      2                  = "2 Dual eligible"
      3                  = "3 Medicare Advantage"
      4                  = "4 Medicare only excluding Medicare Advantage"
      5                  = "5 Other coverage"
      6                  = "6 Uninsured"
      7                  = "7 Don't know"
   ;
   VALUE PEP395X
      1                  = "1 Private"
      2                  = "2 Dual eligible"
      3                  = "3 Medicare only"
      4                  = "4 Other coverage"
      5                  = "5 Uninsured"
      6                  = "6 Don't know"
   ;
   VALUE PEP396X
      1                  = "1 Yes, information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP397X
      1                  = "1 Part A - Hospital only"
      2                  = "2 Part B - Medical only"
      3                  = "3 Both Part A and Part B"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP400X
      1                  = "1 Medicare Advantage"
      2                  = "2 Private plan not Medicare Advantage"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't Know"
   ;
   VALUE PEP405X
      1                  = "1 Reassigned to Medicaid from private"
   ;
   VALUE PEP406X
      1                  = "1 Any doctor"
      2                  = "2 Select from list"
      3                  = "3 Doctor is assigned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP410X
      1                  = "1 Yes, with information"
      2                  = "2 Yes, but no information"
      3                  = "3 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP424X
      1                  = "1 Reassigned to private from public"
   ;
   VALUE PEP425X
      1                  = "1 Exchange plan"
      2                  = "2 Not exchange plan"
      8                  = "8 Not ascertained"
   ;
   VALUE PEP426X
      1                  = "1 In own name"
      2                  = "2 Someone else in family"
      3                  = "3 Person not in household"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP427X
      1                  = "1 Child (including stepchildren)"
      2                  = "2 Spouse"
      3                  = "3 Former spouse"
      4                  = "4 Some other relationship"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP429X
      01                 = "01 Through employer"
      02                 = "02 Through union"
      03                 = 
"03 Through workplace, but don't know if employer or union"
      04                 = 
"04 Through workplace, self-employed or professional association"
      05                 = "05 Purchased directly"
      06                 = 
"06 Through Healthcare.gov or the Affordable Care Act, also known as Obamacare"
      07                 = 
"07 Through a state/local government or community program"
      08                 = "08 Other"
      09                 = "09 Through school"
      10                 = "10 Through parents"
      11                 = "11 Through relative other than parents"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP431X
      1                  = "1 Company provides exchange plans"
      2                  = "2 Not an exchange company"
      3                  = "3 Exchange Portal or exact exchange plan name"
      8                  = "8 Not ascertained"
   ;
   VALUE PEP439X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE PEP440X
      20000              = "20000 $20,000 or more"
      99997              = "99997 Refused"
      99998              = "99998 Not ascertained"
      99999              = "99999 Don't know"
   ;
   VALUE PEP441X
      1                  = "1 HMO/IPA"
      2                  = "2 PPO"
      3                  = "3 POS"
      4                  = "4 Fee-for-service/indemnity"
      5                  = "5 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP442X
      1                  = "1 Less than [$1,300/$2,600]"
      2                  = "2 [$1,300/$2,600] or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP444X
      1                  = "1 Any doctor"
      2                  = "2 Select from group/list"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP454X
      1                  = "1 Any doctor"
      2                  = "2 Select from book/list"
      3                  = "3 Doctor is assigned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP480X
      1                  = "1 Very confident"
      2                  = "2 Somewhat confident"
      3                  = "3 Not too confident"
      4                  = "4 Not confident at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE PEP482X
      1                  = "1 Reassigned to CHIP from private"
   ;
   VALUE PEP488X
      1                  = "1 Reassigned to other public from private"
   ;
   VALUE PEP495X
      1                  = "1 Reassigned to other government from private"
   ;
   VALUE PEP506X
      1                  = "1 TRICARE Prime"
      2                  = "2 TRICARE Standard and Extra"
      3                  = "3 Blank"
      4                  = "4 TRICARE for Life"
      5                  = "5 TRICARE other (specify)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP508X
      1                  = "1 6 months or less"
      2                  = "2 More than 6 months, but not more than 1 year ago"
      3                  = "3 More than 1 year, but not more than 3 years ago"
      4                  = "4 More than 3 years"
      5                  = "5 Never"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP538X
      01                 = "01 Through employer"
      02                 = "02 Through union"
      03                 = 
"03 Through workplace, but don't know if employer or union"
      04                 = 
"04 Through workplace, self-employed or professional association"
      05                 = "05 Purchased directly"
      06                 = 
"06 Through a state/local government or community program"
      07                 = "07 Other"
      08                 = "08 Through school"
      09                 = "09 Through parents"
      10                 = "10 Through relative other than parents"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP539X
      0                  = "0 Zero"
      1                  = "1 Less than $500"
      2                  = "2 $500 - $1,999"
      3                  = "3 $2,000 - $2,999"
      4                  = "4 $3,000 - $4,999"
      5                  = "5 $5,000 or more"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP559X
      01                 = "01 United States"
      02                 = "02 Mexico, Central America, Caribbean Islands"
      03                 = "03 South America"
      04                 = "04 Europe"
      05                 = "05 Russia (and former USSR areas)"
      06                 = "06 Africa"
      07                 = "07 Middle East"
      08                 = "08 Indian Subcontinent"
      09                 = "09 Asia"
      10                 = "10 SE Asia"
      11                 = "11 Elsewhere"
      99                 = "99 Unknown"
   ;
   VALUE PEP560X
      1                  = "1 USA: born in one of the 50 United States or D.C."
      2                  = "2 USA: born in a U.S. territory"
      3                  = "3 Not born in the U.S. or a U.S. territory"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP561X
      1                  = "1 Less than 1 year"
      2                  = "2 1 yr., less than 5 yrs."
      3                  = "3 5 yrs., less than 10 yrs."
      4                  = "4 10 yrs., less than 15 yrs."
      5                  = "5 15 years or more"
      9                  = "9 Unknown"
   ;
   VALUE PEP562X
      1                  = "1 Yes, citizen of the United States"
      2                  = "2 No, not a citizen of the United States"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP565X
      00                 = "00 Never attended/kindergarten only"
      01                 = "01 1st grade"
      02                 = "02 2nd grade"
      03                 = "03 3rd grade"
      04                 = "04 4th grade"
      05                 = "05 5th grade"
      06                 = "06 6th grade"
      07                 = "07 7th grade"
      08                 = "08 8th grade"
      09                 = "09 9th grade"
      10                 = "10 10th grade"
      11                 = "11 11th grade"
      12                 = "12 12th grade, no diploma"
      13                 = "13 GED or equivalent"
      14                 = "14 High School Graduate"
      15                 = "15 Some college, no degree"
      16                 = 
"16 Associate degree: occupational, technical, or vocational program"
      17                 = "17 Associate degree: academic program"
      18                 = "18 Bachelor's degree (Example: BA, AB, BS, BBA)"
      19                 = "19 Master's degree (Example: MA, MS, MEng, MEd, MBA)
"
      20                 = 
"20 Professional School degree (Example: MD, DDS, DVM, JD)"
      21                 = "21 Doctoral degree (Example: PhD, EdD)"
      96                 = "96 Child under 5 years old"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP576X
      1                  = "1 Working for pay at a job or business"
      2                  = "2 With a job or business but not at work"
      3                  = "3 Looking for work"
      4                  = 
"4 Working, but not for pay, at a family-owned job or business"
      5                  = 
"5 Not working at a job or business and not looking for work"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE PEP577X
      01                 = "01 Taking care of house or family"
      02                 = "02 Going to school"
      03                 = "03 Retired"
      04                 = "04 On a planned vacation from work"
      05                 = "05 On family or maternity leave"
      06                 = "06 Temporarily unable to work for health reasons"
      07                 = "07 Have job/contract and off-season"
      08                 = "08 On layoff"
      09                 = "09 Disabled"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP578X
      95                 = "95 95+ hours"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP581X
      01                 = "01 1 month or less"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP582X
      01                 = "01 $01-$4,999"
      02                 = "02 $5,000-$9,999"
      03                 = "03 $10,000-$14,999"
      04                 = "04 $15,000-$19,999"
      05                 = "05 $20,000-$24,999"
      06                 = "06 $25,000-$34,999"
      07                 = "07 $35,000-$44,999"
      08                 = "08 $45,000-$54,999"
      09                 = "09 $55,000-$64,999"
      10                 = "10 $65,000-$74,999"
      11                 = "11 $75,000 and over"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE PEP584X
      1                  = "1 Enter 1 to continue"
      8                  = "8 Not ascertained"
   ;
   VALUE PEP603X
      0                  = "0 No WIC age-eligible family members"
      1                  = "1 At least 1 WIC age-eligible family member"
   ;
   VALUE PEP605X
      0                  = "0 Person not age-eligible"
      1                  = "1 Person age-eligible"
   ;
   VALUE PEP606X
      1                  = "1 Very well"
      2                  = "2 Well"
      3                  = "3 Not well"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;

DATA NHIS.PERSONSX;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=775;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA       8
      WTFA       8

      /* UCF LENGTHS */

      REGION     3   STRAT_P    4   PSU_P      3

      /* HHC LENGTHS */

      SEX        3   ORIGIN_I   3   ORIGIMPT   3   HISPAN_I   3
      HISPIMPT   3   RACERPI2   3   RACEIMP2   3   MRACRPI2   3
      MRACBPI2   3   RACRECI3   3   HISCODI3   3   ERIMPFLG   3
      NOWAF      3   RRP        3   HHREFLG  $ 1   FRRP       3
      DOB_Y_P  $ 4   AGE_P      3   AGE_CHG    3

      /* FID LENGTHS */

      FMRPFLG  $ 1   FMREFLG  $ 1   R_MARITL   3   FSPOUS2  $ 2
      COHAB1     3   COHAB2     3   FCOHAB3  $ 2   CDCMSTAT   3
      SIB_DEGP   3   FMOTHER1 $ 2   MOM_DEGP   3   FFATHER1 $ 2
      DAD_DEGP   3   PARENTS    3   MOM_ED     3   DAD_ED     3
      ASTATFLG   3   CSTATFLG   3   QCADULT    3   QCCHILD    3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* FHS LENGTHS */

      PLAPLYLM   3   PLAPLYUN   3   PSPEDEIS   3   PSPEDEM    3
      PLAADL     3   LABATH     3   LADRESS    3   LAEAT      3
      LABED      3   LATOILT    3   LAHOME     3   PLAIADL    3
      PLAWKNOW   3   PLAWKLIM   3   PLAWALK    3   PLAREMEM   3
      PLIMANY    3   LA1AR      3   LAHCC1     3   LAHCC2     3
      LAHCC3     3   LAHCC4     3   LAHCC5     3   LAHCC6     3
      LAHCC7A    3   LAHCC8     3   LAHCC9     3   LAHCC10    3
      LAHCC11    3   LAHCC12    3   LAHCC13    3   LAHCC90    3
      LAHCC91    3   LCTIME1    3   LCUNIT1    3   LCDURA1    3
      LCDURB1    3   LCCHRC1    3   LCTIME2    3   LCUNIT2    3
      LCDURA2    3   LCDURB2    3   LCCHRC2    3   LCTIME3    3
      LCUNIT3    3   LCDURA3    3   LCDURB3    3   LCCHRC3    3
      LCTIME4    3   LCUNIT4    3   LCDURA4    3   LCDURB4    3
      LCCHRC4    3   LCTIME5    3   LCUNIT5    3   LCDURA5    3
      LCDURB5    3   LCCHRC5    3   LCTIME6    3   LCUNIT6    3
      LCDURA6    3   LCDURB6    3   LCCHRC6    3   LCTIME7A   3
      LCUNIT7A   3   LCDURA7A   3   LCDURB7A   3   LCCHRC7A   3
      LCTIME8    3   LCUNIT8    3   LCDURA8    3   LCDURB8    3
      LCCHRC8    3   LCTIME9    3   LCUNIT9    3   LCDURA9    3
      LCDURB9    3   LCCHRC9    3   LCTIME10   3   LCUNIT10   3
      LCDURA10   3   LCDURB10   3   LCCHRC10   3   LCTIME11   3
      LCUNIT11   3   LCDURA11   3   LCDURB11   3   LCCHRC11   3
      LCTIME12   3   LCUNIT12   3   LCDURA12   3   LCDURB12   3
      LCCHRC12   3   LCTIME13   3   LCUNIT13   3   LCDURA13   3
      LCDURB13   3   LCCHRC13   3   LCTIME90   3   LCUNIT90   3
      LCDURA90   3   LCDURB90   3   LCCHRC90   3   LCTIME91   3
      LCUNIT91   3   LCDURA91   3   LCDURB91   3   LCCHRC91   3
      LAHCA1     3   LAHCA2     3   LAHCA3     3   LAHCA4     3
      LAHCA5     3   LAHCA6     3   LAHCA7     3   LAHCA8     3
      LAHCA9     3   LAHCA10    3   LAHCA11    3   LAHCA12    3
      LAHCA13    3   LAHCA14A   3   LAHCA15    3   LAHCA16    3
      LAHCA17    3   LAHCA18    3   LAHCA19_   3   LAHCA20_   3
      LAHCA21_   3   LAHCA22_   3   LAHCA23_   3   LAHCA24_   3
      LAHCA25_   3   LAHCA26_   3   LAHCA27_   3   LAHCA28_   3
      LAHCA29_   3   LAHCA30_   3   LAHCA31_   3   LAHCA32_   3
      LAHCA33_   3   LAHCA34_   3   LAHCA90    3   LAHCA91    3
      LATIME1    3   LAUNIT1    3   LADURA1    3   LADURB1    3
      LACHRC1    3   LATIME2    3   LAUNIT2    3   LADURA2    3
      LADURB2    3   LACHRC2    3   LATIME3    3   LAUNIT3    3
      LADURA3    3   LADURB3    3   LACHRC3    3   LATIME4    3
      LAUNIT4    3   LADURA4    3   LADURB4    3   LACHRC4    3
      LATIME5    3   LAUNIT5    3   LADURA5    3   LADURB5    3
      LACHRC5    3   LATIME6    3   LAUNIT6    3   LADURA6    3
      LADURB6    3   LACHRC6    3   LATIME7    3   LAUNIT7    3
      LADURA7    3   LADURB7    3   LACHRC7    3   LATIME8    3
      LAUNIT8    3   LADURA8    3   LADURB8    3   LACHRC8    3
      LATIME9    3   LAUNIT9    3   LADURA9    3   LADURB9    3
      LACHRC9    3   LATIME10   3   LAUNIT10   3   LADURA10   3
      LADURB10   3   LACHRC10   3   LATIME11   3   LAUNIT11   3
      LADURA11   3   LADURB11   3   LACHRC11   3   LATIME12   3
      LAUNIT12   3   LADURA12   3   LADURB12   3   LACHRC12   3
      LATIME13   3   LAUNIT13   3   LADURA13   3   LADURB13   3
      LACHRC13   3   LTIME14A   3   LUNIT14A   3   LDURA14A   3
      LDURB14A   3   LCHRC14A   3   LATIME15   3   LAUNIT15   3
      LADURA15   3   LADURB15   3   LACHRC15   3   LATIME16   3
      LAUNIT16   3   LADURA16   3   LADURB16   3   LACHRC16   3
      LATIME17   3   LAUNIT17   3   LADURA17   3   LADURB17   3
      LACHRC17   3   LATIME18   3   LAUNIT18   3   LADURA18   3
      LADURB18   3   LACHRC18   3   LATIME19   3   LAUNIT19   3
      LADURA19   3   LADURB19   3   LACHRC19   3   LATIME20   3
      LAUNIT20   3   LADURA20   3   LADURB20   3   LACHRC20   3
      LATIME21   3   LAUNIT21   3   LADURA21   3   LADURB21   3
      LACHRC21   3   LATIME22   3   LAUNIT22   3   LADURA22   3
      LADURB22   3   LACHRC22   3   LATIME23   3   LAUNIT23   3
      LADURA23   3   LADURB23   3   LACHRC23   3   LATIME24   3
      LAUNIT24   3   LADURA24   3   LADURB24   3   LACHRC24   3
      LATIME25   3   LAUNIT25   3   LADURA25   3   LADURB25   3
      LACHRC25   3   LATIME26   3   LAUNIT26   3   LADURA26   3
      LADURB26   3   LACHRC26   3   LATIME27   3   LAUNIT27   3
      LADURA27   3   LADURB27   3   LACHRC27   3   LATIME28   3
      LAUNIT28   3   LADURA28   3   LADURB28   3   LACHRC28   3
      LATIME29   3   LAUNIT29   3   LADURA29   3   LADURB29   3
      LACHRC29   3   LATIME30   3   LAUNIT30   3   LADURA30   3
      LADURB30   3   LACHRC30   3   LATIME31   3   LAUNIT31   3
      LADURA31   3   LADURB31   3   LACHRC31   3   LATIME32   3
      LAUNIT32   3   LADURA32   3   LADURB32   3   LACHRC32   3
      LATIME33   3   LAUNIT33   3   LADURA33   3   LADURB33   3
      LACHRC33   3   LATIME34   3   LAUNIT34   3   LADURA34   3
      LADURB34   3   LACHRC34   3   LATIME90   3   LAUNIT90   3
      LADURA90   3   LADURB90   3   LACHRC90   3   LATIME91   3
      LAUNIT91   3   LADURA91   3   LADURB91   3   LACHRC91   3
      LCONDRT    3   LACHRONR   3   PHSTAT     3

      /* FAU LENGTHS */

      PDMED12M   3   PNMED12M   3   PHOSPYR2   3   HOSPNO     4
      HPNITE     4   PHCHM2W    3   PHCHMN2W   3   PHCPH2WR   3
      PHCPHN2W   3   PHCDV2W    3   PHCDVN2W   3   P10DVYR    3

      /* FHI LENGTHS */

      NOTCOV     3   COVER      3   COVER65    3   COVER65O   3
      MEDICARE   3   MCPART     3   MCCHOICE   3   MCHMO      3
      MCADVR     3   MCPREM     3   MCREF      3   MCPARTD    3
      MEDICAID   3   MAFLG      3   MACHMD     3   MXCHNG     3
      MEDPREM    3   MDPRINC    3   SINGLE     3   SSTYPEA    3
      SSTYPEB    3   SSTYPEC    3   SSTYPED    3   SSTYPEE    3
      SSTYPEF    3   SSTYPEG    3   SSTYPEH    3   SSTYPEI    3
      SSTYPEJ    3   SSTYPEK    3   SSTYPEL    3   PRIVATE    3
      PRFLG      3   EXCHANGE   3   WHONAM1    3   PRPOLH1    3
      PRCOOH1    3   PLNWRKS1   3   PLNEXCH1   3   EXCHPR1    3
      PLNPAY11   3   PLNPAY21   3   PLNPAY31   3   PLNPAY41   3
      PLNPAY51   3   PLNPAY61   3   PLNPAY71   3   PLNPRE1    3
      HICOSTR1   4   PLNMGD1    3   HDHP1      3   HSAHRA1    3
      MGCHMD1    3   MGPRMD1    3   MGPYMD1    3   PCPREQ1    3
      PRRXCOV1   3   PRDNCOV1   3   PXCHNG     3   PLEXCHPR   3
      PSTRFPRM   3   PSSPRINC   3   PSTDOC     3   WHONAM2    3
      PRPOLH2    3   PRCOOH2    3   PLNWRKS2   3   PLNEXCH2   3
      EXCHPR2    3   PLNPAY12   3   PLNPAY22   3   PLNPAY32   3
      PLNPAY42   3   PLNPAY52   3   PLNPAY62   3   PLNPAY72   3
      PLNPRE2    3   HICOSTR2   4   PLNMGD2    3   HDHP2      3
      HSAHRA2    3   MGCHMD2    3   MGPRMD2    3   MGPYMD2    3
      PCPREQ2    3   PRRXCOV2   3   PRDNCOV2   3   PRPLPLUS   3
      FCOVCONF   3   SCHIP      3   CHFLG      3   CHXCHNG    3
      STRFPRM1   3   CHPRINC    3   STDOC1     3   OTHPUB     3
      OPFLG      3   OPXCHNG    3   PLEXCHOP   3   STRFPRM2   3
      SSPRINC    3   STDOC2     3   OTHGOV     3   OGFLG      3
      OGXCHNG    3   PLEXCHOG   3   STRFPRM3   3   OGPRINC    3
      STDOC3     3   MILCARE    3   MILSPC1    3   MILSPC2    3
      MILSPC3    3   MILSPC4    3   MILMANR    3   IHS        3
      HILAST     3   HISTOP1    3   HISTOP2    3   HISTOP3    3
      HISTOP4    3   HISTOP5    3   HISTOP6    3   HISTOP7    3
      HISTOP8    3   HISTOP9    3   HISTOP10   3   HISTOP11   3
      HISTOP12   3   HISTOP13   3   HISTOP14   3   HISTOP15   3
      HINOTYR    3   HINOTMYR   3   FHICHNG    3   FHIKDBA    3
      FHIKDBB    3   FHIKDBC    3   FHIKDBD    3   FHIKDBE    3
      FHIKDBF    3   FHIKDBG    3   FHIKDBH    3   FHIKDBI    3
      FHIKDBJ    3   FHIKDBK    3   PWRKBR1    3   HCSPFYR    3
      MEDBILL    3   MEDBPAY    3   MEDBNOP    3   FSA        3
      HIKINDNA   3   HIKINDNB   3   HIKINDNC   3   HIKINDND   3
      HIKINDNE   3   HIKINDNF   3   HIKINDNG   3   HIKINDNH   3
      HIKINDNI   3   HIKINDNJ   3   HIKINDNK   3   MCAREPRB   3
      MCAIDPRB   3   SINCOV     3

      /* FSD LENGTHS */

      PLBORN     3   REGIONBR   3   GEOBRTH    3   YRSINUS    3
      CITIZENP   3   HEADST     3   HEADSTV1   3   EDUC1      3
      ARMFVER    3   ARMFEV     3   ARMFFC     3   ARMFTM1P   3
      ARMFTM2P   3   ARMFTM3P   3   ARMFTM4P   3   ARMFTM5P   3
      ARMFTM6P   3   ARMFTM7P   3   DOINGLWP   3   WHYNOWKP   3
      WRKHRS2    3   WRKFTALL   3   WRKLYR1    3   WRKMYR     3
      ERNYR_P    3   HIEMPOF    3

      /* FIN LENGTHS */

      FINCINT    3   PSAL       3   PSEINC     3   PSSRR      3
      PSSRRDB    3   PSSRRD     3   PPENS      3   POPENS     3
      PSSI       3   PSSID      3   PTANF      3   POWBEN     3
      PINTRSTR   3   PDIVD      3   PCHLDSP    3   PINCOT     3
      PSSAPL     3   PSDAPL     3   TANFMYR    3   ELIGPWIC   3
      PWIC       3   WIC_FLAG   3

      /* FLG LENGTHS */

      ENGLANG    3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA         20 -  25 .1
      WTFA         26 -  31

      /* UCF LOCATIONS */

      REGION       32 -  32    STRAT_P      33 -  35
      PSU_P        36 -  37

      /* HHC LOCATIONS */

      SEX          38 -  38    ORIGIN_I     39 -  39
      ORIGIMPT     40 -  40    HISPAN_I     41 -  42
      HISPIMPT     43 -  43    RACERPI2     44 -  45
      RACEIMP2     46 -  46    MRACRPI2     47 -  48
      MRACBPI2     49 -  50    RACRECI3     51 -  51
      HISCODI3     52 -  52    ERIMPFLG     53 -  53
      NOWAF        54 -  54    RRP          55 -  56
      HHREFLG  $   57 -  57    FRRP         58 -  59
      DOB_Y_P  $   60 -  63    AGE_P        64 -  65
      AGE_CHG      66 -  66

      /* FID LOCATIONS */

      FMRPFLG  $   67 -  67    FMREFLG  $   68 -  68
      R_MARITL     69 -  69    FSPOUS2  $   70 -  71
      COHAB1       72 -  72    COHAB2       73 -  73
      FCOHAB3  $   74 -  75    CDCMSTAT     76 -  76
      SIB_DEGP     77 -  77    FMOTHER1 $   78 -  79
      MOM_DEGP     80 -  80    FFATHER1 $   81 -  82
      DAD_DEGP     83 -  83    PARENTS      84 -  84
      MOM_ED       85 -  86    DAD_ED       87 -  88
      ASTATFLG     89 -  89    CSTATFLG     90 -  90
      QCADULT      91 -  91    QCCHILD      92 -  92


      /* FDB LOCATIONS */

      FDRN_FLG     93 -  93

      /* FHS LOCATIONS */

      PLAPLYLM     94 -  94    PLAPLYUN     95 -  95
      PSPEDEIS     96 -  96    PSPEDEM      97 -  97
      PLAADL       98 -  98    LABATH       99 -  99
      LADRESS     100 - 100    LAEAT       101 - 101
      LABED       102 - 102    LATOILT     103 - 103
      LAHOME      104 - 104    PLAIADL     105 - 105
      PLAWKNOW    106 - 106    PLAWKLIM    107 - 107
      PLAWALK     108 - 108    PLAREMEM    109 - 109
      PLIMANY     110 - 110    LA1AR       111 - 111
      LAHCC1      112 - 112    LAHCC2      113 - 113
      LAHCC3      114 - 114    LAHCC4      115 - 115
      LAHCC5      116 - 116    LAHCC6      117 - 117
      LAHCC7A     118 - 118    LAHCC8      119 - 119
      LAHCC9      120 - 120    LAHCC10     121 - 121
      LAHCC11     122 - 122    LAHCC12     123 - 123
      LAHCC13     124 - 124    LAHCC90     125 - 125
      LAHCC91     126 - 126    LCTIME1     127 - 128
      LCUNIT1     129 - 129    LCDURA1     130 - 131
      LCDURB1     132 - 132    LCCHRC1     133 - 133
      LCTIME2     134 - 135    LCUNIT2     136 - 136
      LCDURA2     137 - 138    LCDURB2     139 - 139
      LCCHRC2     140 - 140    LCTIME3     141 - 142
      LCUNIT3     143 - 143    LCDURA3     144 - 145
      LCDURB3     146 - 146    LCCHRC3     147 - 147
      LCTIME4     148 - 149    LCUNIT4     150 - 150
      LCDURA4     151 - 152    LCDURB4     153 - 153
      LCCHRC4     154 - 154    LCTIME5     155 - 156
      LCUNIT5     157 - 157    LCDURA5     158 - 159
      LCDURB5     160 - 160    LCCHRC5     161 - 161
      LCTIME6     162 - 163    LCUNIT6     164 - 164
      LCDURA6     165 - 166    LCDURB6     167 - 167
      LCCHRC6     168 - 168    LCTIME7A    169 - 170
      LCUNIT7A    171 - 171    LCDURA7A    172 - 173
      LCDURB7A    174 - 174    LCCHRC7A    175 - 175
      LCTIME8     176 - 177    LCUNIT8     178 - 178
      LCDURA8     179 - 180    LCDURB8     181 - 181
      LCCHRC8     182 - 182    LCTIME9     183 - 184
      LCUNIT9     185 - 185    LCDURA9     186 - 187
      LCDURB9     188 - 188    LCCHRC9     189 - 189
      LCTIME10    190 - 191    LCUNIT10    192 - 192
      LCDURA10    193 - 194    LCDURB10    195 - 195
      LCCHRC10    196 - 196    LCTIME11    197 - 198
      LCUNIT11    199 - 199    LCDURA11    200 - 201
      LCDURB11    202 - 202    LCCHRC11    203 - 203
      LCTIME12    204 - 205    LCUNIT12    206 - 206
      LCDURA12    207 - 208    LCDURB12    209 - 209
      LCCHRC12    210 - 210    LCTIME13    211 - 212
      LCUNIT13    213 - 213    LCDURA13    214 - 215
      LCDURB13    216 - 216    LCCHRC13    217 - 217
      LCTIME90    218 - 219    LCUNIT90    220 - 220
      LCDURA90    221 - 222    LCDURB90    223 - 223
      LCCHRC90    224 - 224    LCTIME91    225 - 226
      LCUNIT91    227 - 227    LCDURA91    228 - 229
      LCDURB91    230 - 230    LCCHRC91    231 - 231
      LAHCA1      232 - 232    LAHCA2      233 - 233
      LAHCA3      234 - 234    LAHCA4      235 - 235
      LAHCA5      236 - 236    LAHCA6      237 - 237
      LAHCA7      238 - 238    LAHCA8      239 - 239
      LAHCA9      240 - 240    LAHCA10     241 - 241
      LAHCA11     242 - 242    LAHCA12     243 - 243
      LAHCA13     244 - 244    LAHCA14A    245 - 245
      LAHCA15     246 - 246    LAHCA16     247 - 247
      LAHCA17     248 - 248    LAHCA18     249 - 249
      LAHCA19_    250 - 250    LAHCA20_    251 - 251
      LAHCA21_    252 - 252    LAHCA22_    253 - 253
      LAHCA23_    254 - 254    LAHCA24_    255 - 255
      LAHCA25_    256 - 256    LAHCA26_    257 - 257
      LAHCA27_    258 - 258    LAHCA28_    259 - 259
      LAHCA29_    260 - 260    LAHCA30_    261 - 261
      LAHCA31_    262 - 262    LAHCA32_    263 - 263
      LAHCA33_    264 - 264    LAHCA34_    265 - 265
      LAHCA90     266 - 266    LAHCA91     267 - 267
      LATIME1     268 - 269    LAUNIT1     270 - 270
      LADURA1     271 - 272    LADURB1     273 - 273
      LACHRC1     274 - 274    LATIME2     275 - 276
      LAUNIT2     277 - 277    LADURA2     278 - 279
      LADURB2     280 - 280    LACHRC2     281 - 281
      LATIME3     282 - 283    LAUNIT3     284 - 284
      LADURA3     285 - 286    LADURB3     287 - 287
      LACHRC3     288 - 288    LATIME4     289 - 290
      LAUNIT4     291 - 291    LADURA4     292 - 293
      LADURB4     294 - 294    LACHRC4     295 - 295
      LATIME5     296 - 297    LAUNIT5     298 - 298
      LADURA5     299 - 300    LADURB5     301 - 301
      LACHRC5     302 - 302    LATIME6     303 - 304
      LAUNIT6     305 - 305    LADURA6     306 - 307
      LADURB6     308 - 308    LACHRC6     309 - 309
      LATIME7     310 - 311    LAUNIT7     312 - 312
      LADURA7     313 - 314    LADURB7     315 - 315
      LACHRC7     316 - 316    LATIME8     317 - 318
      LAUNIT8     319 - 319    LADURA8     320 - 321
      LADURB8     322 - 322    LACHRC8     323 - 323
      LATIME9     324 - 325    LAUNIT9     326 - 326
      LADURA9     327 - 328    LADURB9     329 - 329
      LACHRC9     330 - 330    LATIME10    331 - 332
      LAUNIT10    333 - 333    LADURA10    334 - 335
      LADURB10    336 - 336    LACHRC10    337 - 337
      LATIME11    338 - 339    LAUNIT11    340 - 340
      LADURA11    341 - 342    LADURB11    343 - 343
      LACHRC11    344 - 344    LATIME12    345 - 346
      LAUNIT12    347 - 347    LADURA12    348 - 349
      LADURB12    350 - 350    LACHRC12    351 - 351
      LATIME13    352 - 353    LAUNIT13    354 - 354
      LADURA13    355 - 356    LADURB13    357 - 357
      LACHRC13    358 - 358    LTIME14A    359 - 360
      LUNIT14A    361 - 361    LDURA14A    362 - 363
      LDURB14A    364 - 364    LCHRC14A    365 - 365
      LATIME15    366 - 367    LAUNIT15    368 - 368
      LADURA15    369 - 370    LADURB15    371 - 371
      LACHRC15    372 - 372    LATIME16    373 - 374
      LAUNIT16    375 - 375    LADURA16    376 - 377
      LADURB16    378 - 378    LACHRC16    379 - 379
      LATIME17    380 - 381    LAUNIT17    382 - 382
      LADURA17    383 - 384    LADURB17    385 - 385
      LACHRC17    386 - 386    LATIME18    387 - 388
      LAUNIT18    389 - 389    LADURA18    390 - 391
      LADURB18    392 - 392    LACHRC18    393 - 393
      LATIME19    394 - 395    LAUNIT19    396 - 396
      LADURA19    397 - 398    LADURB19    399 - 399
      LACHRC19    400 - 400    LATIME20    401 - 402
      LAUNIT20    403 - 403    LADURA20    404 - 405
      LADURB20    406 - 406    LACHRC20    407 - 407
      LATIME21    408 - 409    LAUNIT21    410 - 410
      LADURA21    411 - 412    LADURB21    413 - 413
      LACHRC21    414 - 414    LATIME22    415 - 416
      LAUNIT22    417 - 417    LADURA22    418 - 419
      LADURB22    420 - 420    LACHRC22    421 - 421
      LATIME23    422 - 423    LAUNIT23    424 - 424
      LADURA23    425 - 426    LADURB23    427 - 427
      LACHRC23    428 - 428    LATIME24    429 - 430
      LAUNIT24    431 - 431    LADURA24    432 - 433
      LADURB24    434 - 434    LACHRC24    435 - 435
      LATIME25    436 - 437    LAUNIT25    438 - 438
      LADURA25    439 - 440    LADURB25    441 - 441
      LACHRC25    442 - 442    LATIME26    443 - 444
      LAUNIT26    445 - 445    LADURA26    446 - 447
      LADURB26    448 - 448    LACHRC26    449 - 449
      LATIME27    450 - 451    LAUNIT27    452 - 452
      LADURA27    453 - 454    LADURB27    455 - 455
      LACHRC27    456 - 456    LATIME28    457 - 458
      LAUNIT28    459 - 459    LADURA28    460 - 461
      LADURB28    462 - 462    LACHRC28    463 - 463
      LATIME29    464 - 465    LAUNIT29    466 - 466
      LADURA29    467 - 468    LADURB29    469 - 469
      LACHRC29    470 - 470    LATIME30    471 - 472
      LAUNIT30    473 - 473    LADURA30    474 - 475
      LADURB30    476 - 476    LACHRC30    477 - 477
      LATIME31    478 - 479    LAUNIT31    480 - 480
      LADURA31    481 - 482    LADURB31    483 - 483
      LACHRC31    484 - 484    LATIME32    485 - 486
      LAUNIT32    487 - 487    LADURA32    488 - 489
      LADURB32    490 - 490    LACHRC32    491 - 491
      LATIME33    492 - 493    LAUNIT33    494 - 494
      LADURA33    495 - 496    LADURB33    497 - 497
      LACHRC33    498 - 498    LATIME34    499 - 500
      LAUNIT34    501 - 501    LADURA34    502 - 503
      LADURB34    504 - 504    LACHRC34    505 - 505
      LATIME90    506 - 507    LAUNIT90    508 - 508
      LADURA90    509 - 510    LADURB90    511 - 511
      LACHRC90    512 - 512    LATIME91    513 - 514
      LAUNIT91    515 - 515    LADURA91    516 - 517
      LADURB91    518 - 518    LACHRC91    519 - 519
      LCONDRT     520 - 520    LACHRONR    521 - 521
      PHSTAT      522 - 522

      /* FAU LOCATIONS */

      PDMED12M    523 - 523    PNMED12M    524 - 524
      PHOSPYR2    525 - 525    HOSPNO      526 - 528
      HPNITE      529 - 531    PHCHM2W     532 - 532
      PHCHMN2W    533 - 534    PHCPH2WR    535 - 535
      PHCPHN2W    536 - 537    PHCDV2W     538 - 538
      PHCDVN2W    539 - 540    P10DVYR     541 - 541


      /* FHI LOCATIONS */

      NOTCOV      542 - 542    COVER       543 - 543
      COVER65     544 - 544    COVER65O    545 - 545
      MEDICARE    546 - 546    MCPART      547 - 547
      MCCHOICE    548 - 548    MCHMO       549 - 549
      MCADVR      550 - 550    MCPREM      551 - 551
      MCREF       552 - 552    MCPARTD     553 - 553
      MEDICAID    554 - 554    MAFLG       555 - 555
      MACHMD      556 - 556    MXCHNG      557 - 557
      MEDPREM     558 - 558    MDPRINC     559 - 559
      SINGLE      560 - 560    SSTYPEA     561 - 561
      SSTYPEB     562 - 562    SSTYPEC     563 - 563
      SSTYPED     564 - 564    SSTYPEE     565 - 565
      SSTYPEF     566 - 566    SSTYPEG     567 - 567
      SSTYPEH     568 - 568    SSTYPEI     569 - 569
      SSTYPEJ     570 - 570    SSTYPEK     571 - 571
      SSTYPEL     572 - 572    PRIVATE     573 - 573
      PRFLG       574 - 574    EXCHANGE    575 - 575
      WHONAM1     576 - 576    PRPOLH1     577 - 577
      PRCOOH1     578 - 578    PLNWRKS1    579 - 580
      PLNEXCH1    581 - 581    EXCHPR1     582 - 582
      PLNPAY11    583 - 583    PLNPAY21    584 - 584
      PLNPAY31    585 - 585    PLNPAY41    586 - 586
      PLNPAY51    587 - 587    PLNPAY61    588 - 588
      PLNPAY71    589 - 589    PLNPRE1     590 - 590
      HICOSTR1    591 - 595    PLNMGD1     596 - 596
      HDHP1       597 - 597    HSAHRA1     598 - 598
      MGCHMD1     599 - 599    MGPRMD1     600 - 600
      MGPYMD1     601 - 601    PCPREQ1     602 - 602
      PRRXCOV1    603 - 603    PRDNCOV1    604 - 604
      PXCHNG      605 - 605    PLEXCHPR    606 - 606
      PSTRFPRM    607 - 607    PSSPRINC    608 - 608
      PSTDOC      609 - 609    WHONAM2     610 - 610
      PRPOLH2     611 - 611    PRCOOH2     612 - 612
      PLNWRKS2    613 - 614    PLNEXCH2    615 - 615
      EXCHPR2     616 - 616    PLNPAY12    617 - 617
      PLNPAY22    618 - 618    PLNPAY32    619 - 619
      PLNPAY42    620 - 620    PLNPAY52    621 - 621
      PLNPAY62    622 - 622    PLNPAY72    623 - 623
      PLNPRE2     624 - 624    HICOSTR2    625 - 629
      PLNMGD2     630 - 630    HDHP2       631 - 631
      HSAHRA2     632 - 632    MGCHMD2     633 - 633
      MGPRMD2     634 - 634    MGPYMD2     635 - 635
      PCPREQ2     636 - 636    PRRXCOV2    637 - 637
      PRDNCOV2    638 - 638    PRPLPLUS    639 - 639
      FCOVCONF    640 - 640    SCHIP       641 - 641
      CHFLG       642 - 642    CHXCHNG     643 - 643
      STRFPRM1    644 - 644    CHPRINC     645 - 645
      STDOC1      646 - 646    OTHPUB      647 - 647
      OPFLG       648 - 648    OPXCHNG     649 - 649
      PLEXCHOP    650 - 650    STRFPRM2    651 - 651
      SSPRINC     652 - 652    STDOC2      653 - 653
      OTHGOV      654 - 654    OGFLG       655 - 655
      OGXCHNG     656 - 656    PLEXCHOG    657 - 657
      STRFPRM3    658 - 658    OGPRINC     659 - 659
      STDOC3      660 - 660    MILCARE     661 - 661
      MILSPC1     662 - 662    MILSPC2     663 - 663
      MILSPC3     664 - 664    MILSPC4     665 - 665
      MILMANR     666 - 666    IHS         667 - 667
      HILAST      668 - 668    HISTOP1     669 - 669
      HISTOP2     670 - 670    HISTOP3     671 - 671
      HISTOP4     672 - 672    HISTOP5     673 - 673
      HISTOP6     674 - 674    HISTOP7     675 - 675
      HISTOP8     676 - 676    HISTOP9     677 - 677
      HISTOP10    678 - 678    HISTOP11    679 - 679
      HISTOP12    680 - 680    HISTOP13    681 - 681
      HISTOP14    682 - 682    HISTOP15    683 - 683
      HINOTYR     684 - 684    HINOTMYR    685 - 686
      FHICHNG     687 - 687    FHIKDBA     688 - 688
      FHIKDBB     689 - 689    FHIKDBC     690 - 690
      FHIKDBD     691 - 691    FHIKDBE     692 - 692
      FHIKDBF     693 - 693    FHIKDBG     694 - 694
      FHIKDBH     695 - 695    FHIKDBI     696 - 696
      FHIKDBJ     697 - 697    FHIKDBK     698 - 698
      PWRKBR1     699 - 700    HCSPFYR     701 - 701
      MEDBILL     702 - 702    MEDBPAY     703 - 703
      MEDBNOP     704 - 704    FSA         705 - 705
      HIKINDNA    706 - 706    HIKINDNB    707 - 707
      HIKINDNC    708 - 708    HIKINDND    709 - 709
      HIKINDNE    710 - 710    HIKINDNF    711 - 711
      HIKINDNG    712 - 712    HIKINDNH    713 - 713
      HIKINDNI    714 - 714    HIKINDNJ    715 - 715
      HIKINDNK    716 - 716    MCAREPRB    717 - 717
      MCAIDPRB    718 - 718    SINCOV      719 - 719


      /* FSD LOCATIONS */

      PLBORN      720 - 720    REGIONBR    721 - 722
      GEOBRTH     723 - 723    YRSINUS     724 - 724
      CITIZENP    725 - 725    HEADST      726 - 726
      HEADSTV1    727 - 727    EDUC1       728 - 729
      ARMFVER     730 - 730    ARMFEV      731 - 731
      ARMFFC      732 - 732    ARMFTM1P    733 - 733
      ARMFTM2P    734 - 734    ARMFTM3P    735 - 735
      ARMFTM4P    736 - 736    ARMFTM5P    737 - 737
      ARMFTM6P    738 - 738    ARMFTM7P    739 - 739
      DOINGLWP    740 - 740    WHYNOWKP    741 - 742
      WRKHRS2     743 - 744    WRKFTALL    745 - 745
      WRKLYR1     746 - 746    WRKMYR      747 - 748
      ERNYR_P     749 - 750    HIEMPOF     751 - 751


      /* FIN LOCATIONS */

      FINCINT     752 - 752    PSAL        753 - 753
      PSEINC      754 - 754    PSSRR       755 - 755
      PSSRRDB     756 - 756    PSSRRD      757 - 757
      PPENS       758 - 758    POPENS      759 - 759
      PSSI        760 - 760    PSSID       761 - 761
      PTANF       762 - 762    POWBEN      763 - 763
      PINTRSTR    764 - 764    PDIVD       765 - 765
      PCHLDSP     766 - 766    PINCOT      767 - 767
      PSSAPL      768 - 768    PSDAPL      769 - 769
      TANFMYR     770 - 771    ELIGPWIC    772 - 772
      PWIC        773 - 773    WIC_FLAG    774 - 774


      /* FLG LOCATIONS */

      ENGLANG     775 - 775;

   * DEFINE VARIABLE LABELS;

   LABEL

      /* IDN LABELS */

      RECTYPE    ="File type identifier"
      SRVY_YR    ="Year of National Health Interview Survey"
      HHX        ="Household Number"
      INTV_QRT   ="Interview Quarter"
      INTV_MON   ="Interview Month"
      FMX        ="Family Number"
      FPX        ="Person Number (Within family)"
      WTIA       ="Weight - Interim Annual"
      WTFA       ="Weight - Final Annual"

      /* UCF LABELS */

      REGION     ="Region"
      STRAT_P    ="Pseudo-stratum for public-use file variance estimation"
      PSU_P      ="Pseudo-PSU for public-use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      ORIGIN_I   ="Hispanic Ethnicity"
      ORIGIMPT   ="Hispanic Origin Imputation Flag"
      HISPAN_I   ="Hispanic subgroup detail"
      HISPIMPT   ="Type of Hispanic Origin Imputation Flag"
      RACERPI2   ="OMB groups w/multiple race"
      RACEIMP2   ="Race Imputation Flag"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      RACRECI3   ="Race Recode"
      HISCODI3   ="Race/ethnicity recode"
      ERIMPFLG   ="Ethnicity/Race Imputation Flag"
      NOWAF      ="Armed Forces Status"
      RRP        ="Relationship to the HH reference person"
      HHREFLG    ="HH Reference Person Flag"
      FRRP       ="Relationship to family ref. Person"
      DOB_Y_P    ="Year of Birth"
      AGE_P      ="Age"
      AGE_CHG    ="Indication of AGE correction due to data entry error"

      /* FID LABELS */

      FMRPFLG    ="Family Respondent Flag"
      FMREFLG    ="Family Reference Person Flag"
      R_MARITL   ="Marital Status"
      FSPOUS2    ="Person # of spouse"
      COHAB1     ="Cohabiting person ever married"
      COHAB2     ="Cohabiting person's current marital status"
      FCOHAB3    ="Person # of partner"
      CDCMSTAT   ="CDC standard for legal marital status"
      SIB_DEGP   ="Degree of sibling relationship to HH reference person"
      FMOTHER1   ="Person # of mother"
      MOM_DEGP   ="Type of relationship with Mother"
      FFATHER1   ="Person # of father"
      DAD_DEGP   ="Type of relationship with Father"
      PARENTS    ="Parent(s) present in the family"
      MOM_ED     ="Education of Mother"
      DAD_ED     ="Education of Father"
      ASTATFLG   ="Sample Adult Flag"
      CSTATFLG   ="Sample Child Flag"
      QCADULT    ="Quality control flag for sample adult"
      QCCHILD    ="Quality control flag for sample child"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions flag"

      /* FHS LABELS */

      PLAPLYLM   ="Is - - limited in kind/amount play?"
      PLAPLYUN   ="Is - - able to play at all?"
      PSPEDEIS   ="Does - - receive Special Education or EIS?"
      PSPEDEM    =
"Receive Special Education/EIS due to emotional/behavioral problem"
      PLAADL     ="Does - - need help with personal care?"
      LABATH     ="Does - - need help with bathing/showering?"
      LADRESS    ="Does - - need help dressing?"
      LAEAT      ="Does - - need help eating?"
      LABED      ="Does - - need help in/out of bed or chairs?"
      LATOILT    ="Does - - need help using the toilet?"
      LAHOME     ="Does - - need help to get around in the home?"
      PLAIADL    ="Does - - need help with routine needs?"
      PLAWKNOW   ="Is - - unable to work NOW due to health problem?"
      PLAWKLIM   ="Is - - limited in kind/amount of work?"
      PLAWALK    ="Does - - have difficulty walking without equipment?"
      PLAREMEM   ="Is - - limited by difficulty remembering?"
      PLIMANY    ="Is - - limited in any (other) way?"
      LA1AR      ="Any limitation - all persons, all conditions"
      LAHCC1     ="Vision/problem seeing causes limitation"
      LAHCC2     ="Hearing problem causes limitation"
      LAHCC3     ="Speech problem causes limitation"
      LAHCC4     ="Asthma/breathing problem causes limitation"
      LAHCC5     ="Birth defect causes limitation"
      LAHCC6     ="Injury causes limitation"
      LAHCC7A    =
"Intellectual disability, also known as mental retardation causes limitation"
      LAHCC8     =
"Other developmental problem (e.g., cerebral palsy) causes limitation"
      LAHCC9     =
"Other mental, emotional, or behavioral problem causes limitation"
      LAHCC10    ="Bone, joint, or muscle problem causes limitation"
      LAHCC11    ="Epilepsy or seizures cause limitation"
      LAHCC12    ="Learning disability causes limitation"
      LAHCC13    =
"Attention Deficit/Hyperactivity Disorder (ADD/ADHD) causes limitation"
      LAHCC90    ="Other impairment/problem (1) causes limitation"
      LAHCC91    ="Other impairment/problem (2) causes limitation"
      LCTIME1    ="Duration of vision problem: Number of units"
      LCUNIT1    ="Duration of vision problem: Time unit"
      LCDURA1    ="Duration of vision problem (in years)"
      LCDURB1    ="Duration of vision problem recode 2"
      LCCHRC1    ="Vision problem condition status"
      LCTIME2    ="Duration of hearing problem: Number of units"
      LCUNIT2    ="Duration of hearing problem: Time unit"
      LCDURA2    ="Duration of hearing problem (in years)"
      LCDURB2    ="Duration of hearing problem recode 2"
      LCCHRC2    ="Hearing problem condition status"
      LCTIME3    ="Duration of speech problem: Number of units"
      LCUNIT3    ="Duration of speech problem: Time unit"
      LCDURA3    ="Duration of speech problem (in years)"
      LCDURB3    ="Duration of speech problem recode 2"
      LCCHRC3    ="Speech problem condition status"
      LCTIME4    ="Duration of asthma/breathing problem: Number of units"
      LCUNIT4    ="Duration of asthma/breathing problem: Time unit"
      LCDURA4    ="Duration of asthma/breathing problem (in years)"
      LCDURB4    ="Duration of asthma/breathing problem recode 2"
      LCCHRC4    ="Asthma/breathing problem condition status"
      LCTIME5    ="Duration of birth defect: Number of units"
      LCUNIT5    ="Duration of birth defect: Time unit"
      LCDURA5    ="Duration of birth defect (in years)"
      LCDURB5    ="Duration of birth defect recode 2"
      LCCHRC5    ="Birth defect condition status"
      LCTIME6    ="Duration of injury: Number of units"
      LCUNIT6    ="Duration of injury: Time unit"
      LCDURA6    ="Duration of injury (in years)"
      LCDURB6    ="Duration of injury recode 2"
      LCCHRC6    ="Injury condition status"
      LCTIME7A   =
"Duration of intellectual disability, AKA mental retardation: Number of units"
      LCUNIT7A   =
"Duration of intellectual disability, also known as mental retardation: Time uni
t"
      LCDURA7A   =
"Duration of intellectual disability, also known as mental retardation (in years
)"
      LCDURB7A   =
"Duration of intellectual disability, also known as mental retardation recode 2"
      LCCHRC7A   =
"Intellectual disability, also known as mental retardation condition status"
      LCTIME8    ="Duration of other developmental problem: Number of units"
      LCUNIT8    ="Duration of other developmental problem: Time unit"
      LCDURA8    ="Duration of other developmental problem (in years)"
      LCDURB8    ="Duration of other developmental problem recode 2"
      LCCHRC8    ="Other developmental problem condition status"
      LCTIME9    =
"Duration of other mental/emotional/behavioral problem: Number of units"
      LCUNIT9    =
"Duration of other mental, emotional, or behavioral problem: Number of units"
      LCDURA9    =
"Duration of other mental, emotional, or behavioral problem (in years)"
      LCDURB9    =
"Duration of other mental, emotional, or behavioral problem recode 2"
      LCCHRC9    =
"Other mental, emotional, or behavioral problem condition status"
      LCTIME10   ="Duration of bone, joint, or muscle problem: Number of units"
      LCUNIT10   ="Duration of bone, joint, or muscle problem: Time unit"
      LCDURA10   ="Duration of bone, joint, or muscle problem (in years)"
      LCDURB10   ="Duration of bone, joint, or muscle problem recode 2"
      LCCHRC10   ="Bone, joint, or muscle problem condition status"
      LCTIME11   ="Duration of epilepsy or seizures: Number of units"
      LCUNIT11   ="Duration of epilepsy or seizures: Time unit"
      LCDURA11   ="Duration of epilepsy or seizures (in years)"
      LCDURB11   ="Duration of epilepsy or seizures recode 2"
      LCCHRC11   ="Epilepsy or seizures condition status"
      LCTIME12   ="Duration of learning disability: Number of units"
      LCUNIT12   ="Duration of learning disability: Time unit"
      LCDURA12   ="Duration of learning disability (in years)"
      LCDURB12   ="Duration of learning disability recode 2"
      LCCHRC12   ="Learning disability condition status"
      LCTIME13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD): Number of unit
s"
      LCUNIT13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD): Time unit"
      LCDURA13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD) (in years)"
      LCDURB13   =
"Duration of attention deficit/hyperactivity disorder (ADD/ADHD) recode 2"
      LCCHRC13   =
"Attention deficit/hyperactivity disorder (ADD/ADHD) condition status"
      LCTIME90   ="Duration of other impairment problem (1): Number of units"
      LCUNIT90   ="Duration of other impairment/problem (1): Time unit"
      LCDURA90   ="Duration of other impairment/problem (1) (in years)"
      LCDURB90   ="Duration of other impairment/problem (1) recode 2"
      LCCHRC90   ="Other impairment/problem (1) condition status"
      LCTIME91   ="Duration of other impairment/problem (2): Number of units"
      LCUNIT91   ="Duration of other impairment/problem (2): Time unit"
      LCDURA91   ="Duration of other impairment/problem (2) (in years)"
      LCDURB91   ="Duration of other impairment/problem (2) recode 2"
      LCCHRC91   ="Other impairment/problem (2) condition status"
      LAHCA1     ="Vision/problem seeing causes limitation"
      LAHCA2     ="Hearing problem causes limitation"
      LAHCA3     ="Arthritis/rheumatism causes limitation"
      LAHCA4     ="Back or neck problem causes limitation"
      LAHCA5     ="Fracture, bone/joint injury causes limitation"
      LAHCA6     ="Other injury causes limitation"
      LAHCA7     ="Heart problem causes limitation"
      LAHCA8     ="Stroke problem causes limitation"
      LAHCA9     ="Hypertension/high blood pressure causes limitation"
      LAHCA10    ="Diabetes causes limitation"
      LAHCA11    =
"Lung/breathing problem (e.g., asthma and emphysema) causes limitation"
      LAHCA12    ="Cancer causes limitation"
      LAHCA13    ="Birth defect causes limitation"
      LAHCA14A   =
"Intellectual disability, also known as mental retardation causes limitation"
      LAHCA15    =
"Other developmental problem (e.g., cerebral palsy) causes limitation"
      LAHCA16    ="Senility causes limitation"
      LAHCA17    ="Depression/anxiety/emotional problem causes limitation"
      LAHCA18    ="Weight problem causes limitation"
      LAHCA19_   ="Missing or amputated limb/finger/digit causes limitation"
      LAHCA20_   ="Musculoskeletal/connective tissue problem causes limitation"
      LAHCA21_   ="Circulation problems (including blood clots) cause limitation
"
      LAHCA22_   ="Endocrine/nutritional/metabolic problem causes limitation"
      LAHCA23_   ="Nervous system/sensory organ condition causes limitation"
      LAHCA24_   ="Digestive system problem causes limitation"
      LAHCA25_   ="Genitourinary system problem causes limitation"
      LAHCA26_   ="Skin/subcutaneous system problem causes limitation"
      LAHCA27_   ="Blood or blood-forming organ problem causes limitation"
      LAHCA28_   ="Benign tumor/cyst causes limitation"
      LAHCA29_   ="Alcohol/drug/substance abuse problem causes limitation"
      LAHCA30_   =
"Other mental problem/ADD/bipolar/schizophrenia causes limitation"
      LAHCA31_   ="Surgical after-effects/medical treatment causes limitation"
      LAHCA32_   ='"Old age"/elderly/aging-related problem causes limitation'
      LAHCA33_   ="Fatigue/tiredness/weakness causes limitation"
      LAHCA34_   ="Pregnancy-related problem causes limitation"
      LAHCA90    ="Other impairment/problem (1) causes limitation"
      LAHCA91    ="Other impairment/problem (2) causes limitation"
      LATIME1    ="Duration of vision problem: Number of units"
      LAUNIT1    ="Duration of vision problem: Time unit"
      LADURA1    ="Duration of vision problem (in years)"
      LADURB1    ="Duration of vision problem recode 2"
      LACHRC1    ="Vision problem condition status"
      LATIME2    ="Duration of hearing problem: Number of units"
      LAUNIT2    ="Duration of hearing problem: Time unit"
      LADURA2    ="Duration of hearing problem (in years)"
      LADURB2    ="Duration of hearing problem recode 2"
      LACHRC2    ="Hearing problem condition status"
      LATIME3    ="Duration of arthritis/rheumatism: Number of units"
      LAUNIT3    ="Duration of arthritis/rheumatism: Time unit"
      LADURA3    ="Duration of arthritis/rheumatism (in years)"
      LADURB3    ="Duration of arthritis/rheumatism recode 2"
      LACHRC3    ="Arthritis/rheumatism condition status"
      LATIME4    ="Duration of back or neck problem: Number of units"
      LAUNIT4    ="Duration of back or neck problem: Time unit"
      LADURA4    ="Duration of back or neck problem (in years)"
      LADURB4    ="Duration of back or neck problem recode 2"
      LACHRC4    ="Back or neck problem condition status"
      LATIME5    ="Duration of fracture, bone/joint injury: Number of units"
      LAUNIT5    ="Duration of fracture, bone/joint injury: Time unit"
      LADURA5    ="Duration of fracture, bone/joint injury (in years)"
      LADURB5    ="Duration of fracture, bone/joint injury recode 2"
      LACHRC5    ="Fracture, bone/joint injury condition status"
      LATIME6    ="Duration of other injury: Number of units"
      LAUNIT6    ="Duration of other injury: Time unit"
      LADURA6    ="Duration of other injury (in years)"
      LADURB6    ="Duration of other injury recode 2"
      LACHRC6    ="Other injury condition status"
      LATIME7    ="Duration of heart problem: Number of units"
      LAUNIT7    ="Duration of heart problem: Time unit"
      LADURA7    ="Duration of heart problem (in years)"
      LADURB7    ="Duration of heart problem recode 2"
      LACHRC7    ="Heart problem condition status"
      LATIME8    ="Duration of stroke problem: Number of units"
      LAUNIT8    ="Duration of stroke problem: Time unit"
      LADURA8    ="Duration of stroke problem (in years)"
      LADURB8    ="Duration of stroke problem recode 2"
      LACHRC8    ="Stroke problem condition status"
      LATIME9    =
"Duration of hypertension or high blood pressure: Number of units"
      LAUNIT9    ="Duration of hypertension or high blood pressure: Time unit"
      LADURA9    ="Duration of hypertension or high blood pressure (in years)"
      LADURB9    ="Duration of hypertension or high blood pressure: recode 2"
      LACHRC9    ="Hypertension or high blood pressure condition status"
      LATIME10   ="Duration of diabetes: Number of units"
      LAUNIT10   ="Duration of diabetes: Time unit"
      LADURA10   ="Duration of diabetes (in years)"
      LADURB10   ="Duration of diabetes recode 2"
      LACHRC10   ="Diabetes condition status"
      LATIME11   =
"Duration of lung or breathing problem (eg asthma and emphysema): Number of unit
s"
      LAUNIT11   =
"Duration of lung or breathing problem (e.g., asthma and emphysema): Time unit"
      LADURA11   =
"Duration of lung or breathing problem (e.g., asthma and emphysema) (in years)"
      LADURB11   =
"Duration of lung or breathing problem (e.g., asthma and emphysema): recode 2"
      LACHRC11   =
"Lung or breathing problem (e.g., asthma and emphysema): condition status"
      LATIME12   ="Duration of cancer: Number of units"
      LAUNIT12   ="Duration of cancer: Time unit"
      LADURA12   ="Duration of cancer (in years)"
      LADURB12   ="Duration of cancer recode 2"
      LACHRC12   ="Cancer condition status"
      LATIME13   ="Duration of birth defect: Number of units"
      LAUNIT13   ="Duration of birth defect: Time unit"
      LADURA13   ="Duration of birth defect (in years)"
      LADURB13   ="Duration of birth defect recode 2"
      LACHRC13   ="Birth defect condition status"
      LTIME14A   =
"Duration of intellectual disability, AKA mental retardation: Number of units"
      LUNIT14A   =
"Duration of intellectual disability, also known as mental retardation: Time uni
t"
      LDURA14A   =
"Duration of intellectual disability, also known as mental retardation (in years
)"
      LDURB14A   =
"Duration of intellectual disability, also known as mental retardation recode 2"
      LCHRC14A   =
"Intellectual disability, also known as mental retardation condition status"
      LATIME15   =
"Duration of other developmental problem (e.g., cerebral palsy): Number of units
"
      LAUNIT15   =
"Duration of other developmental problem (e.g., cerebral palsy): Time unit"
      LADURA15   =
"Duration of other developmental problem (e.g., cerebral palsy) (in years)"
      LADURB15   =
"Duration of other developmental problem (e.g., cerebral palsy) recode 2"
      LACHRC15   =
"Other developmental problem (e.g., cerebral palsy) condition status"
      LATIME16   ="Duration of senility: Number of units"
      LAUNIT16   ="Duration of senility: Time unit"
      LADURA16   ="Duration of senility (in years)"
      LADURB16   ="Duration of senility recode 2"
      LACHRC16   ="Senility condition status"
      LATIME17   =
"Duration of depression, anxiety, or emotional problem: Number of units"
      LAUNIT17   =
"Duration of depression, anxiety, or emotional problem: Time unit"
      LADURA17   =
"Duration of depression, anxiety, or emotional problem (in years)"
      LADURB17   =
"Duration of depression, anxiety, or emotional problem recode 2"
      LACHRC17   ="Depression/anxiety/emotional problem condition status"
      LATIME18   ="Duration of weight problem: Number of units"
      LAUNIT18   ="Duration of weight problem: Time unit"
      LADURA18   ="Duration of weight problem (in years)"
      LADURB18   ="Duration of weight problem recode 2"
      LACHRC18   ="Weight problem condition status"
      LATIME19   =
"Duration of missing limbs (fingers, toes); amputation: Number of units"
      LAUNIT19   =
"Duration of missing limbs (fingers, toes, or digits); amputation: Time unit"
      LADURA19   =
"Duration of missing limbs (fingers, toes, or digits); amputation (in years)"
      LADURB19   =
"Duration of missing limbs (fingers, toes, or digits); amputation recode 2"
      LACHRC19   =
"Missing limbs (fingers, toes, or digits); amputation condition status"
      LATIME20   =
"Duration of musculoskeletal/connective tissue problem: Number of units"
      LAUNIT20   =
"Duration of musculoskeletal/connective tissue problem: Time unit"
      LADURA20   =
"Duration of musculoskeletal/connective tissue problem (in years)"
      LADURB20   =
"Duration of musculoskeletal/connective tissue problem recode 2"
      LACHRC20   ="Musculoskeletal/connective tissue problem condition status"
      LATIME21   =
"Duration of circulation problems (including blood clots) : Number of units"
      LAUNIT21   =
"Duration of circulation problems (including blood clots): Time unit"
      LADURA21   =
"Duration of circulation problems (including blood clots) (in years)"
      LADURB21   =
"Duration of circulation problems (including blood clots) recode 2"
      LACHRC21   ="Circulation problems (including blood clots) condition status
"
      LATIME22   =
"Duration of endocrine/nutritional/metabolic problem: Number of units"
      LAUNIT22   =
"Duration of endocrine/nutritional/metabolic problem: Time unit"
      LADURA22   =
"Duration of endocrine/nutritional/metabolic problem (in years)"
      LADURB22   ="Duration of endocrine/nutritional/metabolic problem recode 2"
      LACHRC22   ="Endocrine/nutritional/metabolic problem condition status"
      LATIME23   =
"Duration of nervous system /sensory organ condition: Number of units"
      LAUNIT23   ="Duration of nervous system/sensory organ condition: Time unit
"
      LADURA23   ="Duration of nervous system/sensory organ condition (in years)
"
      LADURB23   ="Duration of nervous system/sensory organ condition recode 2"
      LACHRC23   ="Nervous system/sensory organ condition status"
      LATIME24   ="Duration of digestive system problems: Number of units"
      LAUNIT24   ="Duration of digestive system problems: Number of units"
      LADURA24   ="Duration of digestive system problems (in years)"
      LADURB24   ="Duration of digestive system problems recode 2"
      LACHRC24   ="Digestive system problems condition status"
      LATIME25   ="Duration of genitourinary system problem: Number of units"
      LAUNIT25   ="Duration of genitourinary system problem: Time unit"
      LADURA25   ="Duration of genitourinary system problem (in years)"
      LADURB25   ="Duration of genitourinary system problem recode 2"
      LACHRC25   ="Genitourinary system problem condition status"
      LATIME26   =
"Duration of skin/subcutaneous system problems: Number of units"
      LAUNIT26   ="Duration of skin/subcutaneous system problems: Time unit"
      LADURA26   ="Duration of skin/subcutaneous system problems (in years)"
      LADURB26   ="Duration of skin/subcutaneous system problem recode 2"
      LACHRC26   ="Skin/subcutaneous system problems condition status"
      LATIME27   =
"Duration of blood or blood-forming organ problem: Number of units"
      LAUNIT27   ="Duration of blood or blood-forming organ problem: Time unit"
      LADURA27   ="Duration of blood or blood-forming organ problem (in years)"
      LADURB27   ="Duration of blood or blood-forming organ problem recode 2"
      LACHRC27   ="Blood or blood-forming organ problem condition status"
      LATIME28   ="Duration of benign tumor/cyst: Number of units"
      LAUNIT28   ="Duration of benign tumor/cyst: Time unit"
      LADURA28   ="Duration of benign tumor/cyst (in years)"
      LADURB28   ="Duration of benign tumor/cyst recode 2"
      LACHRC28   ="Benign tumor/cyst condition status"
      LATIME29   =
"Duration of alcohol/drug/substance abuse problem: Number of units"
      LAUNIT29   ="Duration of alcohol/drug/substance abuse problem: Time unit"
      LADURA29   ="Duration of alcohol/drug/substance abuse problem (in years)"
      LADURB29   ="Duration of alcohol/drug/substance abuse problem recode 2"
      LACHRC29   ="Alcohol/drug/substance abuse problem condition status"
      LATIME30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Number of units"
      LAUNIT30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Time unit"
      LADURA30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia (in years)"
      LADURB30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia recode 2"
      LACHRC30   =
"Other mental problem/ADD/Bipolar/Schizophrenia condition status"
      LATIME31   =
"Duration of surgical after-effects/medical treatment problems: Number of units"
      LAUNIT31   =
"Duration of surgical after-effects/medical treatment problems: Time unit"
      LADURA31   =
"Duration of surgical after-effects/medical treatment problems (in years)"
      LADURB31   =
"Duration of surgical after-effects/medical treatment problems recode 2"
      LACHRC31   =
"Surgical after-effects/medical treatment problems condition status"
      LATIME32   =
'Duration of "old age"/elderly/aging-related problems: Number of units'
      LAUNIT32   =
'Duration of "old age"/elderly/aging-related problems: Number of units'
      LADURA32   =
'Duration of "old age"/elderly/aging-related problems (in years)'
      LADURB32   ='Duration of "old age"/elderly/aging-related problems recode 2
'
      LACHRC32   ='"Old age"/elderly/aging-related problems condition status'
      LATIME33   =
"Duration of fatigue/tiredness/weakness problem: Number of units"
      LAUNIT33   ="Duration of fatigue/tiredness/weakness problem: Time unit"
      LADURA33   ="Duration of fatigue/tiredness/weakness problem (in years)"
      LADURB33   ="Duration of fatigue/tiredness/weakness problem recode 2"
      LACHRC33   ="Fatigue/tiredness/weakness problem condition status"
      LATIME34   ="Duration of pregnancy-related problem: Number of units"
      LAUNIT34   ="Duration of pregnancy-related problem: Time unit"
      LADURA34   ="Duration of pregnancy-related problem (in years)"
      LADURB34   ="Duration of pregnancy-related problem recode 2"
      LACHRC34   ="Pregnancy-related condition status"
      LATIME90   =
"Duration of other impairment/problem N.E.C. (1): Number of units"
      LAUNIT90   ="Duration of other impairment/problem N.E.C. (1): Time unit"
      LADURA90   ="Duration of other impairment/problem N.E.C. (1) (in years)"
      LADURB90   ="Duration of other impairment/problem N.E.C. (1) recode 2"
      LACHRC90   ="Other impairment/problem N.E.C. (1) condition status"
      LATIME91   =
"Duration of other impairment/problem N.E.C. (2): Number of units"
      LAUNIT91   ="Duration of other impairment/problem N.E.C. (2): Time unit"
      LADURA91   ="Duration of other impairment/problem N.E.C. (2) (in years)"
      LADURB91   ="Duration of other impairment/problem N.E.C. (2) recode 2"
      LACHRC91   ="Other impairment/problem N.E.C. (2) condition status"
      LCONDRT    =
"Chronic condition recode for person with limitation of activity"
      LACHRONR   ="Limitation of activity recode by chronic condition status"
      PHSTAT     ="Reported health status"

      /* FAU LABELS */

      PDMED12M   ="Has medical care been delayed for - - (cost), 12m"
      PNMED12M   ="Did - - need and NOT get medical care (cost), 12m"
      PHOSPYR2   ="Has - - been in a hospital OVERNIGHT, 12m"
      HOSPNO     ="Number of times in hospital overnight, 12m"
      HPNITE     ="Number of nights in hospital, 12m"
      PHCHM2W    ="Did - - receive HOME care by health professional, 2 wk"
      PHCHMN2W   ="Number of HOME visits by health professional, 2wk"
      PHCPH2WR   ="Did--get advice/test results by phone, 2wk"
      PHCPHN2W   ="Number of PHONE calls to health professional, 2wk"
      PHCDV2W    ="Did - - see health professional in office, etc, 2wk"
      PHCDVN2W   ="Number of times VISITED health professional, 2wk"
      P10DVYR    ="Did - - receive care 10+ times, 12m"

      /* FHI LABELS */

      NOTCOV     ="Cov stat as used in Health United States"
      COVER      ="Health insurance hierarchy under 65"
      COVER65    ="Health insurance hierarchy 65+"
      COVER65O   ="Original health insurance hierarchy 65+"
      MEDICARE   ="Medicare coverage recode"
      MCPART     ="Type of Medicare coverage"
      MCCHOICE   ="Enrolled in Medicare Advantage Plan"
      MCHMO      ="Is - - signed up with an HMO"
      MCADVR     ="Medicare Advantage Plan"
      MCPREM     ="Premium for Medicare Advantage/ Medicare HMO"
      MCREF      ="Need a referral for special care"
      MCPARTD    ="Medicare Part D"
      MEDICAID   ="Medicaid coverage recode"
      MAFLG      ="Medicaid reassignment flag"
      MACHMD     ="Any doc, chooses from a list, doc assigned"
      MXCHNG     ="Medicaid Exchange"
      MEDPREM    ="Medicaid Premium"
      MDPRINC    ="Medicaid Premium based on income"
      SINGLE     ="Single service plan recode"
      SSTYPEA    ="Accidents"
      SSTYPEB    ="AIDS care"
      SSTYPEC    ="Cancer treatment"
      SSTYPED    ="Catastrophic care"
      SSTYPEE    ="Dental care"
      SSTYPEF    ="Disability insurance"
      SSTYPEG    ="Hospice care"
      SSTYPEH    ="Hospitalization only"
      SSTYPEI    ="Long-term care"
      SSTYPEJ    ="Prescriptions"
      SSTYPEK    ="Vision care"
      SSTYPEL    ="Other"
      PRIVATE    ="Private health insurance recode"
      PRFLG      ="Private reassignment flag"
      EXCHANGE   ="Plan through Health Insurance Exchange, NCHS algorithm"
      WHONAM1    ="Plan in whose name (Plan 1)"
      PRPOLH1    ="Relationship to outside policyholder (Plan 1)"
      PRCOOH1    ="Covered persons outside family roster (Plan 1)"
      PLNWRKS1   ="How plan was originally obtained (Plan 1)"
      PLNEXCH1   ="Health Plan obtained through the MarketPlace (Plan 1)"
      EXCHPR1    ="Exchange company coding, NCHS (Plan 1)"
      PLNPAY11   ="Paid for by self or family (Plan 1)"
      PLNPAY21   ="Paid for by employer or union (Plan 1)"
      PLNPAY31   ="Paid for by someone outside the household (Plan 1)"
      PLNPAY41   ="Paid for by Medicare (Plan 1)"
      PLNPAY51   ="Paid for by Medicaid (Plan 1)"
      PLNPAY61   ="Paid for by CHIP (Plan 1)"
      PLNPAY71   ="Paid for by government program (Plan 1)"
      PLNPRE1    ="Premium based on income (Plan 1)"
      HICOSTR1   ="Out-of-pocket premium cost (Plan 1)"
      PLNMGD1    ="Type of private plan (Plan 1)"
      HDHP1      ="High deductible health plan (Plan 1)"
      HSAHRA1    =
"Health Savings Accounts/Health Reimbursement Accounts (plan 1)"
      MGCHMD1    ="Doctor choice (Plan 1)"
      MGPRMD1    ="Preferred list (Plan 1)"
      MGPYMD1    ="Out of plan use (Plan 1)"
      PCPREQ1    ="Primary care doctor required (Plan 1)"
      PRRXCOV1   ="Prescription drug benefit (Plan 1)"
      PRDNCOV1   ="Dental Coverage (Plan 1)"
      PXCHNG     =
"Marketplace or state exchange, reassigned from public to private"
      PLEXCHPR   =
"Exchange company coding, NCHS, reassigned from public to private"
      PSTRFPRM   =
"Premium or enrollment fee on plan reassigned from public to private"
      PSSPRINC   =
"Premium based on income on plan reassigned from public to private"
      PSTDOC     =
"Any dr, chooses from list, dr assigned on plan reassigned from public to privat
e"
      WHONAM2    ="Plan in whose name (Plan 2)"
      PRPOLH2    ="Relationship to outside policyholder (Plan 2)"
      PRCOOH2    ="Covered persons outside family roster (Plan 2)"
      PLNWRKS2   ="How plan was originally obtained (Plan 2)"
      PLNEXCH2   ="Health Plan obtained through the MarketPlace (Plan 2)"
      EXCHPR2    ="Exchange company coding, NCHS (Plan 2)"
      PLNPAY12   ="Paid for by self or family (Plan 2)"
      PLNPAY22   ="Paid for by employer or union (Plan 2)"
      PLNPAY32   ="Paid for by someone outside the household (Plan 2)"
      PLNPAY42   ="Paid for by Medicare (Plan 2)"
      PLNPAY52   ="Paid for by Medicaid (Plan 2)"
      PLNPAY62   ="Paid for by CHIP (Plan 2)"
      PLNPAY72   ="Paid for by government program (Plan 2)"
      PLNPRE2    ="Premium based on income (Plan 2)"
      HICOSTR2   ="Out-of-pocket premium cost (Plan 2)"
      PLNMGD2    ="Type of private plan (plan 2)"
      HDHP2      ="High deductible health plan (Plan 2)"
      HSAHRA2    =
"Health Savings Accounts/Health Reimbursement Accounts (plan 2)"
      MGCHMD2    ="Doctor choice (Plan 2)"
      MGPRMD2    ="Preferred list (Plan 2)"
      MGPYMD2    ="Out of plan use (Plan 2)"
      PCPREQ2    ="Primary care doctor required (Plan 2)"
      PRRXCOV2   ="Prescription drug benefit (Plan 2)"
      PRDNCOV2   ="Dental Coverage (Plan 2)"
      PRPLPLUS   ="Person has more than two private plans"
      FCOVCONF   ="Obtaining affordable coverage"
      SCHIP      ="SCHIP coverage recode"
      CHFLG      ="CHIP reassignment flag"
      CHXCHNG    ="CHIP Exchange"
      STRFPRM1   ="CHIP Premium"
      CHPRINC    ="CHIP Premium based on income"
      STDOC1     ="Any doc, chooses from a list, doc assigned (SCHIP)"
      OTHPUB     ="State-sponsored health plan recode"
      OPFLG      ="Other public reassignment flag"
      OPXCHNG    ="Other state program Exchange"
      PLEXCHOP   ="Exchange company coding, NCHS (OTHPUB)"
      STRFPRM2   ="Other state program premium"
      SSPRINC    ="Other state program premium based on income"
      STDOC2     ="Any doc, chooses from a list, doc assigned (OTHPUB)"
      OTHGOV     ="Other government program recode"
      OGFLG      ="Other government reassignment flag"
      OGXCHNG    ="Other government program Exchange"
      PLEXCHOG   ="Exchange company coding, NCHS (OTHGOV)"
      STRFPRM3   ="Other government program Premium"
      OGPRINC    ="Other government program Premium based on income"
      STDOC3     ="Any doc, chooses from a list, doc assigned (OTHGOV)"
      MILCARE    ="Military health care coverage recode"
      MILSPC1    ="TRICARE coverage"
      MILSPC2    ="VA coverage"
      MILSPC3    ="CHAMP-VA coverage"
      MILSPC4    ="Other military coverage"
      MILMANR    ="Type of TRICARE coverage"
      IHS        ="Indian Health Service recode"
      HILAST     ="How long since last had health coverage"
      HISTOP1    ="Lost job or changed employers"
      HISTOP2    ="Divorced/sep/death of spouse or parent"
      HISTOP3    ="Ineligible because of age/left school"
      HISTOP4    ="Employer does not offer/not eligible for cov"
      HISTOP5    ="Cost is too high"
      HISTOP6    ="Insurance company refused coverage"
      HISTOP7    ="Medicaid/medi plan stopped after pregnancy"
      HISTOP8    ="Lost Medicaid/new job/increase in income"
      HISTOP9    ="Lost Medicaid (other)"
      HISTOP10   ="Other"
      HISTOP11   ="Never had health insurance"
      HISTOP12   ="Moved from another county/state/country"
      HISTOP13   ="Self-employed"
      HISTOP14   ="No need for it/chooses not to have"
      HISTOP15   ="Got married"
      HINOTYR    ="No health coverage during past 12 months"
      HINOTMYR   ="Months without coverage in past 12 months"
      FHICHNG    ="No change in coverage in past 12 months"
      FHIKDBA    ="Had private health insurance coverage in the past 12 months"
      FHIKDBB    ="Had Medicare coverage in the past 12 months"
      FHIKDBC    ="Had Medi-Gap coverage in the past 12 months"
      FHIKDBD    ="Had Medicaid coverage in the past 12 months"
      FHIKDBE    ="Had SCHIP coverage in the past 12 months"
      FHIKDBF    ="Had Military health care coverage in the past 12 months"
      FHIKDBG    ="Had Indian Health Service coverage in the past 12 months"
      FHIKDBH    =
"Had State-sponsored health plan coverage in the past 12 months"
      FHIKDBI    ="Had Other government program coverage in the past 12 months"
      FHIKDBJ    ="Had Single service plan coverage in the past 12 months"
      FHIKDBK    ="Had no coverage in the past 12 months"
      PWRKBR1    ="How previous private coverage was obtained"
      HCSPFYR    ="Amount family spent for medical care"
      MEDBILL    ="Problems paying medical bills"
      MEDBPAY    ="Medical bills being paid off over time"
      MEDBNOP    ="Unable to pay medical bills"
      FSA        ="Flexible Spending Accounts"
      HIKINDNA   ="Private health insurance"
      HIKINDNB   ="Medicare"
      HIKINDNC   ="Medi-Gap"
      HIKINDND   ="Medicaid"
      HIKINDNE   ="SCHIP"
      HIKINDNF   ="Military health care"
      HIKINDNG   ="Indian Health Service"
      HIKINDNH   ="State-sponsored health plan"
      HIKINDNI   ="Other government plan"
      HIKINDNJ   ="Single service plan"
      HIKINDNK   ="No coverage of any type"
      MCAREPRB   ="Medicare coverage probe"
      MCAIDPRB   ="Medicaid coverage probe"
      SINCOV     ="Single service plan probe"

      /* FSD LABELS */

      PLBORN     ="Born in the United States"
      REGIONBR   ="Geographic region of birth recode"
      GEOBRTH    ="Geographic place of birth recode"
      YRSINUS    ="Years that - - has been in the U.S."
      CITIZENP   ="U.S. citizenship status"
      HEADST     ="Now attending Head Start"
      HEADSTV1   ="Ever attended Head Start"
      EDUC1      ="Highest level of school completed"
      ARMFVER    ="Currently on full-time active duty with the Armed Forces"
      ARMFEV     =
"Has - - ever served in U.S. Armed Forces, Reserves, or National Guard?"
      ARMFFC     =
"Active duty personnel who served on a humanitarian or peacekeeping mission?"
      ARMFTM1P   =
"Was - - active duty in the U.S. military in September, 2001 or later?"
      ARMFTM2P   =
"Was - - active duty in U.S. military in Aug 1990 to Aug 2001 (Persian Gulf War)
?"
      ARMFTM3P   =
"Was - - active duty in the U.S. military in May, 1975 to July, 1990?"
      ARMFTM4P   =
"Was - - active duty in U.S. military in Aug 1964 to April 1975 (Vietnam War)?"
      ARMFTM5P   =
"Was - - active duty in the U.S. military in February, 1955 to July, 1964?"
      ARMFTM6P   =
"Was - - active duty in U.S. military in July 1950 to Jan 1955 (Korean War)?"
      ARMFTM7P   =
"Was -- active duty in the U.S. military in June, 1950 or earlier?"
      DOINGLWP   ="What was - - doing last week"
      WHYNOWKP   ="Main reason for not working last week"
      WRKHRS2    ="Hours worked last week"
      WRKFTALL   ="Usually work full time"
      WRKLYR1    ="Work for pay last year"
      WRKMYR     ="Months worked last year"
      ERNYR_P    ="Total earnings last year"
      HIEMPOF    ="Health insurance offered at workplace"

      /* FIN LABELS */

      FINCINT    ="Introduction to the family income section"
      PSAL       ="Received income from wages or salary (last CY)"
      PSEINC     ="Received income from self-employment (last CY)"
      PSSRR      =
"Received income from Social Security or Railroad Retirement (last CY)"
      PSSRRDB    =
"Received Social Security or Railroad Retirement income as a disability benefit"
      PSSRRD     ="Received benefit due to disability"
      PPENS      =
"Received income from disability pension exp. Soc Security or Railroad Retiremen
t"
      POPENS     ="Received income from any other pension"
      PSSI       ="Received income from SSI"
      PSSID      ="Received SSI due to disability"
      PTANF      =
"Received income from a state or county welfare program (e.g., TANF)"
      POWBEN     ="Received other government assistance"
      PINTRSTR   ="Received interest income"
      PDIVD      ="Received dividends from stocks, funds, etc."
      PCHLDSP    ="Received income from child support"
      PINCOT     ="Received income from any other source"
      PSSAPL     ="Ever applied for Supplemental Security Income (SSI)"
      PSDAPL     ="Ever applied for Social Security Disability Insurance (SSDI)"
      TANFMYR    ="Months received welfare/TANF (last CY)"
      ELIGPWIC   ="Anyone age-eligible for the WIC program?"
      PWIC       ="Received WIC benefits"
      WIC_FLAG   ="WIC recipient age-eligible"

      /* FLG LABELS */

      ENGLANG    ="How well English is spoken"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   PEP001X.   SRVY_YR   PEP002X.   HHX       $GROUPC.
      INTV_QRT  PEP004X.   INTV_MON  PEP005X.   WTIA      GROUPN.
      WTFA      GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    PEP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       PEP013X.   ORIGIN_I  PEP014X.   ORIGIMPT  PEP015X.
      HISPAN_I  PEP016X.   HISPIMPT  PEP017X.   RACERPI2  PEP018X.
      RACEIMP2  PEP019X.   MRACRPI2  PEP020X.   MRACBPI2  PEP021X.
      RACRECI3  PEP022X.   HISCODI3  PEP023X.   ERIMPFLG  PEP024X.
      NOWAF     PEP025X.   RRP       PEP026X.   HHREFLG   $PEP027X.
      FRRP      PEP028X.   DOB_Y_P   $PEP029X.  AGE_P     PEP030X.
      AGE_CHG   PEP031X.

      /* FID FORMAT ASSOCIATIONS */

      FMRPFLG   $PEP032X.  FMREFLG   $PEP033X.  R_MARITL  PEP034X.
      FSPOUS2   $PEP035X.  COHAB1    PEP036X.   COHAB2    PEP037X.
      CDCMSTAT  PEP039X.   SIB_DEGP  PEP040X.   FMOTHER1  $PEP041X.
      MOM_DEGP  PEP042X.   FFATHER1  $PEP043X.  DAD_DEGP  PEP042X.
      PARENTS   PEP045X.   MOM_ED    PEP046X.   DAD_ED    PEP046X.
      ASTATFLG  PEP048X.   CSTATFLG  PEP049X.   QCADULT   PEP050X.
      QCCHILD   PEP051X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  PEP052X.

      /* FHS FORMAT ASSOCIATIONS */

      PLAPLYLM  PEP036X.   PLAPLYUN  PEP036X.   PSPEDEIS  PEP036X.
      PSPEDEM   PEP036X.   PLAADL    PEP036X.   LABATH    PEP036X.
      LADRESS   PEP036X.   LAEAT     PEP036X.   LABED     PEP036X.
      LATOILT   PEP036X.   LAHOME    PEP036X.   PLAIADL   PEP036X.
      PLAWKNOW  PEP036X.   PLAWKLIM  PEP066X.   PLAWALK   PEP036X.
      PLAREMEM  PEP036X.   PLIMANY   PEP069X.   LA1AR     PEP070X.
      LAHCC1    PEP071X.   LAHCC2    PEP071X.   LAHCC3    PEP071X.
      LAHCC4    PEP071X.   LAHCC5    PEP071X.   LAHCC6    PEP071X.
      LAHCC7A   PEP071X.   LAHCC8    PEP071X.   LAHCC9    PEP071X.
      LAHCC10   PEP071X.   LAHCC11   PEP071X.   LAHCC12   PEP071X.
      LAHCC13   PEP071X.   LAHCC90   PEP071X.   LAHCC91   PEP071X.
      LCTIME1   PEP086X.   LCUNIT1   PEP087X.   LCDURA1   PEP088X.
      LCDURB1   PEP089X.   LCCHRC1   PEP090X.   LCTIME2   PEP086X.
      LCUNIT2   PEP087X.   LCDURA2   PEP088X.   LCDURB2   PEP089X.
      LCCHRC2   PEP090X.   LCTIME3   PEP086X.   LCUNIT3   PEP087X.
      LCDURA3   PEP088X.   LCDURB3   PEP089X.   LCCHRC3   PEP090X.
      LCTIME4   PEP086X.   LCUNIT4   PEP087X.   LCDURA4   PEP088X.
      LCDURB4   PEP089X.   LCCHRC4   PEP090X.   LCTIME5   PEP086X.
      LCUNIT5   PEP087X.   LCDURA5   PEP088X.   LCDURB5   PEP089X.
      LCCHRC5   PEP090X.   LCTIME6   PEP086X.   LCUNIT6   PEP087X.
      LCDURA6   PEP088X.   LCDURB6   PEP089X.   LCCHRC6   PEP090X.
      LCTIME7A  PEP086X.   LCUNIT7A  PEP087X.   LCDURA7A  PEP088X.
      LCDURB7A  PEP089X.   LCCHRC7A  PEP090X.   LCTIME8   PEP086X.
      LCUNIT8   PEP087X.   LCDURA8   PEP088X.   LCDURB8   PEP089X.
      LCCHRC8   PEP090X.   LCTIME9   PEP086X.   LCUNIT9   PEP087X.
      LCDURA9   PEP088X.   LCDURB9   PEP089X.   LCCHRC9   PEP090X.
      LCTIME10  PEP086X.   LCUNIT10  PEP087X.   LCDURA10  PEP088X.
      LCDURB10  PEP089X.   LCCHRC10  PEP090X.   LCTIME11  PEP086X.
      LCUNIT11  PEP087X.   LCDURA11  PEP088X.   LCDURB11  PEP089X.
      LCCHRC11  PEP090X.   LCTIME12  PEP086X.   LCUNIT12  PEP087X.
      LCDURA12  PEP088X.   LCDURB12  PEP089X.   LCCHRC12  PEP090X.
      LCTIME13  PEP086X.   LCUNIT13  PEP087X.   LCDURA13  PEP088X.
      LCDURB13  PEP089X.   LCCHRC13  PEP090X.   LCTIME90  PEP086X.
      LCUNIT90  PEP087X.   LCDURA90  PEP088X.   LCDURB90  PEP089X.
      LCCHRC90  PEP090X.   LCTIME91  PEP086X.   LCUNIT91  PEP087X.
      LCDURA91  PEP088X.   LCDURB91  PEP089X.   LCCHRC91  PEP090X.
      LAHCA1    PEP071X.   LAHCA2    PEP071X.   LAHCA3    PEP071X.
      LAHCA4    PEP071X.   LAHCA5    PEP071X.   LAHCA6    PEP071X.
      LAHCA7    PEP071X.   LAHCA8    PEP071X.   LAHCA9    PEP071X.
      LAHCA10   PEP071X.   LAHCA11   PEP071X.   LAHCA12   PEP071X.
      LAHCA13   PEP071X.   LAHCA14A  PEP071X.   LAHCA15   PEP071X.
      LAHCA16   PEP071X.   LAHCA17   PEP071X.   LAHCA18   PEP071X.
      LAHCA19_  PEP071X.   LAHCA20_  PEP071X.   LAHCA21_  PEP071X.
      LAHCA22_  PEP071X.   LAHCA23_  PEP071X.   LAHCA24_  PEP071X.
      LAHCA25_  PEP071X.   LAHCA26_  PEP071X.   LAHCA27_  PEP071X.
      LAHCA28_  PEP071X.   LAHCA29_  PEP071X.   LAHCA30_  PEP071X.
      LAHCA31_  PEP071X.   LAHCA32_  PEP071X.   LAHCA33_  PEP071X.
      LAHCA34_  PEP071X.   LAHCA90   PEP071X.   LAHCA91   PEP071X.
      LATIME1   PEP086X.   LAUNIT1   PEP087X.   LADURA1   PEP199X.
      LADURB1   PEP200X.   LACHRC1   PEP090X.   LATIME2   PEP086X.
      LAUNIT2   PEP087X.   LADURA2   PEP199X.   LADURB2   PEP200X.
      LACHRC2   PEP090X.   LATIME3   PEP086X.   LAUNIT3   PEP087X.
      LADURA3   PEP199X.   LADURB3   PEP200X.   LACHRC3   PEP090X.
      LATIME4   PEP086X.   LAUNIT4   PEP087X.   LADURA4   PEP199X.
      LADURB4   PEP200X.   LACHRC4   PEP090X.   LATIME5   PEP086X.
      LAUNIT5   PEP087X.   LADURA5   PEP199X.   LADURB5   PEP200X.
      LACHRC5   PEP090X.   LATIME6   PEP086X.   LAUNIT6   PEP087X.
      LADURA6   PEP199X.   LADURB6   PEP200X.   LACHRC6   PEP090X.
      LATIME7   PEP086X.   LAUNIT7   PEP087X.   LADURA7   PEP199X.
      LADURB7   PEP200X.   LACHRC7   PEP090X.   LATIME8   PEP086X.
      LAUNIT8   PEP087X.   LADURA8   PEP199X.   LADURB8   PEP200X.
      LACHRC8   PEP090X.   LATIME9   PEP086X.   LAUNIT9   PEP087X.
      LADURA9   PEP199X.   LADURB9   PEP200X.   LACHRC9   PEP090X.
      LATIME10  PEP086X.   LAUNIT10  PEP087X.   LADURA10  PEP199X.
      LADURB10  PEP200X.   LACHRC10  PEP090X.   LATIME11  PEP086X.
      LAUNIT11  PEP087X.   LADURA11  PEP199X.   LADURB11  PEP200X.
      LACHRC11  PEP090X.   LATIME12  PEP086X.   LAUNIT12  PEP087X.
      LADURA12  PEP199X.   LADURB12  PEP200X.   LACHRC12  PEP090X.
      LATIME13  PEP086X.   LAUNIT13  PEP087X.   LADURA13  PEP199X.
      LADURB13  PEP200X.   LACHRC13  PEP090X.   LTIME14A  PEP086X.
      LUNIT14A  PEP087X.   LDURA14A  PEP199X.   LDURB14A  PEP200X.
      LCHRC14A  PEP090X.   LATIME15  PEP086X.   LAUNIT15  PEP087X.
      LADURA15  PEP199X.   LADURB15  PEP200X.   LACHRC15  PEP090X.
      LATIME16  PEP086X.   LAUNIT16  PEP087X.   LADURA16  PEP199X.
      LADURB16  PEP200X.   LACHRC16  PEP090X.   LATIME17  PEP086X.
      LAUNIT17  PEP087X.   LADURA17  PEP199X.   LADURB17  PEP200X.
      LACHRC17  PEP090X.   LATIME18  PEP086X.   LAUNIT18  PEP087X.
      LADURA18  PEP199X.   LADURB18  PEP200X.   LACHRC18  PEP090X.
      LATIME19  PEP086X.   LAUNIT19  PEP087X.   LADURA19  PEP199X.
      LADURB19  PEP200X.   LACHRC19  PEP090X.   LATIME20  PEP086X.
      LAUNIT20  PEP087X.   LADURA20  PEP199X.   LADURB20  PEP200X.
      LACHRC20  PEP090X.   LATIME21  PEP086X.   LAUNIT21  PEP087X.
      LADURA21  PEP199X.   LADURB21  PEP200X.   LACHRC21  PEP090X.
      LATIME22  PEP086X.   LAUNIT22  PEP087X.   LADURA22  PEP199X.
      LADURB22  PEP200X.   LACHRC22  PEP090X.   LATIME23  PEP086X.
      LAUNIT23  PEP087X.   LADURA23  PEP199X.   LADURB23  PEP200X.
      LACHRC23  PEP090X.   LATIME24  PEP086X.   LAUNIT24  PEP087X.
      LADURA24  PEP199X.   LADURB24  PEP200X.   LACHRC24  PEP090X.
      LATIME25  PEP086X.   LAUNIT25  PEP087X.   LADURA25  PEP199X.
      LADURB25  PEP200X.   LACHRC25  PEP090X.   LATIME26  PEP086X.
      LAUNIT26  PEP087X.   LADURA26  PEP199X.   LADURB26  PEP200X.
      LACHRC26  PEP090X.   LATIME27  PEP086X.   LAUNIT27  PEP087X.
      LADURA27  PEP199X.   LADURB27  PEP200X.   LACHRC27  PEP090X.
      LATIME28  PEP086X.   LAUNIT28  PEP087X.   LADURA28  PEP199X.
      LADURB28  PEP200X.   LACHRC28  PEP090X.   LATIME29  PEP086X.
      LAUNIT29  PEP087X.   LADURA29  PEP199X.   LADURB29  PEP200X.
      LACHRC29  PEP090X.   LATIME30  PEP086X.   LAUNIT30  PEP087X.
      LADURA30  PEP199X.   LADURB30  PEP200X.   LACHRC30  PEP090X.
      LATIME31  PEP086X.   LAUNIT31  PEP087X.   LADURA31  PEP199X.
      LADURB31  PEP200X.   LACHRC31  PEP090X.   LATIME32  PEP086X.
      LAUNIT32  PEP087X.   LADURA32  PEP199X.   LADURB32  PEP200X.
      LACHRC32  PEP090X.   LATIME33  PEP086X.   LAUNIT33  PEP087X.
      LADURA33  PEP199X.   LADURB33  PEP200X.   LACHRC33  PEP090X.
      LATIME34  PEP086X.   LAUNIT34  PEP087X.   LADURA34  PEP199X.
      LADURB34  PEP200X.   LACHRC34  PEP090X.   LATIME90  PEP086X.
      LAUNIT90  PEP087X.   LADURA90  PEP199X.   LADURB90  PEP200X.
      LACHRC90  PEP090X.   LATIME91  PEP086X.   LAUNIT91  PEP087X.
      LADURA91  PEP199X.   LADURB91  PEP200X.   LACHRC91  PEP090X.
      LCONDRT   PEP377X.   LACHRONR  PEP378X.   PHSTAT    PEP379X.

      /* FAU FORMAT ASSOCIATIONS */

      PDMED12M  PEP036X.   PNMED12M  PEP036X.   PHOSPYR2  PEP036X.
      HOSPNO    PEP383X.   HPNITE    PEP383X.   PHCHM2W   PEP036X.
      PHCHMN2W  PEP386X.   PHCPH2WR  PEP036X.   PHCPHN2W  PEP386X.
      PHCDV2W   PEP036X.   PHCDVN2W  PEP386X.   P10DVYR   PEP036X.

      /* FHI FORMAT ASSOCIATIONS */

      NOTCOV    PEP392X.   COVER     PEP393X.   COVER65   PEP394X.
      COVER65O  PEP395X.   MEDICARE  PEP396X.   MCPART    PEP397X.
      MCCHOICE  PEP036X.   MCHMO     PEP036X.   MCADVR    PEP400X.
      MCPREM    PEP036X.   MCREF     PEP036X.   MCPARTD   PEP036X.
      MEDICAID  PEP396X.   MAFLG     PEP405X.   MACHMD    PEP406X.
      MXCHNG    PEP036X.   MEDPREM   PEP036X.   MDPRINC   PEP036X.
      SINGLE    PEP410X.   SSTYPEA   PEP071X.   SSTYPEB   PEP071X.
      SSTYPEC   PEP071X.   SSTYPED   PEP071X.   SSTYPEE   PEP071X.
      SSTYPEF   PEP071X.   SSTYPEG   PEP071X.   SSTYPEH   PEP071X.
      SSTYPEI   PEP071X.   SSTYPEJ   PEP071X.   SSTYPEK   PEP071X.
      SSTYPEL   PEP071X.   PRIVATE   PEP396X.   PRFLG     PEP424X.
      EXCHANGE  PEP425X.   WHONAM1   PEP426X.   PRPOLH1   PEP427X.
      PRCOOH1   PEP036X.   PLNWRKS1  PEP429X.   PLNEXCH1  PEP036X.
      EXCHPR1   PEP431X.   PLNPAY11  PEP071X.   PLNPAY21  PEP071X.
      PLNPAY31  PEP071X.   PLNPAY41  PEP071X.   PLNPAY51  PEP071X.
      PLNPAY61  PEP071X.   PLNPAY71  PEP071X.   PLNPRE1   PEP439X.
      HICOSTR1  PEP440X.   PLNMGD1   PEP441X.   HDHP1     PEP442X.
      HSAHRA1   PEP036X.   MGCHMD1   PEP444X.   MGPRMD1   PEP036X.
      MGPYMD1   PEP036X.   PCPREQ1   PEP036X.   PRRXCOV1  PEP036X.
      PRDNCOV1  PEP036X.   PXCHNG    PEP036X.   PLEXCHPR  PEP431X.
      PSTRFPRM  PEP036X.   PSSPRINC  PEP036X.   PSTDOC    PEP454X.
      WHONAM2   PEP426X.   PRPOLH2   PEP427X.   PRCOOH2   PEP036X.
      PLNWRKS2  PEP429X.   PLNEXCH2  PEP036X.   EXCHPR2   PEP431X.
      PLNPAY12  PEP071X.   PLNPAY22  PEP071X.   PLNPAY32  PEP071X.
      PLNPAY42  PEP071X.   PLNPAY52  PEP071X.   PLNPAY62  PEP071X.
      PLNPAY72  PEP071X.   PLNPRE2   PEP439X.   HICOSTR2  PEP440X.
      PLNMGD2   PEP441X.   HDHP2     PEP442X.   HSAHRA2   PEP036X.
      MGCHMD2   PEP444X.   MGPRMD2   PEP036X.   MGPYMD2   PEP036X.
      PCPREQ2   PEP036X.   PRRXCOV2  PEP036X.   PRDNCOV2  PEP036X.
      PRPLPLUS  PEP036X.   FCOVCONF  PEP480X.   SCHIP     PEP396X.
      CHFLG     PEP482X.   CHXCHNG   PEP036X.   STRFPRM1  PEP036X.
      CHPRINC   PEP036X.   STDOC1    PEP406X.   OTHPUB    PEP396X.
      OPFLG     PEP488X.   OPXCHNG   PEP036X.   PLEXCHOP  PEP431X.
      STRFPRM2  PEP036X.   SSPRINC   PEP036X.   STDOC2    PEP406X.
      OTHGOV    PEP396X.   OGFLG     PEP495X.   OGXCHNG   PEP036X.
      PLEXCHOG  PEP431X.   STRFPRM3  PEP036X.   OGPRINC   PEP036X.
      STDOC3    PEP406X.   MILCARE   PEP396X.   MILSPC1   PEP071X.
      MILSPC2   PEP071X.   MILSPC3   PEP071X.   MILSPC4   PEP071X.
      MILMANR   PEP506X.   IHS       PEP036X.   HILAST    PEP508X.
      HISTOP1   PEP071X.   HISTOP2   PEP071X.   HISTOP3   PEP071X.
      HISTOP4   PEP071X.   HISTOP5   PEP071X.   HISTOP6   PEP071X.
      HISTOP7   PEP071X.   HISTOP8   PEP071X.   HISTOP9   PEP071X.
      HISTOP10  PEP071X.   HISTOP11  PEP071X.   HISTOP12  PEP071X.
      HISTOP13  PEP071X.   HISTOP14  PEP071X.   HISTOP15  PEP071X.
      HINOTYR   PEP036X.   HINOTMYR  PEP386X.   FHICHNG   PEP036X.
      FHIKDBA   PEP071X.   FHIKDBB   PEP071X.   FHIKDBC   PEP071X.
      FHIKDBD   PEP071X.   FHIKDBE   PEP071X.   FHIKDBF   PEP071X.
      FHIKDBG   PEP071X.   FHIKDBH   PEP071X.   FHIKDBI   PEP071X.
      FHIKDBJ   PEP071X.   FHIKDBK   PEP071X.   PWRKBR1   PEP538X.
      HCSPFYR   PEP539X.   MEDBILL   PEP036X.   MEDBPAY   PEP036X.
      MEDBNOP   PEP036X.   FSA       PEP036X.   HIKINDNA  PEP071X.
      HIKINDNB  PEP071X.   HIKINDNC  PEP071X.   HIKINDND  PEP071X.
      HIKINDNE  PEP071X.   HIKINDNF  PEP071X.   HIKINDNG  PEP071X.
      HIKINDNH  PEP071X.   HIKINDNI  PEP071X.   HIKINDNJ  PEP071X.
      HIKINDNK  PEP071X.   MCAREPRB  PEP036X.   MCAIDPRB  PEP036X.
      SINCOV    PEP036X.

      /* FSD FORMAT ASSOCIATIONS */

      PLBORN    PEP036X.   REGIONBR  PEP559X.   GEOBRTH   PEP560X.
      YRSINUS   PEP561X.   CITIZENP  PEP562X.   HEADST    PEP036X.
      HEADSTV1  PEP036X.   EDUC1     PEP565X.   ARMFVER   PEP036X.
      ARMFEV    PEP036X.   ARMFFC    PEP036X.   ARMFTM1P  PEP071X.
      ARMFTM2P  PEP071X.   ARMFTM3P  PEP071X.   ARMFTM4P  PEP071X.
      ARMFTM5P  PEP071X.   ARMFTM6P  PEP071X.   ARMFTM7P  PEP071X.
      DOINGLWP  PEP576X.   WHYNOWKP  PEP577X.   WRKHRS2   PEP578X.
      WRKFTALL  PEP036X.   WRKLYR1   PEP036X.   WRKMYR    PEP581X.
      ERNYR_P   PEP582X.   HIEMPOF   PEP036X.

      /* FIN FORMAT ASSOCIATIONS */

      FINCINT   PEP584X.   PSAL      PEP036X.   PSEINC    PEP036X.
      PSSRR     PEP036X.   PSSRRDB   PEP036X.   PSSRRD    PEP036X.
      PPENS     PEP036X.   POPENS    PEP036X.   PSSI      PEP036X.
      PSSID     PEP036X.   PTANF     PEP036X.   POWBEN    PEP036X.
      PINTRSTR  PEP036X.   PDIVD     PEP036X.   PCHLDSP   PEP036X.
      PINCOT    PEP036X.   PSSAPL    PEP036X.   PSDAPL    PEP036X.
      TANFMYR   PEP386X.   ELIGPWIC  PEP603X.   PWIC      PEP036X.
      WIC_FLAG  PEP605X.

      /* FLG FORMAT ASSOCIATIONS */

      ENGLANG   PEP606X.;
RUN;

PROC CONTENTS DATA=NHIS.PERSONSX;
   TITLE1 'CONTENTS OF THE 2015 NHIS Person FILE';

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2015 NHIS Person FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA;

PROC FREQ DATA=NHIS.PERSONSX NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2015 NHIS Person FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
