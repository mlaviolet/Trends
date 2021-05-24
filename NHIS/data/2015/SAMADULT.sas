*********************************************************************
 JUNE 21, 2016  9:08 AM
 
 This is an example of a SAS program that creates a SAS
 file from the 2015 NHIS Public Use SAMADULT.DAT ASCII file
 
 This is stored in SAMADULT.SAS
*********************************************************************;

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS;
LIBNAME  NHIS     "C:\NHIS2015";

* USER NOTE: PLACE NEXT STATEMENT IN SUBSEQUENT PROGRAMS
             IF YOU ALLOW PROGRAM TO PERMANENTLY STORE FORMATS;
LIBNAME  LIBRARY  "C:\NHIS2015";

FILENAME ASCIIDAT 'C:\NHIS2015\SAMADULT.dat';

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
   VALUE $VERBAT
      ' '< - HIGH   = "Verbatim Response"
   ;
   VALUE SAP001X
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
   VALUE SAP002X
      .                   = '.'
      OTHER              = "Survey Year"
   ;
   VALUE SAP004X
      1                  = "1 Quarter 1"
      2                  = "2 Quarter 2"
      3                  = "3 Quarter 3"
      4                  = "4 Quarter 4"
   ;
   VALUE SAP005X
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
   VALUE SAP010X
      1                  = "1 Northeast"
      2                  = "2 Midwest"
      3                  = "3 South"
      4                  = "4 West"
   ;
   VALUE SAP013X
      1                  = "1 Male"
      2                  = "2 Female"
   ;
   VALUE SAP014X
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
   VALUE SAP015X
      01                 = "01 White only"
      02                 = "02 Black/African American only"
      03                 = "03 AIAN only"
      04                 = "04 Asian only"
      05                 = "05 Race group not releasable (See file layout)"
      06                 = "06 Multiple race"
   ;
   VALUE SAP016X
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
   VALUE SAP017X
      01                 = "01 White"
      02                 = "02 Black/African American"
      03                 = "03 Indian (American) (includes Eskimo, Aleut)"
      06                 = "06 Chinese"
      07                 = "07 Filipino"
      12                 = "12 Asian Indian"
      16                 = "16 Other race (See file layout)"
      17                 = "17 Multiple race, no primary race selected"
   ;
   VALUE SAP018X
      00                 = "00 Under 1 year"
      85                 = "85 85+ years"
   ;
   VALUE SAP019X
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
   VALUE SAP020X
      1                  = 
"1 Yes, the Sample Adult is a parent of a child residing in the family"
      2                  = 
"2 There are minor children residing in the family but the Sample Adult is not t
heir parent"
      3                  = "3 There are no minor children residing in the family
"
      9                  = "9 Unknown"
   ;
   VALUE SAP021X
      1                  = "1 Physical or mental condition prohibits responding"
      2                  = "2 Sample adult is able to respond"
      3                  = "3 Unknown"
   ;
   VALUE SAP022X
      1                  = "1 Yes"
      2                  = "2 No"
   ;
   VALUE SAP023X
      1                  = "1 Relative who lives in household"
      2                  = "2 Relative who doesn't live in household"
      3                  = "3 Other caregiver"
      4                  = "4 Other"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP024X
      1                  = 
"1 Started Sample Adult Core 2+ weeks after the initial interview"
      2                  = 
"2 Started Sample Adult Core less than 2 weeks after the initial interview"
   ;
   VALUE SAP025X
      1                  = 
"1 Families selected to receive AFD (sample adults) section"
      2                  = 
"2 Families selected to receive FDB (all persons 1 year and older) section"
   ;
   VALUE SAP026X
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
   VALUE SAP027X
      01                 = "01 Taking care of house or family"
      02                 = "02 Going to school"
      03                 = "03 Retired"
      04                 = "04 On a planned vacation from work"
      05                 = "05 On family or maternity leave"
      06                 = "06 Temporarily unable to work for health reasons"
      07                 = "07 Have job or contract and off-season"
      08                 = "08 On layoff"
      09                 = "09 Disabled"
      10                 = "10 Other"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP028X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP029X
      .                   = '.'
      OTHER              = 
"See Industry Appendix in file layout at the end of the Sample Adult Documentati
on"
   ;
   VALUE SAP031X
      .                   = '.'
      OTHER              = 
"See Occupation Appendix in file layout at the end of the Sample Adult documenta
tion"
   ;
   VALUE SAP034X
      1                  = "1 Employee of a PRIVATE company for wages"
      2                  = "2 A FEDERAL government employee"
      3                  = "3 A STATE government employee"
      4                  = "4 A LOCAL government employee"
      5                  = 
"5 Self-employed in OWN business, professional practice or farm"
      6                  = 
"6 Working WITHOUT PAY in a family-owned business or farm"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP036X
      01                 = "01 1 employee"
      02                 = "02 2-9 employees"
      03                 = "03 10-24 employees"
      04                 = "04 25-49 employees"
      05                 = "05 50-99 employees"
      06                 = "06 100-249 employees"
      07                 = "07 250-499 employees"
      08                 = "08 500-999 employees"
      09                 = "09 1000 employees or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP037X
      00                 = "00 Less than 1 year"
      35                 = "35 35 or more years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP042X
      0                  = "0 Had job last week"
      1                  = "1 No job last week, had job past 12 months"
      2                  = "2 No job last week, no job past 12 months"
      3                  = "3 Never worked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP047X
      1                  = 
"1 An employee of a PRIVATE company, business, or individual for wages, salary, 
or commission"
      2                  = "2 A FEDERAL government employee"
      3                  = "3 A STATE government employee"
      4                  = "4 A LOCAL government employee"
      5                  = 
"5 Self-employed in OWN business, professional practice or farm"
      6                  = 
"6 Working WITHOUT PAY in family-owned business or farm"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP049X
      1                  = 
"1 You work as an independent contractor, independent consultant, or freelance w
orker"
      2                  = 
"2 You are paid by a temporary agency or work for a contractor who provides work
ers and services to others under contract"
      3                  = 
"3 You are a regular, permanent employee (standard work arrangement)"
      4                  = "4 Some other work arrangement"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP050X
      1                  = "1 A regular daytime schedule"
      2                  = "2 A regular evening shift"
      3                  = "3 A regular night shift"
      4                  = "4 A rotating shift"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP052X
      1                  = "1 1-5 times"
      2                  = "2 6-10 times"
      3                  = "3 11-19 times"
      4                  = "4 20-30 times"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP053X
      1                  = "1 Strongly agree"
      2                  = "2 Agree"
      3                  = "3 Disagree"
      4                  = "4 Strongly disagree"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP058X
      1                  = "1 Very safe"
      2                  = "2 Safe"
      3                  = "3 Unsafe"
      4                  = "4 Very unsafe"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP061X
      1                  = "1 Once"
      2                  = "2 A few times"
      3                  = "3 Monthly"
      4                  = "4 Weekly"
      5                  = "5 Daily"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP062X
      0                  = "0 Never"
      1                  = "1 Seldom"
      2                  = "2 Sometimes"
      3                  = "3 Often"
      4                  = "4 Always"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP064X
      0                  = "0 Never"
      1                  = "1 Less than twice a week"
      2                  = "2 Twice a week or more, but not every day"
      3                  = "3 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP066X
      0                  = "0 Never"
      1                  = "1 Once"
      2                  = "2 A few times"
      3                  = "3 Monthly"
      4                  = "4 Weekly"
      5                  = "5 Daily"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP095X
      1                  = "1 Mentioned"
      2                  = "2 Not mentioned"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP126X
      85                 = "85 85+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP156X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Borderline"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP159X
      00                 = "00 Within past year"
      85                 = "85 85+ years"
      96                 = "96 1+ year(s) with diabetes and age is 85+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP164X
      0                  = "0 None"
      1                  = "1 One"
      2                  = "2 Two or three"
      3                  = "3 Between four and ten"
      4                  = "4 More than 10"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP166X
      1                  = "1 Not at all"
      2                  = "2 Slightly"
      3                  = "3 Moderately"
      4                  = "4 Quite a bit"
      5                  = "5 Extremely"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP201X
      1                  = "1 Some days"
      2                  = "2 Most days"
      3                  = "3 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP202X
      1                  = "1 A little"
      2                  = "2 A lot"
      3                  = "3 Somewhere in between a little and a lot"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP207X
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP217X
      1                  = "1 Excellent"
      2                  = "2 Good"
      3                  = "3 A little trouble hearing"
      4                  = "4 Moderate trouble"
      5                  = "5 A lot of trouble"
      6                  = "6 Deaf"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP221X
      000                = "000 None"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP223X
      1                  = "1 Better"
      2                  = "2 Worse"
      3                  = "3 About the same"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP225X
      0                  = "0 Not at all difficult"
      1                  = "1 Only a little difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Very difficult"
      4                  = "4 Can't do at all"
      6                  = "6 Do not do this activity"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP237X
      1                  = "1 Limited in any way"
      2                  = "2 Not limited in any way"
      3                  = "3 Unknown if limited"
   ;
   VALUE SAP274X
      95                 = "95 95+"
      96                 = "96 Since birth"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP275X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      6                  = "6 Since birth"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP276X
      00                 = "00 Less than 1 year"
      85                 = "85 85+ years"
      96                 = "96 Unknown number of years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP277X
      1                  = "1 Less than 3 months"
      2                  = "2 3-5 months"
      3                  = "3 6-12 months"
      4                  = "4 More than 1 year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP278X
      1                  = "1 Chronic"
      2                  = "2 Not chronic"
      9                  = "9 Unknown if chronic"
   ;
   VALUE SAP454X
      1                  = 
"1 At least one condition causing functional limitation is chronic"
      2                  = "2 No condition causing functional limitation"
      9                  = 
"9 Unknown if any condition causing functional limitation is chronic"
   ;
   VALUE SAP455X
      0                  = 
"0 Not limited in any way (including unknown if limited)"
      1                  = "1 Limited; caused by at least one chronic condition"
      2                  = "2 Limited; not caused by chronic condition"
      3                  = "3 Limited; unknown if condition is chronic"
   ;
   VALUE SAP457X
      85                 = "85 85 years or older"
      96                 = "96 Never smoked regularly"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP458X
      1                  = "1 Every day"
      2                  = "2 Some days"
      3                  = "3 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP459X
      1                  = "1 Current every day smoker"
      2                  = "2 Current some day smoker"
      3                  = "3 Former smoker"
      4                  = "4 Never smoker"
      5                  = "5 Smoker, current status unknown"
      9                  = "9 Unknown if ever smoked"
   ;
   VALUE SAP460X
      95                 = "95 95+"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP461X
      1                  = "1 Day(s)"
      2                  = "2 Week(s)"
      3                  = "3 Month(s)"
      4                  = "4 Year(s)"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP462X
      00                 = "00 Less than 1 year"
      70                 = "70 70+ years"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP463X
      95                 = "95 95+ cigarettes"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP464X
      00                 = "00 None"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP471X
      85                 = "85 85+"
      95                 = "95 95 (Time unit: days; weeks; months)"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP474X
      000                = "000 Never"
      996                = "996 Unable to do this type activity"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP475X
      0                  = "0 Never"
      1                  = "1 Per day"
      2                  = "2 Per week"
      3                  = "3 Per month"
      4                  = "4 Per year"
      6                  = "6 Unable to do this activity"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP476X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do vigorous activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP477X
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP478X
      1                  = "1 Minutes"
      2                  = "2 Hours"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP482X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do light or moderate activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP488X
      00                 = "00 Less than once per week"
      95                 = "95 Never"
      96                 = "96 Unable to do strength activity"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP491X
      000                = "000 Never"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP492X
      0                  = "0 Never/None"
      1                  = "1 Week"
      2                  = "2 Month"
      3                  = "3 Year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP493X
      00                 = "00 Less than one day per week"
      95                 = "95 Did not drink in past year"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP494X
      000                = "000 Never/none"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP495X
      95                 = "95 95+ drinks"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP496X
      01                 = "01 Lifetime abstainer"
      02                 = "02 Former infrequent"
      03                 = "03 Former regular"
      04                 = "04 Former, unknown frequency"
      05                 = "05 Current infrequent"
      06                 = "06 Current light"
      07                 = "07 Current moderate"
      08                 = "08 Current heavier"
      09                 = "09 Current drinker, frequency/level unknown"
      10                 = "10 Drinking status unknown"
   ;
   VALUE SAP498X
      0                  = "0 Never/None"
      1                  = "1 Per week"
      2                  = "2 Per month"
      3                  = "3 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP501X
      96                 = "96 Not available"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP502X
      996                = "996 Not available"
      997                = "997 Refused"
      998                = "998 Not ascertained"
      999                = "999 Don't know"
   ;
   VALUE SAP503X
      99.95              = "99.95 99.95+"
      99.99              = "99.99 Unknown"
   ;
   VALUE SAP504X
      1                  = "1 Yes"
      2                  = "2 There is NO place"
      3                  = "3 There is MORE THAN ONE place"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP505X
      1                  = "1 Clinic or health center"
      2                  = "2 Doctor's office or HMO"
      3                  = "3 Hospital emergency room"
      4                  = "4 Hospital outpatient department"
      5                  = "5 Some other place"
      6                  = "6 Doesn't go to one place most often"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP507X
      0                  = "0 Doesn't get preventive care anywhere"
      1                  = "1 Clinic or health center"
      2                  = "2 Doctor's office or HMO"
      3                  = "3 Hospital emergency room"
      4                  = "4 Hospital outpatient department"
      5                  = "5 Some other place"
      6                  = "6 Doesn't go to one place most often"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP511X
      1                  = "1 Yes"
      2                  = "2 No"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP525X
      1                  = "1 Very worried"
      2                  = "2 Somewhat worried"
      3                  = "3 Not at all worried"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP534X
      0                  = "0 Never"
      1                  = "1 6 months or less"
      2                  = "2 More than 6 mos, but not more than 1 yr ago"
      3                  = "3 More than 1 yr, but not more than 2 yrs ago"
      4                  = "4 More than 2 yrs, but not more than 5 yrs ago"
      5                  = "5 More than 5 years ago"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP545X
      00                 = "00 None"
      01                 = "01 1"
      02                 = "02 2-3"
      03                 = "03 4-5"
      04                 = "04 6-7"
      05                 = "05 8-9"
      06                 = "06 10-12"
      07                 = "07 13-15"
      08                 = "08 16 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP558X
      01                 = "01 1"
      02                 = "02 2-3"
      03                 = "03 4-5"
      04                 = "04 6-7"
      05                 = "05 8-9"
      06                 = "06 10-12"
      07                 = "07 13-15"
      08                 = "08 16 or more"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP561X
      95                 = "95 95+ times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP569X
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
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP570X
      .                   = '.'
      OTHER              = "Year"
      9997               = "9997 Refused"
      9998               = "9998 Not ascertained"
      9999               = "9999 Don't know"
   ;
   VALUE SAP571X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP572X
      1                  = "1 Before this pregnancy"
      2                  = "2 During this pregnancy"
      3                  = "3 After this pregnancy"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP583X
      1                  = "1 Received at least 3 doses"
      2                  = "2 Received less than 3 doses"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP585X
      96                 = "96 Received all shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP587X
      1                  = 
"1 You or your doctor thought you were at risk of having hepatitis C because a b
lood test or symptoms like fatigue, nausea, stomach pain, yellowing of the eyes 
or skin indicated you might have liver disease"
      2                  = "2 You were born from 1945 through 1965"
      3                  = 
"3 You were at risk of hepatitis C infection due to exposure to blood on your jo
b, injection drug use or receipt of transfusion before 1992"
      4                  = "4 Some other reason"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP591X
      1                  = "1 Yes-included pertussis"
      2                  = "2 No-did not include pertussis"
      3                  = "3 Doctor did not say"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP592X
      1                  = "1 Yes"
      2                  = "2 No"
      3                  = "3 Doctor refused when asked"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP593X
      96                 = "96 All shots"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP609X
      1                  = "1 Self"
      2                  = "2 Someone else in family"
      3                  = "3 Both"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP610X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don’t know"
   ;
   VALUE SAP611X
      1                  = "1 Very difficult"
      2                  = "2 Somewhat difficult"
      3                  = "3 Not at all difficult"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP613X
      1                  = "1 Never or almost never"
      2                  = "2 Some days"
      3                  = "3 Most days"
      4                  = "4 Every day"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP614X
      1                  = "1 Very satisfied"
      2                  = "2 Somewhat satisfied"
      3                  = "3 Somewhat dissatisfied"
      4                  = "4 Very dissatisfied"
      5                  = "5 You haven't had health care in the past 12 months"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP615X
      1                  = "1 Less than 1 year"
      2                  = "2 1-3 years"
      3                  = "3 4-10 years"
      4                  = "4 11-20 years"
      5                  = "5 More than 20 years"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP616X
      1                  = "1 Definitely agree"
      2                  = "2 Somewhat agree"
      3                  = "3 Somewhat disagree"
      4                  = "4 Definitely disagree"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP620X
      1                  = "1 Gay"
      2                  = "2 Straight, that is, not gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP621X
      1                  = "1 Lesbian or gay"
      2                  = "2 Straight, that is, not lesbian or gay"
      3                  = "3 Bisexual"
      4                  = "4 Something else"
      5                  = "5 I don't know the answer"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
   ;
   VALUE SAP622X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP626X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 This does not apply to me"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP629X
      1                  = "1 Very worried"
      2                  = "2 Moderately worried"
      3                  = "3 Not too worried"
      4                  = "4 Not worried at all"
      5                  = "5 I don't have credit cards"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP631X
      00                 = 
"00 Did not have trouble falling asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP632X
      00                 = 
"00 Did not have trouble staying asleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP633X
      00                 = 
"00 Did not take medication to help sleep in the past week"
      07                 = "07 7 or more times"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP634X
      00                 = "00 Never felt rested in the past week"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP635X
      1                  = "1 ALL of the time"
      2                  = "2 MOST of the time"
      3                  = "3 SOME of the time"
      4                  = "4 A LITTLE of the time"
      5                  = "5 NONE of the time"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP641X
      1                  = "1 A lot"
      2                  = "2 Some"
      3                  = "3 A little"
      4                  = "4 Not at all"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;
   VALUE SAP643X
      01                 = "01 It's unlikely you've been exposed to HIV"
      02                 = 
"02 You were afraid to find out if you were HIV positive (that you had HIV)"
      03                 = 
"03 You didn't want to think about HIV or about being HIV positive"
      04                 = 
"04 You were worried your name would be reported to the government if you tested
 positive"
      05                 = "05 You didn't know where to get tested"
      06                 = "06 You don't like needles"
      07                 = 
"07 You were afraid of losing job, insurance, housing, friends, family, if peopl
e knew you were positive for AIDS infection"
      08                 = "08 Some other reason"
      09                 = "09 No particular reason"
      97                 = "97 Refused"
      98                 = "98 Not ascertained"
      99                 = "99 Don't know"
   ;
   VALUE SAP646X
      1                  = "1 Per day"
      2                  = "2 Per week"
      3                  = "3 Per month"
      4                  = "4 Per year"
      7                  = "7 Refused"
      8                  = "8 Not ascertained"
      9                  = "9 Don't know"
   ;

DATA NHIS.SAMADULT;
   * CREATE A SAS DATA SET;
   INFILE ASCIIDAT PAD LRECL=904;

   * DEFINE LENGTH OF ALL VARIABLES;

   LENGTH

      /* IDN LENGTHS */

      RECTYPE    3   SRVY_YR    4   HHX      $ 6   INTV_QRT   3
      INTV_MON   3   FMX      $ 2   FPX      $ 2   WTIA_SA    8
      WTFA_SA    8

      /* UCF LENGTHS */

      REGION     3   STRAT_P    4   PSU_P      3

      /* HHC LENGTHS */

      SEX        3   HISPAN_I   3   RACERPI2   3   MRACRPI2   3
      MRACBPI2   3   AGE_P      3

      /* FID LENGTHS */

      R_MARITL   3   PAR_STAT   3

      /* AID LENGTHS */

      PROXYSA    3   PROX1      3   PROX2      3   LATEINTA   3

      /* FDB LENGTHS */

      FDRN_FLG   3

      /* ASD LENGTHS */

      DOINGLWA   3   WHYNOWKA   3   EVERWRK    3   INDSTRN1   3
      INDSTRN2   3   OCCUPN1    3   OCCUPN2    3   SUPERVIS   3
      WRKCATA    3   BUSINC1A   3   LOCALL1B   3   YRSWRKPA   3
      WRKLONGH   3   HOURPDA    3   PDSICKA    3   ONEJOB     3
      WRKLYR4    3   INDSTLH1   3   INDSTLH2   3   OCCLH1     3
      OCCLH2     3   WRKCTLH    3   YRSWKLH    3   WRKARR_P   3
      WORKSCHD   3   NIGHTWK    3   NIGHTFRP   3   WRK_FAM    3
      JOBDMAND   3   JOBCNTRL   3   JOBSPPRT   3   WORLSJOB   3
      SAFETY     3   SAFCLIMT   3   HARASSED   3   HARASFRQ   3
      EXERTION   3   STAND      3   TBSMKEXP   3   HLTHPROM   3
      HPROMPAR   3

      /* ACN LENGTHS */

      HYPEV      3   HYPDIFV    3   HYPYR1     3   HYPMDEV2   3
      HYPMED2    3   CHLEV      3   CHLYR      3   CHLMDEV2   3
      CHLMDNW2   3   CHDEV      3   ANGEV      3   MIEV       3
      HRTEV      3   STREV      3   EPHEV      3   COPDEV     3
      ASPMEDEV   3   ASPMEDAD   3   ASPMDMED   3   ASPONOWN   3
      AASMEV     3   AASSTILL   3   AASMYR     3   AASERYR1   3
      ULCEV      3   ULCYR      3   ULCCOLEV   3   CANEV      3
      CNKIND1    3   CNKIND2    3   CNKIND3    3   CNKIND4    3
      CNKIND5    3   CNKIND6    3   CNKIND7    3   CNKIND8    3
      CNKIND9    3   CNKIND10   3   CNKIND11   3   CNKIND12   3
      CNKIND13   3   CNKIND14   3   CNKIND15   3   CNKIND16   3
      CNKIND17   3   CNKIND18   3   CNKIND19   3   CNKIND20   3
      CNKIND21   3   CNKIND22   3   CNKIND23   3   CNKIND24   3
      CNKIND25   3   CNKIND26   3   CNKIND27   3   CNKIND28   3
      CNKIND29   3   CNKIND30   3   CNKIND31   3   CANAGE1    4
      CANAGE2    4   CANAGE3    4   CANAGE4    4   CANAGE5    4
      CANAGE6    4   CANAGE7    4   CANAGE8    4   CANAGE9    4
      CANAGE10   4   CANAGE11   4   CANAGE12   4   CANAGE13   4
      CANAGE14   4   CANAGE15   4   CANAGE16   4   CANAGE17   4
      CANAGE18   4   CANAGE19   4   CANAGE20   4   CANAGE21   4
      CANAGE22   4   CANAGE23   4   CANAGE24   4   CANAGE25   4
      CANAGE26   4   CANAGE27   4   CANAGE28   4   CANAGE29   4
      CANAGE30   4   DIBEV      3   DIBPRE1    3   DIBAGE     3
      DIFAGE2    3   INSLN      3   DIBPILL    3   EPILEP1    3
      EPILEP2    3   EPILEP3    3   EPILEP4    3   EPILEP5    3
      AHAYFYR    3   SINYR      3   CBRCHYR    3   KIDWKYR    3
      LIVYR      3   JNTSYMP    3   JMTHP1     3   JMTHP2     3
      JMTHP3     3   JMTHP4     3   JMTHP5     3   JMTHP6     3
      JMTHP7     3   JMTHP8     3   JMTHP9     3   JMTHP10    3
      JMTHP11    3   JMTHP12    3   JMTHP13    3   JMTHP14    3
      JMTHP15    3   JMTHP16    3   JMTHP17    3   JNTCHR     3
      JNTHP      3   ARTH1      3   ARTHLMT    3   CTSEVER    3
      CTSYR      3   CTSWKRL1   3   CTSWKRL2   3   PAINECK    3
      PAINLB     3   PAINLEG    3   LBPFREQ    3   LBPSEV     3
      LBPWKREL   3   LBPWKRL2   3   LBPWCCLM   3   LBPWCBEN   3
      LBPWKDAY   3   LBPCHJOB   3   PAINFACE   3   AMIGR      3
      ACOLD2W    3   AINTIL2W   3   PREGNOW    3   PREGFLYR   3
      HRAIDNOW   3   HRAIDEV    3   AHEARST1   3   AVISION    3
      ABLIND     3   LUPPRT     3

      /* AHS LENGTHS */

      WKDAYR     4   BEDDAYR    4   AHSTATYR   3   SPECEQ     3
      FLWALK     3   FLCLIMB    3   FLSTAND    3   FLSIT      3
      FLSTOOP    3   FLREACH    3   FLGRASP    3   FLCARRY    3
      FLPUSH     3   FLSHOP     3   FLSOCL     3   FLRELAX    3
      FLA1AR     3   AFLHCA1    3   AFLHCA2    3   AFLHCA3    3
      AFLHCA4    3   AFLHCA5    3   AFLHCA6    3   AFLHCA7    3
      AFLHCA8    3   AFLHCA9    3   AFLHCA10   3   AFLHCA11   3
      AFLHCA12   3   AFLHCA13   3   ALHCA14A   3   AFLHCA15   3
      AFLHCA16   3   AFLHCA17   3   AFLHCA18   3   AFLHC19_   3
      AFLHC20_   3   AFLHC21_   3   AFLHC22_   3   AFLHC23_   3
      AFLHC24_   3   AFLHC25_   3   AFLHC26_   3   AFLHC27_   3
      AFLHC28_   3   AFLHC29_   3   AFLHC30_   3   AFLHC31_   3
      AFLHC32_   3   AFLHC33_   3   AFLHC34_   3   AFLHCA90   3
      AFLHCA91   3   ALTIME1    3   ALUNIT1    3   ALDURA1    3
      ALDURB1    3   ALCHRC1    3   ALTIME2    3   ALUNIT2    3
      ALDURA2    3   ALDURB2    3   ALCHRC2    3   ALTIME3    3
      ALUNIT3    3   ALDURA3    3   ALDURB3    3   ALCHRC3    3
      ALTIME4    3   ALUNIT4    3   ALDURA4    3   ALDURB4    3
      ALCHRC4    3   ALTIME5    3   ALUNIT5    3   ALDURA5    3
      ALDURB5    3   ALCHRC5    3   ALTIME6    3   ALUNIT6    3
      ALDURA6    3   ALDURB6    3   ALCHRC6    3   ALTIME7    3
      ALUNIT7    3   ALDURA7    3   ALDURB7    3   ALCHRC7    3
      ALTIME8    3   ALUNIT8    3   ALDURA8    3   ALDURB8    3
      ALCHRC8    3   ALTIME9    3   ALUNIT9    3   ALDURA9    3
      ALDURB9    3   ALCHRC9    3   ALTIME10   3   ALUNIT10   3
      ALDURA10   3   ALDURB10   3   ALCHRC10   3   ALTIME11   3
      ALUNIT11   3   ALDURA11   3   ALDURB11   3   ALCHRC11   3
      ALTIME12   3   ALUNIT12   3   ALDURA12   3   ALDURB12   3
      ALCHRC12   3   ALTIME13   3   ALUNIT13   3   ALDURA13   3
      ALDURB13   3   ALCHRC13   3   ATIME14A   3   AUNIT14A   3
      ADURA14A   3   ADURB14A   3   ACHRC14A   3   ALTIME15   3
      ALUNIT15   3   ALDURA15   3   ALDURB15   3   ALCHRC15   3
      ALTIME16   3   ALUNIT16   3   ALDURA16   3   ALDURB16   3
      ALCHRC16   3   ALTIME17   3   ALUNIT17   3   ALDURA17   3
      ALDURB17   3   ALCHRC17   3   ALTIME18   3   ALUNIT18   3
      ALDURA18   3   ALDURB18   3   ALCHRC18   3   ALTIME19   3
      ALUNIT19   3   ALDURA19   3   ALDURB19   3   ALCHRC19   3
      ALTIME20   3   ALUNIT20   3   ALDURA20   3   ALDURB20   3
      ALCHRC20   3   ALTIME21   3   ALUNIT21   3   ALDURA21   3
      ALDURB21   3   ALCHRC21   3   ALTIME22   3   ALUNIT22   3
      ALDURA22   3   ALDURB22   3   ALCHRC22   3   ALTIME23   3
      ALUNIT23   3   ALDURA23   3   ALDURB23   3   ALCHRC23   3
      ALTIME24   3   ALUNIT24   3   ALDURA24   3   ALDURB24   3
      ALCHRC24   3   ALTIME25   3   ALUNIT25   3   ALDURA25   3
      ALDURB25   3   ALCHRC25   3   ALTIME26   3   ALUNIT26   3
      ALDURA26   3   ALDURB26   3   ALCHRC26   3   ALTIME27   3
      ALUNIT27   3   ALDURA27   3   ALDURB27   3   ALCHRC27   3
      ALTIME28   3   ALUNIT28   3   ALDURA28   3   ALDURB28   3
      ALCHRC28   3   ALTIME29   3   ALUNIT29   3   ALDURA29   3
      ALDURB29   3   ALCHRC29   3   ALTIME30   3   ALUNIT30   3
      ALDURA30   3   ALDURB30   3   ALCHRC30   3   ALTIME31   3
      ALUNIT31   3   ALDURA31   3   ALDURB31   3   ALCHRC31   3
      ALTIME32   3   ALUNIT32   3   ALDURA32   3   ALDURB32   3
      ALCHRC32   3   ALTIME33   3   ALUNIT33   3   ALDURA33   3
      ALDURB33   3   ALCHRC33   3   ALTIME34   3   ALUNIT34   3
      ALDURA34   3   ALDURB34   3   ALCHRC34   3   ALTIME90   3
      ALUNIT90   3   ALDURA90   3   ALDURB90   3   ALCHRC90   3
      ALTIME91   3   ALUNIT91   3   ALDURA91   3   ALDURB91   3
      ALCHRC91   3   ALCNDRT    3   ALCHRONR   3

      /* AHB LENGTHS */

      SMKEV      3   SMKREG     3   SMKNOW     3   SMKSTAT2   3
      SMKQTNO    3   SMKQTTP    3   SMKQTY     3   CIGSDA1    3
      CIGDAMO    3   CIGSDA2    3   CIGSDAY    3   CIGQTYR    3
      SMKANY     3   SMKAGX_P   3   SMKNOWX    3   SMKNOX_P   3
      SMKNOTPX   3   CIGDAMOX   3   VIGNO      4   VIGTP      3
      VIGFREQW   3   VIGLNGNO   4   VIGLNGTP   3   VIGMIN     4
      MODNO      4   MODTP      3   MODFREQW   3   MODLNGNO   4
      MODLNGTP   3   MODMIN     4   STRNGNO    4   STRNGTP    3
      STRFREQW   3   ALC1YR     3   ALCLIFE    3   ALC12MNO   4
      ALC12MTP   3   ALC12MWK   3   ALC12MYR   4   ALCAMT     3
      ALCSTAT    3   ALC5UPN1   4   ALC5UPT1   3   ALC5UPY1   4
      BINGE1     3   AHEIGHT    3   AWEIGHTP   4   BMI        8

      /* AAU LENGTHS */

      AUSUALPL   3   APLKIND    3   AHCPLROU   3   AHCPLKND   3
      AHCCHGYR   3   AHCCHGHI   3   APRVTRYR   3   APRVTRFD   3
      ADRNANP    3   ADRNAI     3   AHCDLYR1   3   AHCDLYR2   3
      AHCDLYR3   3   AHCDLYR4   3   AHCDLYR5   3   AHCAFYR1   3
      AHCAFYR2   3   AHCAFYR3   3   AHCAFYR4   3   AHCAFYR5   3
      AHCAFYR6   3   AWORPAY    3   AHICOMP    3   ARX12MO    3
      ARX12_1    3   ARX12_2    3   ARX12_3    3   ARX12_4    3
      ARX12_5    3   ARX12_6    3   ADNLONG2   3   AHCSYR1    3
      AHCSYR2    3   AHCSYR3    3   AHCSYR4    3   AHCSYR5    3
      AHCSYR6    3   AHCSYR7    3   AHCSYR8    3   AHCSYR9    3
      AHCSYR10   3   AHERNOY2   3   AERVISND   3   AERHOS     3
      AERREA1R   3   AERREA2R   3   AERREA3R   3   AERREA4R   3
      AERREA5R   3   AERREA6R   3   AERREA7R   3   AERREA8R   3
      AHCHYR     3   AHCHMOYR   3   AHCHNOY2   3   AHCNOYR2   3
      ASRGYR     3   ASRGNOYR   3   AMDLONGR   3   HIT1A      3
      HIT2A      3   HIT3A      3   HIT4A      3   HIT5A      3
      SHTFLU2    3   ASHFLUM2   3   ASHFLUY2   4   FLUSHPG1   3
      FLUSHPG2   3   SPRFLU2    3   ASPFLUM2   3   ASPFLUY2   4
      SHTPNUYR   3   APOX       3   APOX12MO   3   AHEP       3
      AHEPLIV    3   AHEPBTST   3   SHTHEPB    3   SHEPDOS    3
      SHTHEPA    3   SHEPANUM   3   AHEPCTST   3   AHEPCRES   3
      SHINGLES   3   SHTTD      3   SHTTD05    3   SHTTDAP2   3
      SHTHPV2    3   SHHPVDOS   3   AHPVAGE    4   LIVEV      3
      TRAVEL     3   WRKHLTH2   3   WRKDIR     3   APSBPCHK   3
      APSCHCHK   3   APSBSCHK   3   APSPAP     3   APSMAM     3
      APSCOL     3   APSDIET    3   APSSMKC    3   AINDINS2   3
      AINDPRCH   3   AINDWHO    3   AINDDIF1   3   AINDDIF2   3
      AEXCHNG    3

      /* ASI LENGTHS */

      ASICPUSE   3   ASISATHC   3   ASITENUR   3   ASINHELP   3
      ASINCNTO   3   ASINTRU    3   ASINKNT    3   ASISIM     3
      ASISIF     3   ASIRETR    3   ASIMEDC    3   ASISTLV    3
      ASICNHC    3   ASICCOLL   3   ASINBILL   3   ASIHCST    3
      ASICCMP    3   ASISLEEP   3   ASISLPFL   3   ASISLPST   3
      ASISLPMD   3   ASIREST    3   ASISAD     3   ASINERV    3
      ASIRSTLS   3   ASIHOPLS   3   ASIEFFRT   3   ASIWTHLS   3
      ASIMUCH    3   ASIHIVT    3   ASIHIVWN   3

      /* AWB LENGTHS */

      AWEBUSE    3   AWEBOFNO   4   AWEBOFTP   3   AWEBORP    3
      AWEBEML    3   AWEBMNO    4   AWEBMTP    3 ;

   * INPUT ALL VARIABLES;

   INPUT

      /* IDN LOCATIONS */

      RECTYPE       1 -   2    SRVY_YR       3 -   6
      HHX      $    7 -  12    INTV_QRT     13 -  13
      INTV_MON     14 -  15    FMX      $   16 -  17
      FPX      $   18 -  19    WTIA_SA      20 -  26 .1
      WTFA_SA      27 -  32

      /* UCF LOCATIONS */

      REGION       33 -  33    STRAT_P      34 -  36
      PSU_P        37 -  38

      /* HHC LOCATIONS */

      SEX          39 -  39    HISPAN_I     40 -  41
      RACERPI2     42 -  43    MRACRPI2     44 -  45
      MRACBPI2     46 -  47    AGE_P        48 -  49


      /* FID LOCATIONS */

      R_MARITL     50 -  50    PAR_STAT     51 -  51


      /* AID LOCATIONS */

      PROXYSA      52 -  52    PROX1        53 -  53
      PROX2        54 -  54    LATEINTA     55 -  55


      /* FDB LOCATIONS */

      FDRN_FLG     56 -  56

      /* ASD LOCATIONS */

      DOINGLWA     57 -  57    WHYNOWKA     58 -  59
      EVERWRK      60 -  60    INDSTRN1     61 -  62
      INDSTRN2     63 -  64    OCCUPN1      65 -  66
      OCCUPN2      67 -  68    SUPERVIS     69 -  69
      WRKCATA      70 -  70    BUSINC1A     71 -  71
      LOCALL1B     72 -  73    YRSWRKPA     74 -  75
      WRKLONGH     76 -  76    HOURPDA      77 -  77
      PDSICKA      78 -  78    ONEJOB       79 -  79
      WRKLYR4      80 -  80    INDSTLH1     81 -  82
      INDSTLH2     83 -  84    OCCLH1       85 -  86
      OCCLH2       87 -  88    WRKCTLH      89 -  89
      YRSWKLH      90 -  91    WRKARR_P     92 -  92
      WORKSCHD     93 -  93    NIGHTWK      94 -  94
      NIGHTFRP     95 -  95    WRK_FAM      96 -  96
      JOBDMAND     97 -  97    JOBCNTRL     98 -  98
      JOBSPPRT     99 -  99    WORLSJOB    100 - 100
      SAFETY      101 - 101    SAFCLIMT    102 - 102
      HARASSED    103 - 103    HARASFRQ    104 - 104
      EXERTION    105 - 105    STAND       106 - 106
      TBSMKEXP    107 - 107    HLTHPROM    108 - 108
      HPROMPAR    109 - 109

      /* ACN LOCATIONS */

      HYPEV       110 - 110    HYPDIFV     111 - 111
      HYPYR1      112 - 112    HYPMDEV2    113 - 113
      HYPMED2     114 - 114    CHLEV       115 - 115
      CHLYR       116 - 116    CHLMDEV2    117 - 117
      CHLMDNW2    118 - 118    CHDEV       119 - 119
      ANGEV       120 - 120    MIEV        121 - 121
      HRTEV       122 - 122    STREV       123 - 123
      EPHEV       124 - 124    COPDEV      125 - 125
      ASPMEDEV    126 - 126    ASPMEDAD    127 - 127
      ASPMDMED    128 - 128    ASPONOWN    129 - 129
      AASMEV      130 - 130    AASSTILL    131 - 131
      AASMYR      132 - 132    AASERYR1    133 - 133
      ULCEV       134 - 134    ULCYR       135 - 135
      ULCCOLEV    136 - 136    CANEV       137 - 137
      CNKIND1     138 - 138    CNKIND2     139 - 139
      CNKIND3     140 - 140    CNKIND4     141 - 141
      CNKIND5     142 - 142    CNKIND6     143 - 143
      CNKIND7     144 - 144    CNKIND8     145 - 145
      CNKIND9     146 - 146    CNKIND10    147 - 147
      CNKIND11    148 - 148    CNKIND12    149 - 149
      CNKIND13    150 - 150    CNKIND14    151 - 151
      CNKIND15    152 - 152    CNKIND16    153 - 153
      CNKIND17    154 - 154    CNKIND18    155 - 155
      CNKIND19    156 - 156    CNKIND20    157 - 157
      CNKIND21    158 - 158    CNKIND22    159 - 159
      CNKIND23    160 - 160    CNKIND24    161 - 161
      CNKIND25    162 - 162    CNKIND26    163 - 163
      CNKIND27    164 - 164    CNKIND28    165 - 165
      CNKIND29    166 - 166    CNKIND30    167 - 167
      CNKIND31    168 - 168    CANAGE1     169 - 171
      CANAGE2     172 - 174    CANAGE3     175 - 177
      CANAGE4     178 - 180    CANAGE5     181 - 183
      CANAGE6     184 - 186    CANAGE7     187 - 189
      CANAGE8     190 - 192    CANAGE9     193 - 195
      CANAGE10    196 - 198    CANAGE11    199 - 201
      CANAGE12    202 - 204    CANAGE13    205 - 207
      CANAGE14    208 - 210    CANAGE15    211 - 213
      CANAGE16    214 - 216    CANAGE17    217 - 219
      CANAGE18    220 - 222    CANAGE19    223 - 225
      CANAGE20    226 - 228    CANAGE21    229 - 231
      CANAGE22    232 - 234    CANAGE23    235 - 237
      CANAGE24    238 - 240    CANAGE25    241 - 243
      CANAGE26    244 - 246    CANAGE27    247 - 249
      CANAGE28    250 - 252    CANAGE29    253 - 255
      CANAGE30    256 - 258    DIBEV       259 - 259
      DIBPRE1     260 - 260    DIBAGE      261 - 262
      DIFAGE2     263 - 264    INSLN       265 - 265
      DIBPILL     266 - 266    EPILEP1     267 - 267
      EPILEP2     268 - 268    EPILEP3     269 - 269
      EPILEP4     270 - 270    EPILEP5     271 - 271
      AHAYFYR     272 - 272    SINYR       273 - 273
      CBRCHYR     274 - 274    KIDWKYR     275 - 275
      LIVYR       276 - 276    JNTSYMP     277 - 277
      JMTHP1      278 - 278    JMTHP2      279 - 279
      JMTHP3      280 - 280    JMTHP4      281 - 281
      JMTHP5      282 - 282    JMTHP6      283 - 283
      JMTHP7      284 - 284    JMTHP8      285 - 285
      JMTHP9      286 - 286    JMTHP10     287 - 287
      JMTHP11     288 - 288    JMTHP12     289 - 289
      JMTHP13     290 - 290    JMTHP14     291 - 291
      JMTHP15     292 - 292    JMTHP16     293 - 293
      JMTHP17     294 - 294    JNTCHR      295 - 295
      JNTHP       296 - 296    ARTH1       297 - 297
      ARTHLMT     298 - 298    CTSEVER     299 - 299
      CTSYR       300 - 300    CTSWKRL1    301 - 301
      CTSWKRL2    302 - 302    PAINECK     303 - 303
      PAINLB      304 - 304    PAINLEG     305 - 305
      LBPFREQ     306 - 306    LBPSEV      307 - 307
      LBPWKREL    308 - 308    LBPWKRL2    309 - 309
      LBPWCCLM    310 - 310    LBPWCBEN    311 - 311
      LBPWKDAY    312 - 313    LBPCHJOB    314 - 314
      PAINFACE    315 - 315    AMIGR       316 - 316
      ACOLD2W     317 - 317    AINTIL2W    318 - 318
      PREGNOW     319 - 319    PREGFLYR    320 - 320
      HRAIDNOW    321 - 321    HRAIDEV     322 - 322
      AHEARST1    323 - 323    AVISION     324 - 324
      ABLIND      325 - 325    LUPPRT      326 - 326


      /* AHS LOCATIONS */

      WKDAYR      327 - 329    BEDDAYR     330 - 332
      AHSTATYR    333 - 333    SPECEQ      334 - 334
      FLWALK      335 - 335    FLCLIMB     336 - 336
      FLSTAND     337 - 337    FLSIT       338 - 338
      FLSTOOP     339 - 339    FLREACH     340 - 340
      FLGRASP     341 - 341    FLCARRY     342 - 342
      FLPUSH      343 - 343    FLSHOP      344 - 344
      FLSOCL      345 - 345    FLRELAX     346 - 346
      FLA1AR      347 - 347    AFLHCA1     348 - 348
      AFLHCA2     349 - 349    AFLHCA3     350 - 350
      AFLHCA4     351 - 351    AFLHCA5     352 - 352
      AFLHCA6     353 - 353    AFLHCA7     354 - 354
      AFLHCA8     355 - 355    AFLHCA9     356 - 356
      AFLHCA10    357 - 357    AFLHCA11    358 - 358
      AFLHCA12    359 - 359    AFLHCA13    360 - 360
      ALHCA14A    361 - 361    AFLHCA15    362 - 362
      AFLHCA16    363 - 363    AFLHCA17    364 - 364
      AFLHCA18    365 - 365    AFLHC19_    366 - 366
      AFLHC20_    367 - 367    AFLHC21_    368 - 368
      AFLHC22_    369 - 369    AFLHC23_    370 - 370
      AFLHC24_    371 - 371    AFLHC25_    372 - 372
      AFLHC26_    373 - 373    AFLHC27_    374 - 374
      AFLHC28_    375 - 375    AFLHC29_    376 - 376
      AFLHC30_    377 - 377    AFLHC31_    378 - 378
      AFLHC32_    379 - 379    AFLHC33_    380 - 380
      AFLHC34_    381 - 381    AFLHCA90    382 - 382
      AFLHCA91    383 - 383    ALTIME1     384 - 385
      ALUNIT1     386 - 386    ALDURA1     387 - 388
      ALDURB1     389 - 389    ALCHRC1     390 - 390
      ALTIME2     391 - 392    ALUNIT2     393 - 393
      ALDURA2     394 - 395    ALDURB2     396 - 396
      ALCHRC2     397 - 397    ALTIME3     398 - 399
      ALUNIT3     400 - 400    ALDURA3     401 - 402
      ALDURB3     403 - 403    ALCHRC3     404 - 404
      ALTIME4     405 - 406    ALUNIT4     407 - 407
      ALDURA4     408 - 409    ALDURB4     410 - 410
      ALCHRC4     411 - 411    ALTIME5     412 - 413
      ALUNIT5     414 - 414    ALDURA5     415 - 416
      ALDURB5     417 - 417    ALCHRC5     418 - 418
      ALTIME6     419 - 420    ALUNIT6     421 - 421
      ALDURA6     422 - 423    ALDURB6     424 - 424
      ALCHRC6     425 - 425    ALTIME7     426 - 427
      ALUNIT7     428 - 428    ALDURA7     429 - 430
      ALDURB7     431 - 431    ALCHRC7     432 - 432
      ALTIME8     433 - 434    ALUNIT8     435 - 435
      ALDURA8     436 - 437    ALDURB8     438 - 438
      ALCHRC8     439 - 439    ALTIME9     440 - 441
      ALUNIT9     442 - 442    ALDURA9     443 - 444
      ALDURB9     445 - 445    ALCHRC9     446 - 446
      ALTIME10    447 - 448    ALUNIT10    449 - 449
      ALDURA10    450 - 451    ALDURB10    452 - 452
      ALCHRC10    453 - 453    ALTIME11    454 - 455
      ALUNIT11    456 - 456    ALDURA11    457 - 458
      ALDURB11    459 - 459    ALCHRC11    460 - 460
      ALTIME12    461 - 462    ALUNIT12    463 - 463
      ALDURA12    464 - 465    ALDURB12    466 - 466
      ALCHRC12    467 - 467    ALTIME13    468 - 469
      ALUNIT13    470 - 470    ALDURA13    471 - 472
      ALDURB13    473 - 473    ALCHRC13    474 - 474
      ATIME14A    475 - 476    AUNIT14A    477 - 477
      ADURA14A    478 - 479    ADURB14A    480 - 480
      ACHRC14A    481 - 481    ALTIME15    482 - 483
      ALUNIT15    484 - 484    ALDURA15    485 - 486
      ALDURB15    487 - 487    ALCHRC15    488 - 488
      ALTIME16    489 - 490    ALUNIT16    491 - 491
      ALDURA16    492 - 493    ALDURB16    494 - 494
      ALCHRC16    495 - 495    ALTIME17    496 - 497
      ALUNIT17    498 - 498    ALDURA17    499 - 500
      ALDURB17    501 - 501    ALCHRC17    502 - 502
      ALTIME18    503 - 504    ALUNIT18    505 - 505
      ALDURA18    506 - 507    ALDURB18    508 - 508
      ALCHRC18    509 - 509    ALTIME19    510 - 511
      ALUNIT19    512 - 512    ALDURA19    513 - 514
      ALDURB19    515 - 515    ALCHRC19    516 - 516
      ALTIME20    517 - 518    ALUNIT20    519 - 519
      ALDURA20    520 - 521    ALDURB20    522 - 522
      ALCHRC20    523 - 523    ALTIME21    524 - 525
      ALUNIT21    526 - 526    ALDURA21    527 - 528
      ALDURB21    529 - 529    ALCHRC21    530 - 530
      ALTIME22    531 - 532    ALUNIT22    533 - 533
      ALDURA22    534 - 535    ALDURB22    536 - 536
      ALCHRC22    537 - 537    ALTIME23    538 - 539
      ALUNIT23    540 - 540    ALDURA23    541 - 542
      ALDURB23    543 - 543    ALCHRC23    544 - 544
      ALTIME24    545 - 546    ALUNIT24    547 - 547
      ALDURA24    548 - 549    ALDURB24    550 - 550
      ALCHRC24    551 - 551    ALTIME25    552 - 553
      ALUNIT25    554 - 554    ALDURA25    555 - 556
      ALDURB25    557 - 557    ALCHRC25    558 - 558
      ALTIME26    559 - 560    ALUNIT26    561 - 561
      ALDURA26    562 - 563    ALDURB26    564 - 564
      ALCHRC26    565 - 565    ALTIME27    566 - 567
      ALUNIT27    568 - 568    ALDURA27    569 - 570
      ALDURB27    571 - 571    ALCHRC27    572 - 572
      ALTIME28    573 - 574    ALUNIT28    575 - 575
      ALDURA28    576 - 577    ALDURB28    578 - 578
      ALCHRC28    579 - 579    ALTIME29    580 - 581
      ALUNIT29    582 - 582    ALDURA29    583 - 584
      ALDURB29    585 - 585    ALCHRC29    586 - 586
      ALTIME30    587 - 588    ALUNIT30    589 - 589
      ALDURA30    590 - 591    ALDURB30    592 - 592
      ALCHRC30    593 - 593    ALTIME31    594 - 595
      ALUNIT31    596 - 596    ALDURA31    597 - 598
      ALDURB31    599 - 599    ALCHRC31    600 - 600
      ALTIME32    601 - 602    ALUNIT32    603 - 603
      ALDURA32    604 - 605    ALDURB32    606 - 606
      ALCHRC32    607 - 607    ALTIME33    608 - 609
      ALUNIT33    610 - 610    ALDURA33    611 - 612
      ALDURB33    613 - 613    ALCHRC33    614 - 614
      ALTIME34    615 - 616    ALUNIT34    617 - 617
      ALDURA34    618 - 619    ALDURB34    620 - 620
      ALCHRC34    621 - 621    ALTIME90    622 - 623
      ALUNIT90    624 - 624    ALDURA90    625 - 626
      ALDURB90    627 - 627    ALCHRC90    628 - 628
      ALTIME91    629 - 630    ALUNIT91    631 - 631
      ALDURA91    632 - 633    ALDURB91    634 - 634
      ALCHRC91    635 - 635    ALCNDRT     636 - 636
      ALCHRONR    637 - 637

      /* AHB LOCATIONS */

      SMKEV       638 - 638    SMKREG      639 - 640
      SMKNOW      641 - 641    SMKSTAT2    642 - 642
      SMKQTNO     643 - 644    SMKQTTP     645 - 645
      SMKQTY      646 - 647    CIGSDA1     648 - 649
      CIGDAMO     650 - 651    CIGSDA2     652 - 653
      CIGSDAY     654 - 655    CIGQTYR     656 - 656
      SMKANY      657 - 657    SMKAGX_P    658 - 659
      SMKNOWX     660 - 660    SMKNOX_P    661 - 662
      SMKNOTPX    663 - 663    CIGDAMOX    664 - 665
      VIGNO       666 - 668    VIGTP       669 - 669
      VIGFREQW    670 - 671    VIGLNGNO    672 - 674
      VIGLNGTP    675 - 675    VIGMIN      676 - 678
      MODNO       679 - 681    MODTP       682 - 682
      MODFREQW    683 - 684    MODLNGNO    685 - 687
      MODLNGTP    688 - 688    MODMIN      689 - 691
      STRNGNO     692 - 694    STRNGTP     695 - 695
      STRFREQW    696 - 697    ALC1YR      698 - 698
      ALCLIFE     699 - 699    ALC12MNO    700 - 702
      ALC12MTP    703 - 703    ALC12MWK    704 - 705
      ALC12MYR    706 - 708    ALCAMT      709 - 710
      ALCSTAT     711 - 712    ALC5UPN1    713 - 715
      ALC5UPT1    716 - 716    ALC5UPY1    717 - 719
      BINGE1      720 - 721    AHEIGHT     722 - 723
      AWEIGHTP    724 - 726    BMI         727 - 730 .2


      /* AAU LOCATIONS */

      AUSUALPL    731 - 731    APLKIND     732 - 732
      AHCPLROU    733 - 733    AHCPLKND    734 - 734
      AHCCHGYR    735 - 735    AHCCHGHI    736 - 736
      APRVTRYR    737 - 737    APRVTRFD    738 - 738
      ADRNANP     739 - 739    ADRNAI      740 - 740
      AHCDLYR1    741 - 741    AHCDLYR2    742 - 742
      AHCDLYR3    743 - 743    AHCDLYR4    744 - 744
      AHCDLYR5    745 - 745    AHCAFYR1    746 - 746
      AHCAFYR2    747 - 747    AHCAFYR3    748 - 748
      AHCAFYR4    749 - 749    AHCAFYR5    750 - 750
      AHCAFYR6    751 - 751    AWORPAY     752 - 752
      AHICOMP     753 - 753    ARX12MO     754 - 754
      ARX12_1     755 - 755    ARX12_2     756 - 756
      ARX12_3     757 - 757    ARX12_4     758 - 758
      ARX12_5     759 - 759    ARX12_6     760 - 760
      ADNLONG2    761 - 761    AHCSYR1     762 - 762
      AHCSYR2     763 - 763    AHCSYR3     764 - 764
      AHCSYR4     765 - 765    AHCSYR5     766 - 766
      AHCSYR6     767 - 767    AHCSYR7     768 - 768
      AHCSYR8     769 - 769    AHCSYR9     770 - 770
      AHCSYR10    771 - 771    AHERNOY2    772 - 773
      AERVISND    774 - 774    AERHOS      775 - 775
      AERREA1R    776 - 776    AERREA2R    777 - 777
      AERREA3R    778 - 778    AERREA4R    779 - 779
      AERREA5R    780 - 780    AERREA6R    781 - 781
      AERREA7R    782 - 782    AERREA8R    783 - 783
      AHCHYR      784 - 784    AHCHMOYR    785 - 786
      AHCHNOY2    787 - 788    AHCNOYR2    789 - 790
      ASRGYR      791 - 791    ASRGNOYR    792 - 793
      AMDLONGR    794 - 794    HIT1A       795 - 795
      HIT2A       796 - 796    HIT3A       797 - 797
      HIT4A       798 - 798    HIT5A       799 - 799
      SHTFLU2     800 - 800    ASHFLUM2    801 - 802
      ASHFLUY2    803 - 806    FLUSHPG1    807 - 807
      FLUSHPG2    808 - 808    SPRFLU2     809 - 809
      ASPFLUM2    810 - 811    ASPFLUY2    812 - 815
      SHTPNUYR    816 - 816    APOX        817 - 817
      APOX12MO    818 - 818    AHEP        819 - 819
      AHEPLIV     820 - 820    AHEPBTST    821 - 821
      SHTHEPB     822 - 822    SHEPDOS     823 - 823
      SHTHEPA     824 - 824    SHEPANUM    825 - 826
      AHEPCTST    827 - 827    AHEPCRES    828 - 828
      SHINGLES    829 - 829    SHTTD       830 - 830
      SHTTD05     831 - 831    SHTTDAP2    832 - 832
      SHTHPV2     833 - 833    SHHPVDOS    834 - 835
      AHPVAGE     836 - 838    LIVEV       839 - 839
      TRAVEL      840 - 840    WRKHLTH2    841 - 841
      WRKDIR      842 - 842    APSBPCHK    843 - 843
      APSCHCHK    844 - 844    APSBSCHK    845 - 845
      APSPAP      846 - 846    APSMAM      847 - 847
      APSCOL      848 - 848    APSDIET     849 - 849
      APSSMKC     850 - 850    AINDINS2    851 - 851
      AINDPRCH    852 - 852    AINDWHO     853 - 853
      AINDDIF1    854 - 854    AINDDIF2    855 - 855
      AEXCHNG     856 - 856

      /* ASI LOCATIONS */

      ASICPUSE    857 - 857    ASISATHC    858 - 858
      ASITENUR    859 - 859    ASINHELP    860 - 860
      ASINCNTO    861 - 861    ASINTRU     862 - 862
      ASINKNT     863 - 863    ASISIM      864 - 864
      ASISIF      865 - 865    ASIRETR     866 - 866
      ASIMEDC     867 - 867    ASISTLV     868 - 868
      ASICNHC     869 - 869    ASICCOLL    870 - 870
      ASINBILL    871 - 871    ASIHCST     872 - 872
      ASICCMP     873 - 873    ASISLEEP    874 - 875
      ASISLPFL    876 - 877    ASISLPST    878 - 879
      ASISLPMD    880 - 881    ASIREST     882 - 883
      ASISAD      884 - 884    ASINERV     885 - 885
      ASIRSTLS    886 - 886    ASIHOPLS    887 - 887
      ASIEFFRT    888 - 888    ASIWTHLS    889 - 889
      ASIMUCH     890 - 890    ASIHIVT     891 - 891
      ASIHIVWN    892 - 893

      /* AWB LOCATIONS */

      AWEBUSE     894 - 894    AWEBOFNO    895 - 897
      AWEBOFTP    898 - 898    AWEBORP     899 - 899
      AWEBEML     900 - 900    AWEBMNO     901 - 903
      AWEBMTP     904 - 904;

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
      WTIA_SA    ="Weight - Interim Annual"
      WTFA_SA    ="Weight - Final Annual"

      /* UCF LABELS */

      REGION     ="Region"
      STRAT_P    ="Pseudo-stratum for public use file variance estimation"
      PSU_P      ="Pseudo-PSU for public use file variance estimation"

      /* HHC LABELS */

      SEX        ="Sex"
      HISPAN_I   ="Hispanic subgroup detail"
      RACERPI2   ="OMB groups w/multiple race"
      MRACRPI2   ="Race coded to single/multiple race group"
      MRACBPI2   ="Race coded to single/multiple race group"
      AGE_P      ="Age"

      /* FID LABELS */

      R_MARITL   ="Marital Status"
      PAR_STAT   ="Sample adult is parent to 1+ minor child(ren) in the family"

      /* AID LABELS */

      PROXYSA    ="Sample adult status"
      PROX1      ="Knowledgeable proxy for Sample Adult available"
      PROX2      ="Relationship of SA proxy to SA"
      LATEINTA   ="Late Sample Adult interviews"

      /* FDB LABELS */

      FDRN_FLG   ="Disability Questions flag"

      /* ASD LABELS */

      DOINGLWA   ="Corrected employment status last week"
      WHYNOWKA   ="Main reason for not working last week"
      EVERWRK    ="Ever worked"
      INDSTRN1   ="Detailed industry classification based on 2012 Census codes"
      INDSTRN2   ="Simple industry classification based on 2012 Census codes"
      OCCUPN1    ="Detailed occupation classification based on 2010 Census Codes
"
      OCCUPN2    ="Simple occupation classification based on 2010 Census codes"
      SUPERVIS   ="Supervise other employees as part of job"
      WRKCATA    ="Class of worker"
      BUSINC1A   ="Current job an incorporated business"
      LOCALL1B   ="Number of employees at work"
      YRSWRKPA   ="Number of years on the job"
      WRKLONGH   ="Current/most recent job also longest held job"
      HOURPDA    ="Paid by the hour at current or most recent job"
      PDSICKA    ="Paid sick leave at current or most recent job"
      ONEJOB     ="Have more than one job"
      WRKLYR4    ="Work status: last week, past 12 months"
      INDSTLH1   =
"Detailed industry classification (current job is not longest job)"
      INDSTLH2   =
"Simple industry classification (current job is not longest job)"
      OCCLH1     =
"Detailed occupation classification (current job is not longest job)"
      OCCLH2     =
"Simple occupation classification (current job is not longest job)"
      WRKCTLH    ="Class of worker (current job is not longest job)"
      YRSWKLH    ="Number of years on this job (current  job is not longest job)
"
      WRKARR_P   ="Work arrangement"
      WORKSCHD   ="Usual work schedule"
      NIGHTWK    ="Work between 1 am and 5 am, past 30 days"
      NIGHTFRP   =
"How many times did you work between 1 am and 5 am, past 30 days"
      WRK_FAM    ="Job interferes with personal or family life"
      JOBDMAND   ="Have enough time to get job done"
      JOBCNTRL   ="Job allows me to make decisions"
      JOBSPPRT   ="Have support from supervisor when necessary"
      WORLSJOB   ="Worried about losing job"
      SAFETY     ="How safe is workplace"
      SAFCLIMT   ="Employee health/safety important to management"
      HARASSED   ="Threatened or harrassed while on the job"
      HARASFRQ   ="Frequency of harassment"
      EXERTION   =
"How often does job require repeated activities like lifting, pulling, etc"
      STAND      ="How often does job require standing or walking"
      TBSMKEXP   ="How often exposed to second-hand smoke at work, past 12 m"
      HLTHPROM   ="Health promotion programs available at work, past year"
      HPROMPAR   ="How often participate in health promotion programs, past year
"

      /* ACN LABELS */

      HYPEV      ="Ever been told you have hypertension"
      HYPDIFV    ="Ever had hypertension on 2+ visits"
      HYPYR1     ="Had hypertension, past 12 months"
      HYPMDEV2   ="Ever prescribed medicine for high blood pressure"
      HYPMED2    ="Now taking prescribed medicine for high blood pressure"
      CHLEV      ="Ever told you had high cholesterol"
      CHLYR      ="Had high cholesterol, past 12 months"
      CHLMDEV2   ="Ever prescribed medicine to lower cholesterol"
      CHLMDNW2   ="Now taking prescribed medicine to lower cholesterol"
      CHDEV      ="Ever been told you had coronary heart disease"
      ANGEV      ="Ever been told you had angina pectoris"
      MIEV       ="Ever been told you had a heart attack"
      HRTEV      ="Ever been told you had a heart condition/disease"
      STREV      ="Ever been told you had a stroke"
      EPHEV      ="Ever been told you had emphysema"
      COPDEV     ="Ever been told you had COPD"
      ASPMEDEV   ="Ever been told to take low-dose aspirin"
      ASPMEDAD   ="Following low-dose aspirin advice"
      ASPMDMED   ="Advised to stop taking low-dose aspirin"
      ASPONOWN   ="Taking low-dose aspirin on own"
      AASMEV     ="Ever been told you had asthma"
      AASSTILL   ="Still have asthma"
      AASMYR     ="Had an asthma episode/attack past 12 m"
      AASERYR1   ="Had visit to ER due to asthma past 12 m"
      ULCEV      ="Ever been told you have an ulcer"
      ULCYR      ="Had ulcer in past 12 m"
      ULCCOLEV   ="Ever been told you had Crohn's disease/ulcerative colitis"
      CANEV      ="Ever told by a doctor you had cancer"
      CNKIND1    ="What kind of cancer ... Bladder"
      CNKIND2    ="What kind of cancer ... Blood"
      CNKIND3    ="What kind of cancer ... Bone"
      CNKIND4    ="What kind of cancer ... Brain"
      CNKIND5    ="What kind of cancer ... Breast"
      CNKIND6    ="What kind of cancer ... Cervix"
      CNKIND7    ="What kind of cancer ... Colon"
      CNKIND8    ="What kind of cancer ... Esophagus"
      CNKIND9    ="What kind of cancer ... Gallbladder"
      CNKIND10   ="What kind of cancer ... Kidney"
      CNKIND11   ="What kind of cancer ... larynx-windpipe"
      CNKIND12   ="What kind of cancer ... Leukemia"
      CNKIND13   ="What kind of cancer ... Liver"
      CNKIND14   ="What kind of cancer ... Lung"
      CNKIND15   ="What kind of cancer ... Lymphoma"
      CNKIND16   ="What kind of cancer ... Melanoma"
      CNKIND17   ="What kind of cancer ... mouth/tongue/lip"
      CNKIND18   ="What kind of cancer ... Ovary"
      CNKIND19   ="What kind of cancer ... Pancreas"
      CNKIND20   ="What kind of cancer ... Prostate"
      CNKIND21   ="What kind of cancer ... Rectum"
      CNKIND22   ="What kind of cancer ... skin (non-melanoma)"
      CNKIND23   ="What kind of cancer ... skin (DK kind)"
      CNKIND24   ="What kind of cancer ... soft tissue (muscle or fat)"
      CNKIND25   ="What kind of cancer ... Stomach"
      CNKIND26   ="What kind of cancer ... Testis"
      CNKIND27   ="What kind of cancer ... throat - pharynx"
      CNKIND28   ="What kind of cancer ... Thyroid"
      CNKIND29   ="What kind of cancer ... Uterus"
      CNKIND30   ="What kind of cancer ... Other"
      CNKIND31   ="What kind of cancer ... more than 3 kinds"
      CANAGE1    ="Age first diagnosed w/bladder cancer"
      CANAGE2    ="Age first diagnosed w/blood cancer"
      CANAGE3    ="Age first diagnosed w/bone cancer"
      CANAGE4    ="Age first diagnosed w/brain cancer"
      CANAGE5    ="Age first diagnosed w/breast cancer"
      CANAGE6    ="Age first diagnosed w/cervical cancer"
      CANAGE7    ="Age first diagnosed w/colon cancer"
      CANAGE8    ="Age first diagnosed w/esophageal cancer"
      CANAGE9    ="Age first diagnosed w/gallbladder cancer"
      CANAGE10   ="Age first diagnosed w/kidney cancer"
      CANAGE11   ="Age first diagnosed w/larynx-windpipe cancer"
      CANAGE12   ="Age first diagnosed w/leukemia"
      CANAGE13   ="Age first diagnosed w/liver cancer"
      CANAGE14   ="Age first diagnosed w/lung cancer"
      CANAGE15   ="Age first diagnosed w/lymphoma"
      CANAGE16   ="Age first diagnosed w/melanoma"
      CANAGE17   ="Age first diagnosed w/mouth/tongue/lip cancer"
      CANAGE18   ="Age first diagnosed w/ovarian cancer"
      CANAGE19   ="Age first diagnosed w/pancreatic cancer"
      CANAGE20   ="Age first diagnosed w/prostate cancer"
      CANAGE21   ="Age first diagnosed w/rectal cancer"
      CANAGE22   ="Age first diagnosed w/skin (non-melanoma) cancer"
      CANAGE23   ="Age first diagnosed w/skin (DK kind) cancer"
      CANAGE24   ="Age first diagnosed w/soft tissue cancer"
      CANAGE25   ="Age first diagnosed w/stomach cancer"
      CANAGE26   ="Age first diagnosed w/testicular cancer"
      CANAGE27   ="Age first diagnosed w/throat/pharynx cancer"
      CANAGE28   ="Age first diagnosed w/thyroid cancer"
      CANAGE29   ="Age first diagnosed w/uterine cancer"
      CANAGE30   ="Age first diagnosed w/other cancer"
      DIBEV      ="Ever been told that you have diabetes"
      DIBPRE1    ="Ever had prediabetes or other symptoms"
      DIBAGE     ="Age first diagnosed w/diabetes"
      DIFAGE2    ="Years since first diagnosed w/diabetes"
      INSLN      ="NOW taking insulin"
      DIBPILL    ="NOW taking diabetic pills"
      EPILEP1    ="Ever been told you had seizure disorder/epilepsy"
      EPILEP2    ="Now taking epilepsy meds"
      EPILEP3    ="# Seizures past 12 m"
      EPILEP4    ="Seen neurologist/specialist past 12 m"
      EPILEP5    ="Epilepsy interfered w/ activities past 30 d"
      AHAYFYR    ="Told that you had hay fever, past 12 m"
      SINYR      ="Told that you had sinusitis, past 12 m"
      CBRCHYR    ="Told you had chronic bronchitis, 12 m"
      KIDWKYR    ="Told you had weak/failing kidneys, 12 m"
      LIVYR      ="Told you had liver condition, past 12 m"
      JNTSYMP    ="Symptoms of joint pain/aching/stiffness past 30 d"
      JMTHP1     ="Which joint affected...shoulder-right"
      JMTHP2     ="Which joint affected...shoulder-left"
      JMTHP3     ="Which joint affected...elbow-right"
      JMTHP4     ="Which joint affected...elbow-left"
      JMTHP5     ="Which joint affected...hip-right"
      JMTHP6     ="Which joint affected...hip-left"
      JMTHP7     ="Which joint affected...wrist-right"
      JMTHP8     ="Which joint affected...wrist-left"
      JMTHP9     ="Which joint affected...knee-right"
      JMTHP10    ="Which joint affected...knee-left"
      JMTHP11    ="Which joint affected...ankle-right"
      JMTHP12    ="Which joint affected...ankle-left"
      JMTHP13    ="Which joint affected...toes-right"
      JMTHP14    ="Which joint affected...toes-left"
      JMTHP15    ="Which joint affected...fingers/thumb-right"
      JMTHP16    ="Which joint affected...fingers/thumb-left"
      JMTHP17    ="Which joint affected...other joint not listed"
      JNTCHR     ="Joint symptoms begin more than 3 months ago"
      JNTHP      ="Ever seen doctor or health professional for joint symptoms"
      ARTH1      ="Ever been told you had arthritis"
      ARTHLMT    ="Limited due to arthritis or joint symptoms"
      CTSEVER    ="Ever been told you had carpal tunnel syndrome"
      CTSYR      ="Carpal tunnel synd past 12m"
      CTSWKRL1   ="Told carpal tunnel synd work-related"
      CTSWKRL2   ="Discuss w/ doc whether carpal tunnel synd work-related"
      PAINECK    ="Had neck pain, past 3 months"
      PAINLB     ="Had low back pain, past 3 months"
      PAINLEG    ="Pain spread down leg/below knees"
      LBPFREQ    ="How often had  low back pain past 3 m"
      LBPSEV     ="Amount of low back pain"
      LBPWKREL   ="Told low back pain work-related"
      LBPWKRL2   ="Discuss w/ doc whether low back pain work-related"
      LBPWCCLM   ="Ever filed workers' comp for low back pain"
      LBPWCBEN   ="Ever receive workers' comp for low back pain"
      LBPWKDAY   ="# Work days missed due to low back pain past 3 m"
      LBPCHJOB   ="Change in work activities due to low back pain past 3 m"
      PAINFACE   ="Had pain in jaw/front of ear, past 3 months"
      AMIGR      ="Had severe headache/migraine, past 3 m"
      ACOLD2W    ="Had a head/chest cold past 2 w"
      AINTIL2W   ="Had stomach prob w/vomit/diarrhea, 2 w"
      PREGNOW    ="Currently pregnant"
      PREGFLYR   ="Recently pregnant"
      HRAIDNOW   ="Now use a hearing aid"
      HRAIDEV    ="Ever used a hearing aid if not now using"
      AHEARST1   ="Hearing w/o hearing aid"
      AVISION    ="Trouble seeing even w/glasses/lenses"
      ABLIND     ="Blind or unable to see at all"
      LUPPRT     ="Lost all upper & lower natural teeth"

      /* AHS LABELS */

      WKDAYR     ="Number of work loss days, past 12 months"
      BEDDAYR    ="Number of bed days, past 12 months"
      AHSTATYR   ="Health better/worse/same, compared w/ 12 months ago"
      SPECEQ     ="Have health problem that requires special equipment"
      FLWALK     ="How difficult to walk 1/4 mile without special equipment"
      FLCLIMB    ="How difficult to climb 10 steps without special equipment"
      FLSTAND    ="How difficult to stand 2 hours without special equipment"
      FLSIT      ="How difficult to sit 2 hours without special equipment"
      FLSTOOP    =
"How difficult to stoop, bend or kneel without special equipment"
      FLREACH    ="How difficult to reach over head without special equipment"
      FLGRASP    =
"How difficult to grasp small objects without special equipment"
      FLCARRY    ="How difficult to lift/carry 10 lbs without special equipment"
      FLPUSH     ="How difficult to push large objects without special equipment
"
      FLSHOP     ="How difficult to go out to events without special equipment"
      FLSOCL     =
"How difficult to participate in social activities without special equipment"
      FLRELAX    ="How difficult to relax at home without special equipment"
      FLA1AR     ="Any functional limitation, all conditions"
      AFLHCA1    ="Vision/problem seeing causes difficulty with activity"
      AFLHCA2    ="Hearing problem causes difficulty with activity"
      AFLHCA3    ="Arthritis/rheumatism causes difficulty with activity"
      AFLHCA4    ="Back or neck problem causes difficulty with activity"
      AFLHCA5    ="Fracture, bone/joint injury causes difficulty with activity"
      AFLHCA6    ="Other injury causes difficulty with activity"
      AFLHCA7    ="Heart problem causes difficulty with activity"
      AFLHCA8    ="Stroke problem causes difficulty with activity"
      AFLHCA9    =
"Hypertension/high blood pressure causes difficulty with activity"
      AFLHCA10   ="Diabetes causes difficulty with activity"
      AFLHCA11   =
"Lung/breathing problem (e.g., asthma) causes difficulty with activity"
      AFLHCA12   ="Cancer causes difficulty with activity"
      AFLHCA13   ="Birth defect causes difficulty with activity"
      ALHCA14A   =
"Intellectual disability, AKA mental retardation causes difficulty with activity
"
      AFLHCA15   =
"Other developmental problem (eg, cerebral palsy) causes difficulty with activit
y"
      AFLHCA16   ="Senility causes difficulty with activity"
      AFLHCA17   =
"Depression/anxiety/emotional problem causes difficulty with activity"
      AFLHCA18   ="Weight problem causes difficulty with activity"
      AFLHC19_   =
"Missing or amputated limb/finger/digit causes difficulty with activity"
      AFLHC20_   =
"Musculoskeletal/connective tissue problem causes difficulty with activity"
      AFLHC21_   =
"Circulation problems (including blood clots) cause difficulty with activity"
      AFLHC22_   =
"Endocrine/nutritional/metabolic problem causes difficulty with activity"
      AFLHC23_   =
"Nervous system/sensory organ condition causes difficulty with activity"
      AFLHC24_   ="Digestive system problem causes difficulty with activity"
      AFLHC25_   ="Genitourinary system problem causes difficulty with activity"
      AFLHC26_   =
"Skin/subcutaneous system problem causes difficulty with activity"
      AFLHC27_   =
"Blood or blood-forming organ problem causes difficulty with activity"
      AFLHC28_   ="Benign tumor/cyst causes difficulty with activity"
      AFLHC29_   =
"Alcohol/drug/substance abuse problem causes difficulty with activity"
      AFLHC30_   =
"Other mental problem/ADD/Bipolar/Schizophrenia causes difficulty with activity"
      AFLHC31_   =
"Surgical after-effects/medical treatment causes difficulty with activity"
      AFLHC32_   =
'"Old age"/elderly/aging-related problem causes difficulty with activity'
      AFLHC33_   ="Fatigue/tiredness/weakness causes difficulty with activity"
      AFLHC34_   ="Pregnancy-related problem causes difficulty with activity"
      AFLHCA90   ="Other impairment/problem (1) causes difficulty with activity"
      AFLHCA91   ="Other impairment/problem (2) causes difficulty with activity"
      ALTIME1    ="Duration of vision problem: Number of units"
      ALUNIT1    ="Duration of vision problem: Time unit"
      ALDURA1    ="Duration (in years) of vision problem, recode 1"
      ALDURB1    ="Duration of vision problem, recode 2"
      ALCHRC1    ="Vision problem condition status recode"
      ALTIME2    ="Duration of hearing problem: Number of units"
      ALUNIT2    ="Duration of hearing problem: Time unit"
      ALDURA2    ="Duration (in years) of hearing problem, recode 1"
      ALDURB2    ="Duration of hearing problem, recode 2"
      ALCHRC2    ="Hearing problem condition status recode"
      ALTIME3    ="Duration of arthritis/rheumatism: Number of units"
      ALUNIT3    ="Duration of arthritis/rheumatism: Time unit"
      ALDURA3    ="Duration (in years) of arthritis/rheumatism, recode 1"
      ALDURB3    ="Duration of arthritis/rheumatism, recode 2"
      ALCHRC3    ="Arthritis/rheumatism condition status recode"
      ALTIME4    ="Duration of back or neck problem: Number of units"
      ALUNIT4    ="Duration of back or neck problem: Time unit"
      ALDURA4    ="Duration (in years) of back or neck problem, recode 1"
      ALDURB4    ="Duration of back or neck problem, recode 2"
      ALCHRC4    ="Back or neck problem condition status recode"
      ALTIME5    ="Duration of fracture, bone/joint injury: Number of units"
      ALUNIT5    ="Duration of fracture, bone/joint injury: Time unit"
      ALDURA5    ="Duration (in years) of fracture, bone/joint injury, recode 1"
      ALDURB5    ="Duration of fracture, bone/joint injury, recode 2"
      ALCHRC5    ="Fracture, bone/joint injury condition status recode"
      ALTIME6    ="Duration of other injury: Number of units"
      ALUNIT6    ="Duration of other injury: Time unit"
      ALDURA6    ="Duration (in years) of other injury, recode 1"
      ALDURB6    ="Duration of other injury, recode 2"
      ALCHRC6    ="Other injury condition status recode"
      ALTIME7    ="Duration of heart problem: Number of units"
      ALUNIT7    ="Duration of heart problem: Time unit"
      ALDURA7    ="Duration (in years) of heart problem, recode 1"
      ALDURB7    ="Duration of heart problem, recode 2"
      ALCHRC7    ="Heart problem condition status recode"
      ALTIME8    ="Duration of stroke problem: Number of units"
      ALUNIT8    ="Duration of stroke problem: Time unit"
      ALDURA8    ="Duration (in years) of stroke problem, recode 1"
      ALDURB8    ="Duration of stroke problem, recode 2"
      ALCHRC8    ="Stroke problem condition status recode"
      ALTIME9    =
"Duration of hypertension or high blood pressure: Number of units"
      ALUNIT9    ="Duration of hypertension or high blood pressure: Time unit"
      ALDURA9    =
"Duration (in years) of hypertension or high blood pressure: recode 1"
      ALDURB9    ="Duration of hypertension or high blood pressure: recode 2"
      ALCHRC9    ="Hypertension or high blood pressure condition status recode"
      ALTIME10   ="Duration of diabetes: Number of units"
      ALUNIT10   ="Duration of diabetes: Time unit"
      ALDURA10   ="Duration (in years) of diabetes, recode 1"
      ALDURB10   ="Duration of diabetes, recode 2"
      ALCHRC10   ="Diabetes condition status recode"
      ALTIME11   =
"Duration of lung/breathing problem (e.g., asthma and emphysema): Number of unit
s"
      ALUNIT11   =
"Duration of lung/breathing problem: (e.g., asthma and emphysema) Time unit"
      ALDURA11   =
"Duration (in years) of lung/breathing problem (e.g., asthma), recode 1"
      ALDURB11   =
"Duration of lung/breathing problem (e.g., asthma and emphysema), recode 2"
      ALCHRC11   =
"Lung/breathing problem (e.g., asthma and emphysema) condition status recode"
      ALTIME12   ="Duration of cancer: Number of units"
      ALUNIT12   ="Duration of cancer: Time unit"
      ALDURA12   ="Duration (in years) of cancer, recode 1"
      ALDURB12   ="Duration of cancer, recode 2"
      ALCHRC12   ="Cancer condition status recode"
      ALTIME13   ="Duration of birth defect: Number of units"
      ALUNIT13   ="Duration of birth defect: Time unit"
      ALDURA13   ="Duration (in years) of birth defect, recode 1"
      ALDURB13   ="Duration of birth defect, recode 2"
      ALCHRC13   ="Birth defect condition status recode"
      ATIME14A   =
"Duration of intellectual disability, AKA mental retardation: Number of units"
      AUNIT14A   =
"Duration of intellectual disability, also know as mental retardation: Time unit
"
      ADURA14A   =
"Duration (in years) of intellectual disability, AKA mental retardation, recode 
1"
      ADURB14A   =
"Duration of intellectual disability, also known as mental retardation, recode 2
"
      ACHRC14A   =
"Intellectual disability, AKA mental retardation condition status recode"
      ALTIME15   =
"Duration of other developmental problem (e.g., cerebral palsy): Number of units
"
      ALUNIT15   =
"Duration of other developmental problem (e.g., cerebral palsy): Time unit"
      ALDURA15   =
"Duration (in years) of other developmental problem (eg cerebral palsy), recode 
1"
      ALDURB15   =
"Duration of other developmental problem (e.g., cerebral palsy), recode 2"
      ALCHRC15   =
"Other developmental problem (e.g., cerebral palsy) condition status recode"
      ALTIME16   ="Duration of senility: Number of units"
      ALUNIT16   ="Duration of senility: Time unit"
      ALDURA16   ="Duration (in years) of senility, recode 1"
      ALDURB16   ="Duration of senility, recode 2"
      ALCHRC16   ="Senility condition status recode"
      ALTIME17   =
"Duration of depression/anxiety/emotional problem: Number of units"
      ALUNIT17   ="Duration of depression/anxiety/emotional problem: Time unit"
      ALDURA17   =
"Duration (in years) of depression/anxiety/emotional problem, recode 1"
      ALDURB17   ="Duration of depression/anxiety/emotional problem, recode 2"
      ALCHRC17   ="Depression/anxiety/emotional problem condition status recode"
      ALTIME18   ="Duration of weight problem: Number of units"
      ALUNIT18   ="Duration of weight problem: Time unit"
      ALDURA18   ="Duration (in years) of weight problem, recode 1"
      ALDURB18   ="Duration of weight problem, recode 2"
      ALCHRC18   ="Weight problem condition status recode"
      ALTIME19   =
"Duration of missing limbs (fingers, toes); amputation: Number of units"
      ALUNIT19   =
"Duration of missing limbs (fingers, toes, or digits); amputation: Time unit"
      ALDURA19   =
"Duration (in years) of missing limbs (fingers, toes); amputation, recode 1"
      ALDURB19   =
"Duration of missing limbs (fingers, toes, or digits); amputation, recode 2"
      ALCHRC19   =
"Missing limbs (fingers, toes, or digits); amputation condition status recode"
      ALTIME20   =
"Duration of musculoskeletal/connective tissue problem: Number of units"
      ALUNIT20   =
"Duration of musculoskeletal/connective tissue problem: Time unit"
      ALDURA20   =
"Duration (in years) of musculoskeletal/connective tissue problem, recode 1"
      ALDURB20   =
"Duration of musculoskeletal/connective tissue problem, recode 2"
      ALCHRC20   =
"Musculoskeletal/connective tissue problem condition status recode"
      ALTIME21   =
"Duration of circulation problems (including blood clots): Number of units"
      ALUNIT21   =
"Duration of circulation problems (including blood clots): Time unit"
      ALDURA21   =
"Duration (in years) of circulation problems (including blood clots), recode 1"
      ALDURB21   =
"Duration of circulation problems (including blood clots), recode 2"
      ALCHRC21   =
"Circulation problems (including blood clots) condition status recode"
      ALTIME22   =
"Duration of endocrine/nutritional/metabolic problem: Number of units"
      ALUNIT22   =
"Duration of endocrine/nutritional/metabolic problem: Time unit"
      ALDURA22   =
"Duration (in years) of endocrine/nutritional/metabolic problem, recode 1"
      ALDURB22   ="Duration of endocrine/nutritional/metabolic problem, recode 2
"
      ALCHRC22   =
"Endocrine/nutritional/metabolic problem condition status recode"
      ALTIME23   =
"Duration of nervous system/sensory organ condition: Number of units"
      ALUNIT23   ="Duration of nervous system/sensory organ condition: Time unit
"
      ALDURA23   =
"Duration (in years) of nervous system/sensory organ condition, recode 1"
      ALDURB23   ="Duration of nervous system/sensory organ condition, recode 2"
      ALCHRC23   ="Nervous system/sensory organ condition status recode"
      ALTIME24   ="Duration of digestive system problems: Number of units"
      ALUNIT24   ="Duration of digestive system problems: Time unit"
      ALDURA24   ="Duration (in years) of digestive system problems, recode 1"
      ALDURB24   ="Duration of digestive system problems, recode 2"
      ALCHRC24   ="Digestive system problems condition status recode"
      ALTIME25   ="Duration of genitourinary system problem: Number of units"
      ALUNIT25   ="Duration of genitourinary system problem: Time unit"
      ALDURA25   ="Duration (in years) of genitourinary system problem, recode 1
"
      ALDURB25   ="Duration of genitourinary system problem, recode 2"
      ALCHRC25   ="Genitourinary system problem condition status recode"
      ALTIME26   =
"Duration of skin/subcutaneous system problems: Number of units"
      ALUNIT26   ="Duration of skin/subcutaneous system problems: Time unit"
      ALDURA26   =
"Duration (in years) of skin/subcutaneous system problems, recode 1"
      ALDURB26   ="Duration of skin/subcutaneous system problems, recode 2"
      ALCHRC26   ="Skin/subcutaneous system problems condition status recode"
      ALTIME27   =
"Duration of blood or blood-forming organ problem: Number of units"
      ALUNIT27   ="Duration of blood or blood-forming organ problem: Time unit"
      ALDURA27   =
"Duration (in years) of blood or blood-forming organ problem, recode 1"
      ALDURB27   ="Duration of blood or blood-forming organ problem, recode 2"
      ALCHRC27   ="Blood or blood-forming organ problem condition status recode"
      ALTIME28   ="Duration of benign tumor/cyst: Number of units"
      ALUNIT28   ="Duration of benign tumor/cyst: Time unit"
      ALDURA28   ="Duration (in years) of benign tumor/cyst, recode 1"
      ALDURB28   ="Duration of benign tumor/cyst, recode 2"
      ALCHRC28   ="Benign tumor/cyst condition status recode"
      ALTIME29   =
"Duration of alcohol /drug/substance abuse problem: Number of units"
      ALUNIT29   ="Duration of alcohol/drug/substance abuse problem: Time unit"
      ALDURA29   =
"Duration (in years) of alcohol/drug/substance abuse problem, recode 1"
      ALDURB29   ="Duration of alcohol/drug/substance abuse problem, recode 2"
      ALCHRC29   ="Alcohol /drug/substance abuse problem condition status recode
"
      ALTIME30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Number of units"
      ALUNIT30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia: Time unit"
      ALDURA30   =
"Duration (in years) of other mental problem/ADD/Bipolar/Schizophrenia, recode 1
"
      ALDURB30   =
"Duration of other mental problem/ADD/Bipolar/Schizophrenia, recode 2"
      ALCHRC30   =
"Other mental problem/ADD/Bipolar/Schizophrenia condition status recode"
      ALTIME31   =
"Duration of surgical after-effects/medical treatment problems: Number of units"
      ALUNIT31   =
"Duration of surgical after-effects/medical treatment problems: Time unit"
      ALDURA31   =
"Duration (in years) of surgical after-effects/medical treatment prob, recode 1"
      ALDURB31   =
"Duration of surgical after-effects/medical treatment problems, recode 2"
      ALCHRC31   =
"Surgical after-effects/medical treatment problems condition status recode"
      ALTIME32   =
'Duration of "old age"/elderly/aging-related problems: Number of units'
      ALUNIT32   =
'Duration of "old age"/elderly/aging-related problems: Time unit'
      ALDURA32   =
'Duration (in years) of "old age"/elderly/aging-related problems, recode 1'
      ALDURB32   =
'Duration of "old age"/elderly/aging-related problems, recode 2'
      ALCHRC32   =
'"Old age"/elderly/aging-related problems condition status recode'
      ALTIME33   =
"Duration of fatigue/tiredness/weakness problem: Number of units"
      ALUNIT33   ="Duration of fatigue/tiredness/weakness problem: Time unit"
      ALDURA33   =
"Duration (in years) of fatigue/tiredness/weakness problem, recode 1"
      ALDURB33   ="Duration of fatigue/tiredness/weakness problem, recode 2"
      ALCHRC33   ="Fatigue/tiredness/weakness problem condition status recode"
      ALTIME34   ="Duration of pregnancy-related problem: Number of units"
      ALUNIT34   ="Duration of pregnancy-related problem: Time unit"
      ALDURA34   ="Duration (in years) of pregnancy-related problem, recode 1"
      ALDURB34   ="Duration of pregnancy-related problem, recode 2"
      ALCHRC34   ="Pregnancy-related condition status recode"
      ALTIME90   =
"Duration of other impairment/problem N.E.C. (1): Number of units"
      ALUNIT90   ="Duration of other impairment/problem N.E.C. (1): Time unit"
      ALDURA90   =
"Duration (in years) of other impairment/problem N.E.C. (1), recode 1"
      ALDURB90   ="Duration of other impairment/problem N.E.C. (1), recode 2"
      ALCHRC90   ="Other impairment/problem N.E.C. (1) condition status recode"
      ALTIME91   =
"Duration of other impairment/problem N.E.C. (2): Number of units"
      ALUNIT91   ="Duration of other impairment/problem N.E.C. (2): Time unit"
      ALDURA91   =
"Duration (in years) of other impairment/ problem N.E.C. (2), recode 1"
      ALDURB91   ="Duration of other impairment/problem N.E.C. (2), recode 2"
      ALCHRC91   ="Other impairment/problem N.E.C. (2) condition status recode"
      ALCNDRT    =
"Chronic condition recode for individual with functional limitation"
      ALCHRONR   ="Overall functional limitation recode by condition status"

      /* AHB LABELS */

      SMKEV      ="Ever smoked 100 cigarettes"
      SMKREG     ="Age first smoked fairly regularly"
      SMKNOW     ="Smoke freq: every day/some days/not at all"
      SMKSTAT2   ="Smoking Status: Recode"
      SMKQTNO    ="Time since quit: # of units"
      SMKQTTP    ="Time since quit: time period"
      SMKQTY     ="Time since quit smoking (in years)"
      CIGSDA1    ="Number cigs per day (daily smokers)"
      CIGDAMO    ="Number days smoked in past 30 days"
      CIGSDA2    ="Number cigs per day (some day smokers)"
      CIGSDAY    ="Number of cigarettes a day (all current smokers)"
      CIGQTYR    ="Tried quit smoking 1+ days, past 12 m"
      SMKANY     =
"Ever smoked a cigarette, even once (not smkd or dk if smkd 100+ cigs)"
      SMKAGX_P   =
"Age first time smoked a cigarette (not smkd or dk if smkd 100+ cigs)"
      SMKNOWX    =
"Smoke freq: every day/some days/not at all (not smkd or dk if smkd 100+ cigs)"
      SMKNOX_P   =
"Time since smoked cig:# of units(not smkd/dk if smkd 100+cigs,lst 1smkd,non-smk
)"
      SMKNOTPX   =
"Time since smoked a cigarette: time period (not smkd or dk if smkd 100+ cigs)"
      CIGDAMOX   =
"Number days smoked,past 30 days(not smkd/dk if smkd 100+ cigs,currently smking)
"
      VIGNO      ="Freq vigorous activity: # of units"
      VIGTP      ="Freq vigorous activity: Time units"
      VIGFREQW   ="Freq vigorous activity (times per wk)"
      VIGLNGNO   ="Duration vigorous activity: # units"
      VIGLNGTP   ="Duration vigorous activity: Time unit"
      VIGMIN     ="Duration vigorous activity (in minutes)"
      MODNO      ="Freq moderate activity: # of units"
      MODTP      ="Freq moderate activity: Time units"
      MODFREQW   ="Freq light/moderate activity (times per wk)"
      MODLNGNO   ="Duration moderate activity: # of units"
      MODLNGTP   ="Duration moderate activity: Time unit"
      MODMIN     ="Duration light/moderate activity (in minutes)"
      STRNGNO    ="Strength activity freq: # of units"
      STRNGTP    ="Strength activity freq: Time units"
      STRFREQW   ="Freq strength activity (times per wk)"
      ALC1YR     ="Ever had 12+ drinks in any  one year"
      ALCLIFE    ="Had 12+ drinks in ENTIRE LIFE"
      ALC12MNO   ="Freq drank alcohol pst yr:  # of units"
      ALC12MTP   ="Freq drank alcohol pst yr:  Time unit"
      ALC12MWK   ="Freq drank alcohol: Days per week"
      ALC12MYR   ="Freq drank alcohol: Days in past year"
      ALCAMT     ="Average # drinks on days drank"
      ALCSTAT    ="Alcohol drinking status: Recode"
      ALC5UPN1   ="Days 5+/4+ drinks, past yr: # days"
      ALC5UPT1   ="Days 5+/4+ drinks, past yr: Time unit"
      ALC5UPY1   ="Number of days had 5+/4+ drinks past year"
      BINGE1     ="Number of times had 5+/4+ drinks on AN OCCASION, past 30 days
"
      AHEIGHT    ="Total height in inches"
      AWEIGHTP   ="Weight without shoes (pounds)"
      BMI        ="Body Mass Index (BMI)"

      /* AAU LABELS */

      AUSUALPL   ="Place USUALLY go when sick"
      APLKIND    ="Place to go when sick (most often)"
      AHCPLROU   ="USUALLY go there for routine/preventive care"
      AHCPLKND   ="Place USUALLY go for routine/preventive care"
      AHCCHGYR   ="Change health care place, past 12 m"
      AHCCHGHI   ="Change related to health insurance"
      APRVTRYR   ="Trouble finding a doctor/provider, past 12 m"
      APRVTRFD   ="Able to find doctor/provider, past 12 m"
      ADRNANP    ="Doctor's office not accept you as new patient, past 12 m"
      ADRNAI     ="Doctor's office not accept your health insurance, past 12 m"
      AHCDLYR1   ="Couldn't get through on phone, past 12 m"
      AHCDLYR2   ="Couldn't get appointment soon enough, past 12 m"
      AHCDLYR3   ="Wait too long in doctor's office, past 12 m"
      AHCDLYR4   ="Not open when you could go, past 12 m"
      AHCDLYR5   ="No transportation, past 12 m"
      AHCAFYR1   ="Couldn't afford prescription medicine, past 12 m"
      AHCAFYR2   ="Couldn't afford mental health care/counseling, past 12 m"
      AHCAFYR3   ="Couldn't afford dental care, past 12 m"
      AHCAFYR4   ="Couldn't afford eyeglasses, past 12 m"
      AHCAFYR5   ="Couldn't afford to see a specialist, past 12 m"
      AHCAFYR6   ="Couldn't afford follow-up care, past 12 m"
      AWORPAY    ="Get sick or have accident, worried about paying medical bills
"
      AHICOMP    ="Health insurance coverage compared to a year ago"
      ARX12MO    =
"Prescribed medication by doctor/health professional, past 12 m"
      ARX12_1    ="Skipped medication doses to save money, past 12 m"
      ARX12_2    ="Took less medicine to save money, past 12 m"
      ARX12_3    ="Delayed filling a prescription to save money, past 12 m"
      ARX12_4    =
"Asked doctor for lower cost medication to save money, past 12 m"
      ARX12_5    =
"Bought prescription drugs from another country to save money, past 12 m"
      ARX12_6    ="Used alternative therapies to save money, past 12 m"
      ADNLONG2   ="Time since last saw a dentist"
      AHCSYR1    ="Seen/talked to mental health professional, past 12 m"
      AHCSYR2    ="Seen/talked to eye doctor, past 12 m"
      AHCSYR3    ="Seen/talked to foot doctor, past 12 m"
      AHCSYR4    ="Seen/talked to a chiropractor, past 12 m"
      AHCSYR5    ="Seen/talked to therapist (PT/OT/etc.), past 12 m"
      AHCSYR6    ="Seen/talked to a NP/PA/midwife, past 12 m"
      AHCSYR7    ="Seen/talked to OB/GYN, past 12 m"
      AHCSYR8    ="Seen/talked to a medical specialist, past 12 m"
      AHCSYR9    ="Seen/talked to a general doctor, past 12 m"
      AHCSYR10   ="Doctor treats both kids and adults"
      AHERNOY2   ="# times in ER/ED, past 12 m"
      AERVISND   ="ER visit at night or on weekend"
      AERHOS     ="ER visit resulted in hospital admission"
      AERREA1R   ="ER visit because didn't have another place to go"
      AERREA2R   ="ER visit because doctors office or clinic was not open"
      AERREA3R   ="ER visit because advised by health provider to go"
      AERREA4R   =
"ER visit because problem too serious for doctor's office/clinic"
      AERREA5R   ="ER visit because only hospital could help"
      AERREA6R   ="ER visit because it is closest provider"
      AERREA7R   ="ER visit because it is usual place to get care"
      AERREA8R   ="Arrived at ER by ambulance/other emergency vehicle"
      AHCHYR     ="Received home care from health professional, past 12 m"
      AHCHMOYR   ="# months of home care, past 12 m"
      AHCHNOY2   ="Total number of home visits"
      AHCNOYR2   ="Total number of office visits, past 12 m"
      ASRGYR     ="Surgery/surgical procedure, past 12 m"
      ASRGNOYR   ="# of surgeries, past 12 m"
      AMDLONGR   ="Time since last seen/talked to health professional"
      HIT1A      ="Looked up health information on Internet, past 12 m"
      HIT2A      ="Filled a prescription on Internet, past 12 m"
      HIT3A      ="Scheduled medical appointment on Internet, past 12 m"
      HIT4A      ="Communicated with health care provider by email, past 12 m"
      HIT5A      ="Used chat groups to learn about health topics, past 12 m"
      SHTFLU2    ="Flu shot past 12 m"
      ASHFLUM2   ="Month of most recent flu shot"
      ASHFLUY2   ="Year of most recent flu shot"
      FLUSHPG1   =
"Flu shot before/during current pregnancy, interviewed Jan-Mar or Aug-Dec, 2015"
      FLUSHPG2   ="Flu shot before/during/after a pregnancy"
      SPRFLU2    ="Flu nasal spray past 12 m"
      ASPFLUM2   ="Month of most recent flu nasal spray"
      ASPFLUY2   ="Year of most recent flu nasal spray"
      SHTPNUYR   ="Pneumonia shot (EVER)"
      APOX       ="Ever had chickenpox"
      APOX12MO   ="Chickenpox, past 12 m"
      AHEP       ="Ever had hepatitis"
      AHEPLIV    ="Ever lived w/ someone w/ hepatitis"
      AHEPBTST   ="Ever had a blood test for hepatitis B"
      SHTHEPB    ="Hepatitis B vaccine (EVER)"
      SHEPDOS    ="# doses of hepatitis B vaccine received"
      SHTHEPA    ="Hepatitis A vaccine (EVER)"
      SHEPANUM   ="# shots of hepatitis A vaccine received"
      AHEPCTST   ="Ever had a blood test for hepatitis C"
      AHEPCRES   ="Main reason tested for Hepatitis C"
      SHINGLES   ="Ever had the Zoster or Shingles vaccine"
      SHTTD      ="Tetanus shot in the past 10 years"
      SHTTD05    ="Tetanus shot given in 2005 or later"
      SHTTDAP2   ="Vaccine included pertussis/whooping cough"
      SHTHPV2    ="Ever received HPV shot/vaccine"
      SHHPVDOS   ="Number of HPV shots received"
      AHPVAGE    ="Age at first HPV shot"
      LIVEV      =
"Ever told you had any kind of chronic/long-term liver condition"
      TRAVEL     =
"Ever traveled outside USA since 1995 (Excluding EUR, JPN, AUS, NZL, and CAN)"
      WRKHLTH2   ="Work or volunteer in a health care setting"
      WRKDIR     ="Direct contact with patients"
      APSBPCHK   =
"Blood pressure checked by doctor/nurse/health professional, past 12 m"
      APSCHCHK   =
"Cholesterol checked by doctor/nurse/health professional, past 12 m"
      APSBSCHK   ="Fasting test for high blood sugar/diabetes, past 12 m"
      APSPAP     ="Pap smear/test, past 12 m"
      APSMAM     ="Mammogram, past 12 m"
      APSCOL     ="Test for colon cancer, past 12 m"
      APSDIET    =
"Doctor/health professional talked to you about diet, past 12 m"
      APSSMKC    =
"Doctor/health professional talked to you about smoking, past 12 m"
      AINDINS2   ="Tried to purchase health insurance directly, past 3 yrs"
      AINDPRCH   ="Purchased health insurance directly, past 3 yrs"
      AINDWHO    ="For whom was health insurance purchased, past 3 yrs"
      AINDDIF1   =
"How difficult to find health insurance for coverage needed, past 3 yrs"
      AINDDIF2   ="How difficult to find affordable health insurance, past 3 yrs
"
      AEXCHNG    =
"Looked into purchasing health insurance through Healthcare.gov or Marketplace"

      /* ASI LABELS */

      ASICPUSE   ="How often do you use a computer"
      ASISATHC   ="How satisfied with health care, past 12 mo"
      ASITENUR   ="Length of time living in neighborhood"
      ASINHELP   ="Agree/disagree…people in neighborhood help each other"
      ASINCNTO   ="Agree/disagree…people I count on in neighborhood"
      ASINTRU    ="Agree/disagree…people in neighborhood can be trusted"
      ASINKNT    ="Agree/disagree…close-knit neighborhood"
      ASISIM     ="How you think of yourself (sexual orientation; male)"
      ASISIF     ="How do you think of yourself (sexual orientation; female)"
      ASIRETR    ="How worried are you about…money for retirement"
      ASIMEDC    ="How worried are you about…medical costs of illness/accident"
      ASISTLV    ="How worried are you about…maintaining standard of living"
      ASICNHC    ="How worried are you about…medical costs of healthcare"
      ASICCOLL   ="How worried are you about…paying for children's college"
      ASINBILL   ="How worried are you about…paying monthly bills"
      ASIHCST    ="How worried are you about…paying rent/mortgage/housing costs"
      ASICCMP    ="How worried are you about…credit card payments"
      ASISLEEP   ="Hours of sleep"
      ASISLPFL   ="# times having trouble falling asleep, past week"
      ASISLPST   ="# times having trouble staying asleep, past week"
      ASISLPMD   ="# times taking medication for sleep, past week"
      ASIREST    ="Days woke up feeling rested, past week"
      ASISAD     ="So sad nothing cheers you up, past 30 days"
      ASINERV    ="How often felt nervous, past 30 days"
      ASIRSTLS   ="How often restless/fidgety, past 30 days"
      ASIHOPLS   ="How often felt hopeless, past 30 days"
      ASIEFFRT   ="How often felt everything was an effort, past 30 days"
      ASIWTHLS   ="How often felt worthless, past 30 days"
      ASIMUCH    ="Feelings interfered w/ life, past 30 days"
      ASIHIVT    ="Ever been tested for HIV"
      ASIHIVWN   ="Main reason not tested for HIV"

      /* AWB LABELS */

      AWEBUSE    ="Internet use"
      AWEBOFNO   ="Frequency internet use: # of units"
      AWEBOFTP   ="Frequency internet use: Time units"
      AWEBORP    ="Online research panel membership"
      AWEBEML    ="Email use"
      AWEBMNO    ="Frequency email use: # of units"
      AWEBMTP    ="Frequency email use: Time units"
   ;

   * ASSOCIATE VARIABLES WITH FORMAT VALUES;
   *    (PUT ASTERISK (*) BEFORE WORD "FORMAT"
        IN NEXT STATEMENT TO PREVENT FORMAT
        ASSOCIATIONS BEING STORED WITH DATA SET);
   FORMAT

      /* IDN FORMAT ASSOCIATIONS */

      RECTYPE   SAP001X.   SRVY_YR   SAP002X.   HHX       $GROUPC.
      INTV_QRT  SAP004X.   INTV_MON  SAP005X.   WTIA_SA   GROUPN.
      WTFA_SA   GROUPN.

      /* UCF FORMAT ASSOCIATIONS */

      REGION    SAP010X.

      /* HHC FORMAT ASSOCIATIONS */

      SEX       SAP013X.   HISPAN_I  SAP014X.   RACERPI2  SAP015X.
      MRACRPI2  SAP016X.   MRACBPI2  SAP017X.   AGE_P     SAP018X.

      /* FID FORMAT ASSOCIATIONS */

      R_MARITL  SAP019X.   PAR_STAT  SAP020X.

      /* AID FORMAT ASSOCIATIONS */

      PROXYSA   SAP021X.   PROX1     SAP022X.   PROX2     SAP023X.
      LATEINTA  SAP024X.

      /* FDB FORMAT ASSOCIATIONS */

      FDRN_FLG  SAP025X.

      /* ASD FORMAT ASSOCIATIONS */

      DOINGLWA  SAP026X.   WHYNOWKA  SAP027X.   EVERWRK   SAP028X.
      INDSTRN1  SAP029X.   INDSTRN2  SAP029X.   OCCUPN1   SAP031X.
      OCCUPN2   SAP031X.   SUPERVIS  SAP028X.   WRKCATA   SAP034X.
      BUSINC1A  SAP028X.   LOCALL1B  SAP036X.   YRSWRKPA  SAP037X.
      WRKLONGH  SAP028X.   HOURPDA   SAP028X.   PDSICKA   SAP028X.
      ONEJOB    SAP028X.   WRKLYR4   SAP042X.   INDSTLH1  SAP029X.
      INDSTLH2  SAP029X.   OCCLH1    SAP031X.   OCCLH2    SAP031X.
      WRKCTLH   SAP047X.   YRSWKLH   SAP037X.   WRKARR_P  SAP049X.
      WORKSCHD  SAP050X.   NIGHTWK   SAP028X.   NIGHTFRP  SAP052X.
      WRK_FAM   SAP053X.   JOBDMAND  SAP053X.   JOBCNTRL  SAP053X.
      JOBSPPRT  SAP053X.   WORLSJOB  SAP028X.   SAFETY    SAP058X.
      SAFCLIMT  SAP053X.   HARASSED  SAP028X.   HARASFRQ  SAP061X.
      EXERTION  SAP062X.   STAND     SAP062X.   TBSMKEXP  SAP064X.
      HLTHPROM  SAP028X.   HPROMPAR  SAP066X.

      /* ACN FORMAT ASSOCIATIONS */

      HYPEV     SAP028X.   HYPDIFV   SAP028X.   HYPYR1    SAP028X.
      HYPMDEV2  SAP028X.   HYPMED2   SAP028X.   CHLEV     SAP028X.
      CHLYR     SAP028X.   CHLMDEV2  SAP028X.   CHLMDNW2  SAP028X.
      CHDEV     SAP028X.   ANGEV     SAP028X.   MIEV      SAP028X.
      HRTEV     SAP028X.   STREV     SAP028X.   EPHEV     SAP028X.
      COPDEV    SAP028X.   ASPMEDEV  SAP028X.   ASPMEDAD  SAP028X.
      ASPMDMED  SAP028X.   ASPONOWN  SAP028X.   AASMEV    SAP028X.
      AASSTILL  SAP028X.   AASMYR    SAP028X.   AASERYR1  SAP028X.
      ULCEV     SAP028X.   ULCYR     SAP028X.   ULCCOLEV  SAP028X.
      CANEV     SAP028X.   CNKIND1   SAP095X.   CNKIND2   SAP095X.
      CNKIND3   SAP095X.   CNKIND4   SAP095X.   CNKIND5   SAP095X.
      CNKIND6   SAP095X.   CNKIND7   SAP095X.   CNKIND8   SAP095X.
      CNKIND9   SAP095X.   CNKIND10  SAP095X.   CNKIND11  SAP095X.
      CNKIND12  SAP095X.   CNKIND13  SAP095X.   CNKIND14  SAP095X.
      CNKIND15  SAP095X.   CNKIND16  SAP095X.   CNKIND17  SAP095X.
      CNKIND18  SAP095X.   CNKIND19  SAP095X.   CNKIND20  SAP095X.
      CNKIND21  SAP095X.   CNKIND22  SAP095X.   CNKIND23  SAP095X.
      CNKIND24  SAP095X.   CNKIND25  SAP095X.   CNKIND26  SAP095X.
      CNKIND27  SAP095X.   CNKIND28  SAP095X.   CNKIND29  SAP095X.
      CNKIND30  SAP095X.   CNKIND31  SAP095X.   CANAGE1   SAP126X.
      CANAGE2   SAP126X.   CANAGE3   SAP126X.   CANAGE4   SAP126X.
      CANAGE5   SAP126X.   CANAGE6   SAP126X.   CANAGE7   SAP126X.
      CANAGE8   SAP126X.   CANAGE9   SAP126X.   CANAGE10  SAP126X.
      CANAGE11  SAP126X.   CANAGE12  SAP126X.   CANAGE13  SAP126X.
      CANAGE14  SAP126X.   CANAGE15  SAP126X.   CANAGE16  SAP126X.
      CANAGE17  SAP126X.   CANAGE18  SAP126X.   CANAGE19  SAP126X.
      CANAGE20  SAP126X.   CANAGE21  SAP126X.   CANAGE22  SAP126X.
      CANAGE23  SAP126X.   CANAGE24  SAP126X.   CANAGE25  SAP126X.
      CANAGE26  SAP126X.   CANAGE27  SAP126X.   CANAGE28  SAP126X.
      CANAGE29  SAP126X.   CANAGE30  SAP126X.   DIBEV     SAP156X.
      DIBPRE1   SAP028X.   DIBAGE    SAP126X.   DIFAGE2   SAP159X.
      INSLN     SAP028X.   DIBPILL   SAP028X.   EPILEP1   SAP028X.
      EPILEP2   SAP028X.   EPILEP3   SAP164X.   EPILEP4   SAP028X.
      EPILEP5   SAP166X.   AHAYFYR   SAP028X.   SINYR     SAP028X.
      CBRCHYR   SAP028X.   KIDWKYR   SAP028X.   LIVYR     SAP028X.
      JNTSYMP   SAP028X.   JMTHP1    SAP095X.   JMTHP2    SAP095X.
      JMTHP3    SAP095X.   JMTHP4    SAP095X.   JMTHP5    SAP095X.
      JMTHP6    SAP095X.   JMTHP7    SAP095X.   JMTHP8    SAP095X.
      JMTHP9    SAP095X.   JMTHP10   SAP095X.   JMTHP11   SAP095X.
      JMTHP12   SAP095X.   JMTHP13   SAP095X.   JMTHP14   SAP095X.
      JMTHP15   SAP095X.   JMTHP16   SAP095X.   JMTHP17   SAP095X.
      JNTCHR    SAP028X.   JNTHP     SAP028X.   ARTH1     SAP028X.
      ARTHLMT   SAP028X.   CTSEVER   SAP028X.   CTSYR     SAP028X.
      CTSWKRL1  SAP028X.   CTSWKRL2  SAP028X.   PAINECK   SAP028X.
      PAINLB    SAP028X.   PAINLEG   SAP028X.   LBPFREQ   SAP201X.
      LBPSEV    SAP202X.   LBPWKREL  SAP028X.   LBPWKRL2  SAP028X.
      LBPWCCLM  SAP028X.   LBPWCBEN  SAP028X.   LBPWKDAY  SAP207X.
      LBPCHJOB  SAP028X.   PAINFACE  SAP028X.   AMIGR     SAP028X.
      ACOLD2W   SAP028X.   AINTIL2W  SAP028X.   PREGNOW   SAP028X.
      PREGFLYR  SAP028X.   HRAIDNOW  SAP028X.   HRAIDEV   SAP028X.
      AHEARST1  SAP217X.   AVISION   SAP028X.   ABLIND    SAP028X.
      LUPPRT    SAP028X.

      /* AHS FORMAT ASSOCIATIONS */

      WKDAYR    SAP221X.   BEDDAYR   SAP221X.   AHSTATYR  SAP223X.
      SPECEQ    SAP028X.   FLWALK    SAP225X.   FLCLIMB   SAP225X.
      FLSTAND   SAP225X.   FLSIT     SAP225X.   FLSTOOP   SAP225X.
      FLREACH   SAP225X.   FLGRASP   SAP225X.   FLCARRY   SAP225X.
      FLPUSH    SAP225X.   FLSHOP    SAP225X.   FLSOCL    SAP225X.
      FLRELAX   SAP225X.   FLA1AR    SAP237X.   AFLHCA1   SAP095X.
      AFLHCA2   SAP095X.   AFLHCA3   SAP095X.   AFLHCA4   SAP095X.
      AFLHCA5   SAP095X.   AFLHCA6   SAP095X.   AFLHCA7   SAP095X.
      AFLHCA8   SAP095X.   AFLHCA9   SAP095X.   AFLHCA10  SAP095X.
      AFLHCA11  SAP095X.   AFLHCA12  SAP095X.   AFLHCA13  SAP095X.
      ALHCA14A  SAP095X.   AFLHCA15  SAP095X.   AFLHCA16  SAP095X.
      AFLHCA17  SAP095X.   AFLHCA18  SAP095X.   AFLHC19_  SAP095X.
      AFLHC20_  SAP095X.   AFLHC21_  SAP095X.   AFLHC22_  SAP095X.
      AFLHC23_  SAP095X.   AFLHC24_  SAP095X.   AFLHC25_  SAP095X.
      AFLHC26_  SAP095X.   AFLHC27_  SAP095X.   AFLHC28_  SAP095X.
      AFLHC29_  SAP095X.   AFLHC30_  SAP095X.   AFLHC31_  SAP095X.
      AFLHC32_  SAP095X.   AFLHC33_  SAP095X.   AFLHC34_  SAP095X.
      AFLHCA90  SAP095X.   AFLHCA91  SAP095X.   ALTIME1   SAP274X.
      ALUNIT1   SAP275X.   ALDURA1   SAP276X.   ALDURB1   SAP277X.
      ALCHRC1   SAP278X.   ALTIME2   SAP274X.   ALUNIT2   SAP275X.
      ALDURA2   SAP276X.   ALDURB2   SAP277X.   ALCHRC2   SAP278X.
      ALTIME3   SAP274X.   ALUNIT3   SAP275X.   ALDURA3   SAP276X.
      ALDURB3   SAP277X.   ALCHRC3   SAP278X.   ALTIME4   SAP274X.
      ALUNIT4   SAP275X.   ALDURA4   SAP276X.   ALDURB4   SAP277X.
      ALCHRC4   SAP278X.   ALTIME5   SAP274X.   ALUNIT5   SAP275X.
      ALDURA5   SAP276X.   ALDURB5   SAP277X.   ALCHRC5   SAP278X.
      ALTIME6   SAP274X.   ALUNIT6   SAP275X.   ALDURA6   SAP276X.
      ALDURB6   SAP277X.   ALCHRC6   SAP278X.   ALTIME7   SAP274X.
      ALUNIT7   SAP275X.   ALDURA7   SAP276X.   ALDURB7   SAP277X.
      ALCHRC7   SAP278X.   ALTIME8   SAP274X.   ALUNIT8   SAP275X.
      ALDURA8   SAP276X.   ALDURB8   SAP277X.   ALCHRC8   SAP278X.
      ALTIME9   SAP274X.   ALUNIT9   SAP275X.   ALDURA9   SAP276X.
      ALDURB9   SAP277X.   ALCHRC9   SAP278X.   ALTIME10  SAP274X.
      ALUNIT10  SAP275X.   ALDURA10  SAP276X.   ALDURB10  SAP277X.
      ALCHRC10  SAP278X.   ALTIME11  SAP274X.   ALUNIT11  SAP275X.
      ALDURA11  SAP276X.   ALDURB11  SAP277X.   ALCHRC11  SAP278X.
      ALTIME12  SAP274X.   ALUNIT12  SAP275X.   ALDURA12  SAP276X.
      ALDURB12  SAP277X.   ALCHRC12  SAP278X.   ALTIME13  SAP274X.
      ALUNIT13  SAP275X.   ALDURA13  SAP276X.   ALDURB13  SAP277X.
      ALCHRC13  SAP278X.   ATIME14A  SAP274X.   AUNIT14A  SAP275X.
      ADURA14A  SAP276X.   ADURB14A  SAP277X.   ACHRC14A  SAP278X.
      ALTIME15  SAP274X.   ALUNIT15  SAP275X.   ALDURA15  SAP276X.
      ALDURB15  SAP277X.   ALCHRC15  SAP278X.   ALTIME16  SAP274X.
      ALUNIT16  SAP275X.   ALDURA16  SAP276X.   ALDURB16  SAP277X.
      ALCHRC16  SAP278X.   ALTIME17  SAP274X.   ALUNIT17  SAP275X.
      ALDURA17  SAP276X.   ALDURB17  SAP277X.   ALCHRC17  SAP278X.
      ALTIME18  SAP274X.   ALUNIT18  SAP275X.   ALDURA18  SAP276X.
      ALDURB18  SAP277X.   ALCHRC18  SAP278X.   ALTIME19  SAP274X.
      ALUNIT19  SAP275X.   ALDURA19  SAP276X.   ALDURB19  SAP277X.
      ALCHRC19  SAP278X.   ALTIME20  SAP274X.   ALUNIT20  SAP275X.
      ALDURA20  SAP276X.   ALDURB20  SAP277X.   ALCHRC20  SAP278X.
      ALTIME21  SAP274X.   ALUNIT21  SAP275X.   ALDURA21  SAP276X.
      ALDURB21  SAP277X.   ALCHRC21  SAP278X.   ALTIME22  SAP274X.
      ALUNIT22  SAP275X.   ALDURA22  SAP276X.   ALDURB22  SAP277X.
      ALCHRC22  SAP278X.   ALTIME23  SAP274X.   ALUNIT23  SAP275X.
      ALDURA23  SAP276X.   ALDURB23  SAP277X.   ALCHRC23  SAP278X.
      ALTIME24  SAP274X.   ALUNIT24  SAP275X.   ALDURA24  SAP276X.
      ALDURB24  SAP277X.   ALCHRC24  SAP278X.   ALTIME25  SAP274X.
      ALUNIT25  SAP275X.   ALDURA25  SAP276X.   ALDURB25  SAP277X.
      ALCHRC25  SAP278X.   ALTIME26  SAP274X.   ALUNIT26  SAP275X.
      ALDURA26  SAP276X.   ALDURB26  SAP277X.   ALCHRC26  SAP278X.
      ALTIME27  SAP274X.   ALUNIT27  SAP275X.   ALDURA27  SAP276X.
      ALDURB27  SAP277X.   ALCHRC27  SAP278X.   ALTIME28  SAP274X.
      ALUNIT28  SAP275X.   ALDURA28  SAP276X.   ALDURB28  SAP277X.
      ALCHRC28  SAP278X.   ALTIME29  SAP274X.   ALUNIT29  SAP275X.
      ALDURA29  SAP276X.   ALDURB29  SAP277X.   ALCHRC29  SAP278X.
      ALTIME30  SAP274X.   ALUNIT30  SAP275X.   ALDURA30  SAP276X.
      ALDURB30  SAP277X.   ALCHRC30  SAP278X.   ALTIME31  SAP274X.
      ALUNIT31  SAP275X.   ALDURA31  SAP276X.   ALDURB31  SAP277X.
      ALCHRC31  SAP278X.   ALTIME32  SAP274X.   ALUNIT32  SAP275X.
      ALDURA32  SAP276X.   ALDURB32  SAP277X.   ALCHRC32  SAP278X.
      ALTIME33  SAP274X.   ALUNIT33  SAP275X.   ALDURA33  SAP276X.
      ALDURB33  SAP277X.   ALCHRC33  SAP278X.   ALTIME34  SAP274X.
      ALUNIT34  SAP275X.   ALDURA34  SAP276X.   ALDURB34  SAP277X.
      ALCHRC34  SAP278X.   ALTIME90  SAP274X.   ALUNIT90  SAP275X.
      ALDURA90  SAP276X.   ALDURB90  SAP277X.   ALCHRC90  SAP278X.
      ALTIME91  SAP274X.   ALUNIT91  SAP275X.   ALDURA91  SAP276X.
      ALDURB91  SAP277X.   ALCHRC91  SAP278X.   ALCNDRT   SAP454X.
      ALCHRONR  SAP455X.

      /* AHB FORMAT ASSOCIATIONS */

      SMKEV     SAP028X.   SMKREG    SAP457X.   SMKNOW    SAP458X.
      SMKSTAT2  SAP459X.   SMKQTNO   SAP460X.   SMKQTTP   SAP461X.
      SMKQTY    SAP462X.   CIGSDA1   SAP463X.   CIGDAMO   SAP464X.
      CIGSDA2   SAP463X.   CIGSDAY   SAP463X.   CIGQTYR   SAP028X.
      SMKANY    SAP028X.   SMKAGX_P  SAP207X.   SMKNOWX   SAP458X.
      SMKNOX_P  SAP471X.   SMKNOTPX  SAP461X.   CIGDAMOX  SAP207X.
      VIGNO     SAP474X.   VIGTP     SAP475X.   VIGFREQW  SAP476X.
      VIGLNGNO  SAP477X.   VIGLNGTP  SAP478X.   VIGMIN    SAP477X.
      MODNO     SAP474X.   MODTP     SAP475X.   MODFREQW  SAP482X.
      MODLNGNO  SAP477X.   MODLNGTP  SAP478X.   MODMIN    SAP477X.
      STRNGNO   SAP474X.   STRNGTP   SAP475X.   STRFREQW  SAP488X.
      ALC1YR    SAP028X.   ALCLIFE   SAP028X.   ALC12MNO  SAP491X.
      ALC12MTP  SAP492X.   ALC12MWK  SAP493X.   ALC12MYR  SAP494X.
      ALCAMT    SAP495X.   ALCSTAT   SAP496X.   ALC5UPN1  SAP494X.
      ALC5UPT1  SAP498X.   ALC5UPY1  SAP494X.   BINGE1    SAP207X.
      AHEIGHT   SAP501X.   AWEIGHTP  SAP502X.   BMI       SAP503X.

      /* AAU FORMAT ASSOCIATIONS */

      AUSUALPL  SAP504X.   APLKIND   SAP505X.   AHCPLROU  SAP028X.
      AHCPLKND  SAP507X.   AHCCHGYR  SAP028X.   AHCCHGHI  SAP028X.
      APRVTRYR  SAP028X.   APRVTRFD  SAP511X.   ADRNANP   SAP511X.
      ADRNAI    SAP511X.   AHCDLYR1  SAP028X.   AHCDLYR2  SAP028X.
      AHCDLYR3  SAP028X.   AHCDLYR4  SAP028X.   AHCDLYR5  SAP028X.
      AHCAFYR1  SAP028X.   AHCAFYR2  SAP028X.   AHCAFYR3  SAP028X.
      AHCAFYR4  SAP028X.   AHCAFYR5  SAP511X.   AHCAFYR6  SAP511X.
      AWORPAY   SAP525X.   AHICOMP   SAP223X.   ARX12MO   SAP028X.
      ARX12_1   SAP028X.   ARX12_2   SAP511X.   ARX12_3   SAP028X.
      ARX12_4   SAP028X.   ARX12_5   SAP028X.   ARX12_6   SAP028X.
      ADNLONG2  SAP534X.   AHCSYR1   SAP028X.   AHCSYR2   SAP028X.
      AHCSYR3   SAP028X.   AHCSYR4   SAP028X.   AHCSYR5   SAP028X.
      AHCSYR6   SAP028X.   AHCSYR7   SAP028X.   AHCSYR8   SAP028X.
      AHCSYR9   SAP028X.   AHCSYR10  SAP028X.   AHERNOY2  SAP545X.
      AERVISND  SAP028X.   AERHOS    SAP028X.   AERREA1R  SAP028X.
      AERREA2R  SAP028X.   AERREA3R  SAP028X.   AERREA4R  SAP028X.
      AERREA5R  SAP028X.   AERREA6R  SAP028X.   AERREA7R  SAP511X.
      AERREA8R  SAP511X.   AHCHYR    SAP028X.   AHCHMOYR  SAP207X.
      AHCHNOY2  SAP558X.   AHCNOYR2  SAP545X.   ASRGYR    SAP028X.
      ASRGNOYR  SAP561X.   AMDLONGR  SAP534X.   HIT1A     SAP511X.
      HIT2A     SAP028X.   HIT3A     SAP028X.   HIT4A     SAP511X.
      HIT5A     SAP511X.   SHTFLU2   SAP028X.   ASHFLUM2  SAP569X.
      ASHFLUY2  SAP570X.   FLUSHPG1  SAP571X.   FLUSHPG2  SAP572X.
      SPRFLU2   SAP028X.   ASPFLUM2  SAP569X.   ASPFLUY2  SAP570X.
      SHTPNUYR  SAP028X.   APOX      SAP028X.   APOX12MO  SAP028X.
      AHEP      SAP028X.   AHEPLIV   SAP028X.   AHEPBTST  SAP511X.
      SHTHEPB   SAP028X.   SHEPDOS   SAP583X.   SHTHEPA   SAP028X.
      SHEPANUM  SAP585X.   AHEPCTST  SAP511X.   AHEPCRES  SAP587X.
      SHINGLES  SAP028X.   SHTTD     SAP028X.   SHTTD05   SAP028X.
      SHTTDAP2  SAP591X.   SHTHPV2   SAP592X.   SHHPVDOS  SAP593X.
      AHPVAGE   SAP477X.   LIVEV     SAP028X.   TRAVEL    SAP028X.
      WRKHLTH2  SAP028X.   WRKDIR    SAP028X.   APSBPCHK  SAP028X.
      APSCHCHK  SAP028X.   APSBSCHK  SAP028X.   APSPAP    SAP028X.
      APSMAM    SAP028X.   APSCOL    SAP511X.   APSDIET   SAP028X.
      APSSMKC   SAP511X.   AINDINS2  SAP511X.   AINDPRCH  SAP511X.
      AINDWHO   SAP609X.   AINDDIF1  SAP610X.   AINDDIF2  SAP611X.
      AEXCHNG   SAP028X.

      /* ASI FORMAT ASSOCIATIONS */

      ASICPUSE  SAP613X.   ASISATHC  SAP614X.   ASITENUR  SAP615X.
      ASINHELP  SAP616X.   ASINCNTO  SAP616X.   ASINTRU   SAP616X.
      ASINKNT   SAP616X.   ASISIM    SAP620X.   ASISIF    SAP621X.
      ASIRETR   SAP622X.   ASIMEDC   SAP622X.   ASISTLV   SAP622X.
      ASICNHC   SAP622X.   ASICCOLL  SAP626X.   ASINBILL  SAP622X.
      ASIHCST   SAP622X.   ASICCMP   SAP629X.   ASISLEEP  SAP207X.
      ASISLPFL  SAP631X.   ASISLPST  SAP632X.   ASISLPMD  SAP633X.
      ASIREST   SAP634X.   ASISAD    SAP635X.   ASINERV   SAP635X.
      ASIRSTLS  SAP635X.   ASIHOPLS  SAP635X.   ASIEFFRT  SAP635X.
      ASIWTHLS  SAP635X.   ASIMUCH   SAP641X.   ASIHIVT   SAP028X.
      ASIHIVWN  SAP643X.

      /* AWB FORMAT ASSOCIATIONS */

      AWEBUSE   SAP028X.   AWEBOFNO  SAP477X.   AWEBOFTP  SAP646X.
      AWEBORP   SAP028X.   AWEBEML   SAP028X.   AWEBMNO   SAP477X.
      AWEBMTP   SAP646X.;
RUN;

PROC CONTENTS DATA=NHIS.SAMADULT;
   TITLE1 'CONTENTS OF THE 2015 NHIS Sample Adult FILE';

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2015 NHIS Sample Adult FILE';
   TITLE2 '(WEIGHTED)';
   WEIGHT WTFA_SA;

PROC FREQ DATA=NHIS.SAMADULT NOTITLE;
   TABLES RECTYPE/LIST MISSING;
   TITLE1 'FREQUENCY REPORT FOR 2015 NHIS Sample Adult FILE';
   TITLE2 '(UNWEIGHTED)';

* USER NOTE: TO SEE UNFORMATTED VALUES IN PROCEDURES, ADD THE
             STATEMENT: FORMAT _ALL_;
RUN;
