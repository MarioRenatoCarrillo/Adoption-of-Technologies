clear all

cd "/Users/myMacBook/Desktop/DATA"

use TechData042211.dta

set more off

drop if survyear == 2000 

mvdecode region gender ftemp usepc emphb jobdesc workplan evalproc, mv(-9=.)
mvdecode numpigs, mv(-9=. \-10=.)
mvdecode age, mv(-9=. \473=. \105=.)
mvdecode ed descop, mv(-9=. \-10=.\9=.)
mvdecode numsows, mv(-9=. \-10=. \9=.)
mvdecode ftemp, mv(0=.\1800=.)

gen Midwest=cond(region==1,1,0)
gen Northeast=cond(region==2,1,0)
gen South_East=cond(region==3,1,0)
gen West=cond(region==4,1,0)

gen highSchool=cond(ed==2|ed==3,1,0)
gen college=cond(ed==4|ed==5|ed==10,1,0)
gen bachelor=cond(ed==6,1,0)
gen graduate=cond(ed==7|ed==8|ed==11,1,0)

gen female=cond(gender==1,1,0)
gen male=cond(gender==0,1,0)

gen ewtech = cond(sewtech == 1 | mewtech == 1 | mmewtech == 1, 1, 0)  
gen fmtech = cond(emphb == 1 | jobdesc == 1 | workplan == 1  | evalproc == 1, 1, 0) 
gen pctech = cond(usepc == 1, 1, 0)  

gen emps = cond(ftemp>0 & ftemp != .,ftemp,0)


gen np_U = 0
gen np_L = 0

replace np_U =  1000 if (numpigs == 1 | numpigs == 2)  & survyear == 1995
replace np_L =  0   if (numpigs == 1 | numpigs == 2)  & survyear == 1995

replace np_U = 1000 if numpigs == 2 & survyear == 2005
replace np_L = 0    if numpigs == 2 & survyear == 2005

replace np_U = 2000 if numpigs == 3
replace np_L = 1000 if numpigs == 3

replace np_U = 3000 if numpigs == 4
replace np_L = 2000 if numpigs == 4

replace np_U = 5000 if numpigs == 5
replace np_L = 3000 if numpigs == 5

replace np_U = 10000 if numpigs == 6
replace np_L =  5000 if numpigs == 6

replace np_U = 15000 if numpigs == 7
replace np_L = 10000 if numpigs == 7

replace np_U = 25000 if numpigs == 8
replace np_L = 15000 if numpigs == 8

replace np_U = .     if numpigs == 9 & survyear == 1995
replace np_L = 25000 if numpigs == 9 & survyear == 1995

replace np_U = .     if (numpigs == 9 | numpigs == 10 | numpigs == 11)& survyear == 2005
replace np_L = 25000 if (numpigs == 9 | numpigs == 10 | numpigs == 11)& survyear == 2005

gen ns_U = 0
gen ns_L = 0

replace ns_U =  100  if (numsows == 1 | numsows == 2)  & survyear == 1995
replace ns_L =  0   if (numsows == 1 | numsows == 2)  & survyear == 1995

replace ns_U = 100  if numsows == 2 & survyear == 2005
replace ns_L = 0    if numsows == 2 & survyear == 2005

replace ns_U = 200 if numsows == 3
replace ns_L = 100 if numsows == 3

replace ns_U = 500 if numsows == 4
replace ns_L = 200 if numsows == 4

replace ns_U = 1000 if numsows == 5
replace ns_L = 500  if numsows == 5

replace ns_U = 2000 if numsows == 6
replace ns_L = 1000 if numsows == 6

replace ns_U = 5000 if numsows == 7
replace ns_L = 2000 if numsows == 7

replace ns_U =  .      if numsows == 8  & survyear == 1995
replace ns_L =  5000   if numsows == 8  & survyear == 1995

replace ns_U = .      if (numsows == 8 | numsows == 11) & survyear == 2005
replace ns_L = 5000   if (numsows == 8 | numsows == 11) & survyear == 2005


gen flag = 0
replace flag = 1 if Northeast != . & South_East != . & West != . & college != . & bachelor != . & graduate != . & age != . 
					
				
sum flag if survyear == 1995	
sum flag if survyear == 2005									

					
sum Northeast South_East West college bachelor graduate age emps np_U np_L ns_U ns_L
sum Northeast South_East West college bachelor graduate age emps np_U np_L ns_U ns_L if survyear == 1995
sum Northeast South_East West college bachelor graduate age emps np_U np_L ns_U ns_L if survyear == 2005
					
gen     yr2005 = 0
replace yr2005 = 1 if survyear ==2005

gen Northeast_d05  = 0
gen South_East_d05 = 0
gen West_d05       = 0
gen college_d05    = 0
gen bachelor_d05   = 0
gen graduate_d05   = 0
gen gender_d05     = 0
gen age_d05        = 0

replace Northeast_d05  = Northeast  if survyear == 2005
replace South_East_d05 = South_East if survyear == 2005
replace West_d05       = West       if survyear == 2005
replace college_d05    = college    if survyear == 2005
replace bachelor_d05   = bachelor   if survyear == 2005
replace graduate_d05   = graduate   if survyear == 2005
replace gender_d05     = gender     if survyear == 2005
replace age_d05        = age        if survyear == 2005

gen eqtech     = 4
gen eqop       = 5 
gen eqinterval = 7
gen eqemps     = 1

gen eqnp = 7
replace eqnp = 0 if np_U == 0 & np_L == 0

gen eqns = 7
replace eqns = 0 if ns_U == 0 & ns_L == 0


replace eqemps = 2 if emps == 0
replace eqemps = 3 if emps == 99 & survyear == 1995

****SUMMARY STATISTICS

 tab aitech ssftech pftech msptech ewtech pctech fmtech emps np_L np_U ns_L ns_U, by(survyear) stat(mean sd) nototal col(stat) long
 
sort survyear 
by survyear: tabm aitech ssftech pftech msptech ewtech pctech fmtech emps np_L np_U ns_L ns_U 
 
 
sort survyear 
by survyear: tab1 aitech ssftech pftech msptech ewtech pctech fmtech


estpost su aitech ssftech pftech msptech ewtech pctech fmtech if survyear==1995
est store year__95

estpost su aitech ssftech pftech msptech ewtech pctech fmtech if survyear==2005
est store year__05 

estout year__95 year__05, cells(mean (star fmt(2)) sd (star fmt(2)))


estpost su aitech ssftech pftech msptech ewtech pctech fmtech emps np_L np_U ns_L ns_U if survyear==1995
est store year__1995

estpost su aitech ssftech pftech msptech ewtech pctech fmtech emps np_L np_U ns_L ns_U if survyear==2005
est store year__2005 

estout year__1995 year__2005, cells(mean (star fmt(2)) sd (star fmt(2)))
