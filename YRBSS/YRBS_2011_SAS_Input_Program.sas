
/****************************************************************************************/
/*  This SAS program reads ASCII format (text format) 2011 YRBS data and creates a      */
/*  formatted and labeled SAS dataset.                                                  */
/*                                                                                      */
/*  Change the file location specifications from "c:\yrbs2011" to the location where 	*/
/*  you have stored the YRBS ASCII data file and the format library before you run this */
/*  program.  Change the location specification in three places - in the "filename"     */
/*  statement and in the two "libname" statements at the top of the program.            */
/*                                                                                      */
/*  Note: Run "YRBS_2011_SAS_Format_Program.sas" BEFORE you run                         */
/*  "YRBS_2011_SAS_Input_Program.sas" to create the 2011 YRBS dataset.                  */
/****************************************************************************************/

filename datain 'c:\yrbs2011\yrbs2011.dat';

libname dataout 'c:\yrbs2011';

libname library 'c:\yrbs2011';

data dataout.yrbs2011 ;
infile datain lrecl=400;
input
Q1 $ 17-17
Q2 $ 18-18
Q3 $ 19-19
Q4 $ 20-20
Q5 $ 21-28
@29 Q6 4.2
@33 Q7 6.2
Q8 $ 39-39
Q9 $ 40-40
Q10 $ 41-41
Q11 $ 42-42
Q12 $ 43-43
Q13 $ 44-44
Q14 $ 45-45
Q15 $ 46-46
Q16 $ 47-47
Q17 $ 48-48
Q18 $ 49-49
Q19 $ 50-50
Q20 $ 51-51
Q21 $ 52-52
Q22 $ 53-53
Q23 $ 54-54
Q24 $ 55-55
Q25 $ 56-56
Q26 $ 57-57
Q27 $ 58-58
Q28 $ 59-59
Q29 $ 60-60
Q30 $ 61-61
Q31 $ 62-62
Q32 $ 63-63
Q33 $ 64-64
Q34 $ 65-65
Q35 $ 66-66
Q36 $ 67-67
Q37 $ 68-68
Q38 $ 69-69
Q39 $ 70-70
Q40 $ 71-71
Q41 $ 72-72
Q42 $ 73-73
Q43 $ 74-74
Q44 $ 75-75
Q45 $ 76-76
Q46 $ 77-77
Q47 $ 78-78
Q48 $ 79-79
Q49 $ 80-80
Q50 $ 81-81
Q51 $ 82-82
Q52 $ 83-83
Q53 $ 84-84
Q54 $ 85-85
Q55 $ 86-86
Q56 $ 87-87
Q57 $ 88-88
Q58 $ 89-89
Q59 $ 90-90
Q60 $ 91-91
Q61 $ 92-92
Q62 $ 93-93
Q63 $ 94-94
Q64 $ 95-95
Q65 $ 96-96
Q66 $ 97-97
Q67 $ 98-98
Q68 $ 99-99
Q69 $ 100-100
Q70 $ 101-101
Q71 $ 102-102
Q72 $ 103-103
Q73 $ 104-104
Q74 $ 105-105
Q75 $ 106-106
Q76 $ 107-107
Q77 $ 108-108
Q78 $ 109-109
Q79 $ 110-110
Q80 $ 111-111
Q81 $ 112-112
Q82 $ 113-113
Q83 $ 114-114
Q84 $ 115-115
Q85 $ 116-116
Q86 $ 117-117
Q87 $ 118-118
Q88 $ 119-119
Q89 $ 120-120
Q90 $ 121-121
Q91 $ 122-122
Q92 $ 123-123
Q93 $ 124-124
Q94 $ 125-125
Q95 $ 126-126
Q96 $ 127-127
Q97 $ 128-128
QN8 185-185
QN9 186-186
QN10 187-187
QN11 188-188
QN12 189-189
QN13 190-190
QN14 191-191
QN15 192-192
QN16 193-193
QN17 194-194
QN18 195-195
QN19 196-196
QN20 197-197
QN21 198-198
QN22 199-199
QN23 200-200
QN24 201-201
QN25 202-202
QN26 203-203
QN27 204-204
QN28 205-205
QN29 206-206
QN30 207-207
QN31 208-208
QN32 209-209
QN33 210-210
QN34 211-211
QN35 212-212
QN36 213-213
QN37 214-214
QN38 215-215
QN39 216-216
QN40 217-217
QN41 218-218
QN42 219-219
QN43 220-220
QN44 221-221
QN45 222-222
QN46 223-223
QN47 224-224
QN48 225-225
QN49 226-226
QN50 227-227
QN51 228-228
QN52 229-229
QN53 230-230
QN54 231-231
QN55 232-232
QN56 233-233
QN57 234-234
QN58 235-235
QN59 236-236
QN60 237-237
QN61 238-238
QN62 239-239
QN63 240-240
QN64 241-241
QN65 242-242
QN66 243-243
QN67 244-244
QN68 245-245
QN69 246-246
QN70 247-247
QN71 248-248
QN72 249-249
QN73 250-250
QN74 251-251
QN75 252-252
QN76 253-253
QN77 254-254
QN78 255-255
QN79 256-256
QN80 257-257
QN81 258-258
QN82 259-259
QN83 260-260
QN84 261-261
QN85 262-262
QN86 263-263
QN87 264-264
QN88 265-265
QN89 266-266
QN90 267-267
QN91 268-268
QN92 269-269
QN93 270-270
QN94 271-271
QN95 272-272
QN96 273-273
QN97 274-274
QNFRCIG 350-350
QNANYTOB 351-351
QNDEPO 352-352
QNDEPOPL 353-353
QNDUAL 354-354
QNFRVG 355-355
QNFRVG2 356-356
QNFRUIT 357-357
QNVEG 358-358
QNDLYPE 359-359
QNPA0DAY 360-360
QNPA7DAY 361-361
QNOWT 362-362
QNOBESE 363-363
@364 WEIGHT 10.4
@374 STRATUM 3.0
@377 PSU 6.0
BMIPCT 383-387
RACEETH $ 388-389
;

************************************
*  Assign formats to SAS variables.*
************************************;
format 
Q1 $H1S. Q2 $H2S. Q3 $H3S. Q4 $H4S. Q5 $char8. 
Q6 4.2 Q7 6.2 Q8 $H8S. Q9 $H9S. Q10 $H10S. 
Q11 $H11S. Q12 $H12S. Q13 $H13S. Q14 $H14S. Q15 $H15S. 
Q16 $H16S. Q17 $H17S. Q18 $H18S. Q19 $H19S. Q20 $H20S. 
Q21 $H21S. Q22 $H22S. Q23 $H23S. Q24 $H24S. Q25 $H25S. 
Q26 $H26S. Q27 $H27S. Q28 $H28S. Q29 $H29S. Q30 $H30S. 
Q31 $H31S. Q32 $H32S. Q33 $H33S. Q34 $H34S. Q35 $H35S. 
Q36 $H36S. Q37 $H37S. Q38 $H38S. Q39 $H39S. Q40 $H40S. 
Q41 $H41S. Q42 $H42S. Q43 $H43S. Q44 $H44S. Q45 $H45S. 
Q46 $H46S. Q47 $H47S. Q48 $H48S. Q49 $H49S. Q50 $H50S. 
Q51 $H51S. Q52 $H52S. Q53 $H53S. Q54 $H54S. Q55 $H55S. 
Q56 $H56S. Q57 $H57S. Q58 $H58S. Q59 $H59S. Q60 $H60S. 
Q61 $H61S. Q62 $H62S. Q63 $H63S. Q64 $H64S. Q65 $H65S. 
Q66 $H66S. Q67 $H67S. Q68 $H68S. Q69 $H69S. Q70 $H70S. 
Q71 $H71S. Q72 $H72S. Q73 $H73S. Q74 $H74S. Q75 $H75S. 
Q76 $H76S. Q77 $H77S. Q78 $H78S. Q79 $H79S. Q80 $H80S. 
Q81 $H81S. Q82 $H82S. Q83 $H83S. Q84 $H84S. Q85 $H85S. 
Q86 $H86S. Q87 $H87XX. Q88 $H88XX. Q89 $H89XX. Q90 $H90XX. 
Q91 $H91XX. Q92 $H92XX. Q93 $H93XX. Q94 $H94XX. Q95 $H95XX. 
Q96 $H96XX. Q97 $H97XX. raceeth $Hrce.;

***********************************
*  Assign labels to SAS variables.*
***********************************;
label 
Q1="How old are you"
Q2="What is your sex"
Q3="In what grade are you"
Q4="Are you Hispanic/Latino"
Q5="What is your race"
Q6="How tall are you"
Q7="How much do you weigh"
Q8="How often wear bicycle helmet"
Q9="How often wore  a seat belt"
Q10="How often ride w/drinking driver 30 days"
Q11="How often drive while drinking 30 days"
Q12="Carried weapon 30 days"
Q13="Carried gun 30 days"
Q14="Carried weapon at school 30 days"
Q15="How many days feel unsafe@school 30 days"
Q16="How  many times threatened@school 12 mos"
Q17="How many times in fight 12 mos"
Q18="How many times injured in fight 12 mos"
Q19="How many times in fight @ school  12 mos"
Q20="Did  boyfriend/girlfriend hit/slap 12 mo"
Q21="Have you been forced to have sex"
Q22="Have you been bullied @ school past 12 mos"
Q23="Ever been electronically bullied 12 mos"
Q24="Ever feel sad or hopeless 12 mos"
Q25="Ever considered suicide 12 mos"
Q26="Ever make suicide plan 12 mos"
Q27="How many times attempt suicide 12 mos"
Q28="Ever injured from suicide attempt 12 mos"
Q29="Ever smoked"
Q30="How old when first smoked"
Q31="How many days smoked 30 days"
Q32="How many cigarettes/day 30 days"
Q33="How did you get cigarettes past 30 days"
Q34="How many days smoke @ school 30 days"
Q35="Have you ever smoked daily"
Q36="Tried to quit smoking past 12 months"
Q37="How many days use snuff past 30 days"
Q38="Days use snuff school property 30 days"
Q39="How many days smoke cigars 30 days"
Q40="How many days drink alcohol"
Q41="How old when first drank alcohol"
Q42="How many days drink alcohol 30 days"
Q43="How many days have 5+ drinks 30 days"
Q44="How did you get alcohol past 30 days"
Q45="How many days drink @ school 30 days"
Q46="How many times smoke marijuana"
Q47="How old when first tried marijuana"
Q48="How many times use marijuana 30 days"
Q49="How many times marijuana@school 30 days"
Q50="How many times use cocaine"
Q51="How many times use cocaine 30 days"
Q52="How many times sniffed glue"
Q53="How many times used heroin"
Q54="How many times used methamphetamines"
Q55="Ecstasy one or more time"
Q56="How many times used steroids"
Q57="Times prescription drug wo prescription"
Q58="How many times injected drugs"
Q59="Offered drugs @ school 12 mos"
Q60="Ever had sex"
Q61="How old at first sex"
Q62="How many sex partners"
Q63="How many sex partners 3 mos"
Q64="Did you use alcohol/drugs @ last sex"
Q65="Did you use condom @ last sex"
Q66="What birth control @ last sex"
Q67="How do you describe your weight"
Q68="What are you trying to do about weight"
Q69="Did you fast to lose weight 30 days"
Q70="Did you take pill to lose weight 30 days"
Q71="Did you vomit to lose weight 30 days"
Q72="How many times fruit juice 7 days"
Q73="How many times fruit 7 days"
Q74="How many time green salad 7 days"
Q75="How many times potatoes 7 days"
Q76="How many times carrots 7 days"
Q77="How many times other vegetables 7 days"
Q78="How many times drink soda past 7 days"
Q79="Days active 60 min plus past 7 days"
Q80="How many hours watch TV"
Q81="How many hours/day play video games"
Q82="How many days go to PE class"
Q83="On how many sports team 12 mos"
Q84="Ever taught about AIDS/HIV @ school"
Q85="Ever been told you have asthma"
Q86="Do you still have asthma"
Q87="Did you text or e-mail while driving"
Q88="Times property stolen at school 12 mos"
Q89="Ever used LSD"
Q90="How many glass of milk 7 days"
Q91="How often ate breakfast past 7 days"
Q92="Did you do toning exercise 7 days"
Q93="Ever tested for HIV"
Q94="Sunscreen use outside"
Q95="How many times indoor tanning"
Q96="Hours of sleep on school night"
Q97="Talk to teacher @ school about problem"
QN8="Never/rarely wore bicycle helmet"
QN9="Never/rarely wore seat belt"
QN10="Rode 1+ times with drinking driver"
QN11="Drove 1+ times when drinking"
QN12="Carried weapon 1+ times past 30 days"
QN13="Carried gun 1+ past 30 days"
QN14="Carried weapon school 1+ past 30 days"
QN15="Missed school b/c unsafe 1+ 30 days"
QN16="Threatened at school 1+ times 12 mos"
QN17="Fought 1+ times 12 mos"
QN18="Injured/treated 1+ times 12 mos"
QN19="Fought school 1+ times 12 mos"
QN20="Hit by bf/gf 12 mos"
QN21="Forced to have sex"
QN22="Bullied at school 12 mos"
QN23="Electronically bullied 12 mos"
QN24="Sad 2 wks past 12 mos"
QN25="Considered suicide 12 mos"
QN26="Made suicide plan 12 mos"
QN27="Attempted suicide 1+ times 12 mos"
QN28="Suicide attempt w/injury 12 mos"
QN29="Ever tried cigarettes"
QN30="Smoked cigarette before 13"
QN31="Smoked 1+ past 30 days"
QN32="Smoked >10 cigarettes/day past 30 days"
QN33="Got cigarettes in store 30 days"
QN34="Smoked at school 1+ past 30 days"
QN35="Smoked daily for 30 days"
QN36="Among smokers, tried to quit smoking"
QN37="Used snuff/dip 1+ past 30 days"
QN38="Used snuff/dip at school 1+ 30 days"
QN39="Smoked cigars 1+ past 30 days"
QN40="Had 1 drink on 1+ days in life"
QN41="Had first drink before 13"
QN42="Had 1+ drinks past 30 days"
QN43="Five+ drinks 1+ past 30 days"
QN44="Someone gave alcohol to me past 30 days"
QN45="Had 1+ drinks at school 1+ 30 days"
QN46="Tried marijuana 1+ times in life"
QN47="Tried marijuana before 13"
QN48="Used marijuana 1+ times past 30 days"
QN49="Used marijuana school 1+ times 30 day"
QN50="Used cocaine 1+ times in life"
QN51="Used cocaine 1+ times past 30 days"
QN52="Sniffed glue 1+ times in life"
QN53="Used heroin 1+ times in life"
QN54="Used meth 1+ times in life"
QN55="Used ecstasy 1+ times in life"
QN56="Took steroids 1+ times in life"
QN57="Taken prescription drug wo prescription"
QN58="Injected drugs 1+ times in life"
QN59="Offered/sold drugs at school 12 mos"
QN60="Had sex ever"
QN61="Had sex before 13"
QN62="Had sex with 4+ people in life"
QN63="Had sex with 1+ people 3 mos"
QN64="Of current sex, used alcohol last time"
QN65="Of current sex, used condom last time"
QN66="Of current sex, used birth ctrl last sex"
QN67="Slightly/very overweight"
QN68="Trying to lose weight"
QN69="Fasted to lose weight past 30 days"
QN70="Took pills to lose weight past 30 days"
QN71="Vomited to lose weight past 30 days"
QN72="Drank fruit juice past 7 days"
QN73="Ate fruit past 7 days"
QN74="Ate green salad past 7 days"
QN75="Ate potatoes past 7 days"
QN76="Ate carrots past 7 days"
QN77="Ate vegetables past 7 days"
QN78="Drank soda 1+ times/day past 7 days"
QN79="Active 60 min on 5+ past 7 days"
QN80="Watched 3+ hours of TV average day"
QN81="Played video games 3+ hours/day"
QN82="Attended PE class 1+ days average week"
QN83="Played on 1+ sports teams past 12 mos"
QN84="Taught about AIDS/HIV @ school"
QN85="Told by doctor/nurse they had asthma"
QN86="With current asthma"
QN87="Texted or e-mailed while driving"
QN88="Property stolen at school 1+ 12 mos"
QN89="Used LSD 1+ times"
QN90="Drank 3+ glasses milk/day past 7 days"
QN91="Ate breakfast on all of the past 7 days"
QN92="Strengthened muscles 3+ of past 7 days"
QN93="Tested for HIV"
QN94="Mostly or always wear sunscreen"
QN95="Used 1+ times indoor tanning"
QN96="Get 8+ hours sleep"
QN97="Talked to teacher @ school about problem"
qnfrcig="Smoked on 20 past 30 days"
qnanytob="Used any tobacco past 30 days"
qndepo="Used depo"
qndepopl="Used depo or pill"
qndual="Used condom and depo or pill"
qnfrvg="Ate 5+ fruits/vegetables/day 7 days"
qnfrvg2="Ate 2+ fruits/5+ veg/day 7 days"
qnfruit="Ate 2+ fruits 7 days"
qnveg="Ate 3+ vegetables 7 days"
qndlype="Attended PE class daily"
qnpa0day="Physically active 0 of past 7 days"
qnpa7day="Physically active 7 of past 7 days"
qnowt="Overweight"
qnobese="Obese"
weight="Analysis weight"
stratum="Stratum"
psu="PSU"
bmipct="Body Mass Index Percentage"
raceeth="Race/Ethnicity"
;
run;





