clear all

cd "/Users/myMacBook/Desktop/Apec_Thesis_2017/Terry Hurley/Final results"

estimates use Year1995ModelResults062617

cmp

estimates store cmp1, title("1995")


estimates use Year2005ModelResults062617

cmp

estimates store cmp2, title("2005")

estimates use  FullModelResults062617

cmp

estimates store cmp3, title("Full")

lrtest  (cmp3) (cmp1 cmp2), stats



*esttab using p2.tex, label nostar replace booktabs title(Regression table\label{tab1}) 

*esttab cmp1 cmp2 using table1.tex, label nostar title(Regression table\label{tab1}) 

*esttab cmp1 cmp2 using exelprueba.csv

*esttab using example.tex, label replace booktabs alignment(D{.}{.}{-1}) title(Regression table\label{tab1})


* estout cmp1 cmp2 cmp3, cells(b(star fmt(3)) se(par fmt(2))) legend label varlabels(_cons Constant) stats(r2_p df_m bic, fmt(3 0 1) label(R-sqr dfres BIC))

* LikeHood ratio test






***  Factor Analysis for 1995 and 2005

clear all

cd "/Users/myMacBook/Desktop/Apec_Thesis_2017/Ultima_Correcion/CODE"

estimates use Year1995ModelResults062617

cmp

estimates store cmp1, title("1995")


matrix beta = e(b)'

scalar define rho_12   = (exp(2*beta[94,1]) - 1) / (exp(2*beta[94,1]) + 1)
scalar define rho_13   = (exp(2*beta[95,1]) - 1) / (exp(2*beta[95,1]) + 1)
scalar define rho_14   = (exp(2*beta[96,1]) - 1) / (exp(2*beta[96,1]) + 1)
scalar define rho_15   = (exp(2*beta[97,1]) - 1) / (exp(2*beta[97,1]) + 1)
scalar define rho_16   = (exp(2*beta[98,1]) - 1) / (exp(2*beta[98,1]) + 1)
scalar define rho_17   = (exp(2*beta[99,1]) - 1) / (exp(2*beta[99,1]) + 1)
scalar define rho_18   = (exp(2*beta[100,1]) - 1) / (exp(2*beta[100,1]) + 1)
scalar define rho_19   = (exp(2*beta[101,1]) - 1) / (exp(2*beta[101,1]) + 1)
scalar define rho_110   = (exp(2*beta[102,1]) - 1) / (exp(2*beta[102,1]) + 1)


scalar define rho_23   = (exp(2*beta[103,1]) - 1) / (exp(2*beta[103,1]) + 1)
scalar define rho_24   = (exp(2*beta[104,1]) - 1) / (exp(2*beta[104,1]) + 1)
scalar define rho_25   = (exp(2*beta[105,1]) - 1) / (exp(2*beta[105,1]) + 1)
scalar define rho_26   = (exp(2*beta[106,1]) - 1) / (exp(2*beta[106,1]) + 1)
scalar define rho_27   = (exp(2*beta[107,1]) - 1) / (exp(2*beta[107,1]) + 1)
scalar define rho_28   = (exp(2*beta[108,1]) - 1) / (exp(2*beta[108,1]) + 1)
scalar define rho_29   = (exp(2*beta[109,1]) - 1) / (exp(2*beta[109,1]) + 1)
scalar define rho_210   = (exp(2*beta[110,1]) - 1) / (exp(2*beta[110,1]) + 1)


scalar define rho_34   = (exp(2*beta[111,1]) - 1) / (exp(2*beta[111,1]) + 1)
scalar define rho_35   = (exp(2*beta[112,1]) - 1) / (exp(2*beta[112,1]) + 1)
scalar define rho_36   = (exp(2*beta[113,1]) - 1) / (exp(2*beta[113,1]) + 1)
scalar define rho_37   = (exp(2*beta[114,1]) - 1) / (exp(2*beta[114,1]) + 1)
scalar define rho_38   = (exp(2*beta[115,1]) - 1) / (exp(2*beta[115,1]) + 1)
scalar define rho_39   = (exp(2*beta[116,1]) - 1) / (exp(2*beta[116,1]) + 1)
scalar define rho_310   = (exp(2*beta[117,1]) - 1) / (exp(2*beta[117,1]) + 1)

scalar define rho_45   = (exp(2*beta[118,1]) - 1) / (exp(2*beta[118,1]) + 1)
scalar define rho_46   = (exp(2*beta[119,1]) - 1) / (exp(2*beta[119,1]) + 1)
scalar define rho_47   = (exp(2*beta[120,1]) - 1) / (exp(2*beta[120,1]) + 1)
scalar define rho_48   = (exp(2*beta[121,1]) - 1) / (exp(2*beta[121,1]) + 1)
scalar define rho_49   = (exp(2*beta[122,1]) - 1) / (exp(2*beta[122,1]) + 1)
scalar define rho_410   = (exp(2*beta[123,1]) - 1) / (exp(2*beta[123,1]) + 1)

scalar define rho_56   = (exp(2*beta[124,1]) - 1) / (exp(2*beta[124,1]) + 1)
scalar define rho_57   = (exp(2*beta[125,1]) - 1) / (exp(2*beta[125,1]) + 1)
scalar define rho_58   = (exp(2*beta[126,1]) - 1) / (exp(2*beta[126,1]) + 1)
scalar define rho_59   = (exp(2*beta[127,1]) - 1) / (exp(2*beta[127,1]) + 1)
scalar define rho_510   = (exp(2*beta[128,1]) - 1) / (exp(2*beta[128,1]) + 1)

scalar define rho_67   = (exp(2*beta[129,1]) - 1) / (exp(2*beta[129,1]) + 1)
scalar define rho_68   = (exp(2*beta[130,1]) - 1) / (exp(2*beta[130,1]) + 1)
scalar define rho_69   = (exp(2*beta[131,1]) - 1) / (exp(2*beta[131,1]) + 1)
scalar define rho_610   = (exp(2*beta[132,1]) - 1) / (exp(2*beta[132,1]) + 1)


scalar define rho_78   = (exp(2*beta[133,1]) - 1) / (exp(2*beta[133,1]) + 1)
scalar define rho_79   = (exp(2*beta[134,1]) - 1) / (exp(2*beta[134,1]) + 1)
scalar define rho_710   = (exp(2*beta[135,1]) - 1) / (exp(2*beta[135,1]) + 1)

scalar define rho_89   = (exp(2*beta[136,1]) - 1) / (exp(2*beta[136,1]) + 1)
scalar define rho_810   = (exp(2*beta[137,1]) - 1) / (exp(2*beta[137,1]) + 1)

scalar define rho_910   = (exp(2*beta[138,1]) - 1) / (exp(2*beta[138,1]) + 1)



matrix RHO = (  1.0,    rho_12,  rho_13, rho_14,  rho_15,  rho_16,  rho_17,   rho_18,  rho_19, rho_110 \ rho_12,  1.0,     rho_23, rho_24,  rho_25,  rho_26,  rho_27,   rho_28,  rho_29, rho_210 \ rho_13, rho_23,   1.0,    rho_34,  rho_35,  rho_36,  rho_37,   rho_38,  rho_39, rho_310 \ rho_14, rho_24,   rho_34,  1.0,    rho_45,  rho_46,  rho_47,   rho_48,  rho_49, rho_410 \ rho_15, rho_25,   rho_35,  rho_45,  1.0,    rho_56,  rho_57,   rho_58,  rho_59, rho_510 \ rho_16, rho_26,   rho_36,  rho_46,  rho_56,  1.0,    rho_67,   rho_68,  rho_69, rho_610 \ rho_17, rho_27,   rho_37,  rho_47,  rho_57,  rho_67, 1.0,      rho_78,  rho_79, rho_710 \ rho_18, rho_28,   rho_38,  rho_48,  rho_58,  rho_68, rho_78,    1.0,    rho_89, rho_810 \ rho_19, rho_29,   rho_39,  rho_49,  rho_59,  rho_69, rho_79,   rho_89,   1.0,   rho_910 \  rho_110, rho_210, rho_310, rho_410, rho_510, rho_610,rho_710,  rho_810, rho_910, 1.0 ) 
 

matrix list RHO

factormat RHO, n(3372) names(aitech ssftech pftech msptech ewtech pctech fmtech np_L ns_L emps) ml



screeplot, yline(1)

factormat RHO, n(3372) names(aitech ssftech pftech msptech ewtech pctech fmtech np_L ns_L emps) fac(2) ml


rotate, promax
rotate, promax blanks (.3)

* Correlation matrix of the promax(3) rotated common factors
estat common

rotate, clear 

loadingplot, xlab(0(.2)1) ylab(-.4(.2).6) aspect(1) yline(0) xline(0)






*******2005


clear all

cd "/Users/myMacBook/Desktop/Apec_Thesis_2017/Ultima_Correcion/CODE"


estimates use Year2005ModelResults062617

cmp

estimates store cmp2, title("1995")

matrix beta = e(b)'

scalar define rho_12   = (exp(2*beta[94,1]) - 1) / (exp(2*beta[94,1]) + 1)
scalar define rho_13   = (exp(2*beta[95,1]) - 1) / (exp(2*beta[95,1]) + 1)
scalar define rho_14   = (exp(2*beta[96,1]) - 1) / (exp(2*beta[96,1]) + 1)
scalar define rho_15   = (exp(2*beta[97,1]) - 1) / (exp(2*beta[97,1]) + 1)
scalar define rho_16   = (exp(2*beta[98,1]) - 1) / (exp(2*beta[98,1]) + 1)
scalar define rho_17   = (exp(2*beta[99,1]) - 1) / (exp(2*beta[99,1]) + 1)
scalar define rho_18   = (exp(2*beta[100,1]) - 1) / (exp(2*beta[100,1]) + 1)
scalar define rho_19   = (exp(2*beta[101,1]) - 1) / (exp(2*beta[101,1]) + 1)
scalar define rho_110   = (exp(2*beta[102,1]) - 1) / (exp(2*beta[102,1]) + 1)


scalar define rho_23   = (exp(2*beta[103,1]) - 1) / (exp(2*beta[103,1]) + 1)
scalar define rho_24   = (exp(2*beta[104,1]) - 1) / (exp(2*beta[104,1]) + 1)
scalar define rho_25   = (exp(2*beta[105,1]) - 1) / (exp(2*beta[105,1]) + 1)
scalar define rho_26   = (exp(2*beta[106,1]) - 1) / (exp(2*beta[106,1]) + 1)
scalar define rho_27   = (exp(2*beta[107,1]) - 1) / (exp(2*beta[107,1]) + 1)
scalar define rho_28   = (exp(2*beta[108,1]) - 1) / (exp(2*beta[108,1]) + 1)
scalar define rho_29   = (exp(2*beta[109,1]) - 1) / (exp(2*beta[109,1]) + 1)
scalar define rho_210   = (exp(2*beta[110,1]) - 1) / (exp(2*beta[110,1]) + 1)


scalar define rho_34   = (exp(2*beta[111,1]) - 1) / (exp(2*beta[111,1]) + 1)
scalar define rho_35   = (exp(2*beta[112,1]) - 1) / (exp(2*beta[112,1]) + 1)
scalar define rho_36   = (exp(2*beta[113,1]) - 1) / (exp(2*beta[113,1]) + 1)
scalar define rho_37   = (exp(2*beta[114,1]) - 1) / (exp(2*beta[114,1]) + 1)
scalar define rho_38   = (exp(2*beta[115,1]) - 1) / (exp(2*beta[115,1]) + 1)
scalar define rho_39   = (exp(2*beta[116,1]) - 1) / (exp(2*beta[116,1]) + 1)
scalar define rho_310   = (exp(2*beta[117,1]) - 1) / (exp(2*beta[117,1]) + 1)

scalar define rho_45   = (exp(2*beta[118,1]) - 1) / (exp(2*beta[118,1]) + 1)
scalar define rho_46   = (exp(2*beta[119,1]) - 1) / (exp(2*beta[119,1]) + 1)
scalar define rho_47   = (exp(2*beta[120,1]) - 1) / (exp(2*beta[120,1]) + 1)
scalar define rho_48   = (exp(2*beta[121,1]) - 1) / (exp(2*beta[121,1]) + 1)
scalar define rho_49   = (exp(2*beta[122,1]) - 1) / (exp(2*beta[122,1]) + 1)
scalar define rho_410   = (exp(2*beta[123,1]) - 1) / (exp(2*beta[123,1]) + 1)

scalar define rho_56   = (exp(2*beta[124,1]) - 1) / (exp(2*beta[124,1]) + 1)
scalar define rho_57   = (exp(2*beta[125,1]) - 1) / (exp(2*beta[125,1]) + 1)
scalar define rho_58   = (exp(2*beta[126,1]) - 1) / (exp(2*beta[126,1]) + 1)
scalar define rho_59   = (exp(2*beta[127,1]) - 1) / (exp(2*beta[127,1]) + 1)
scalar define rho_510   = (exp(2*beta[128,1]) - 1) / (exp(2*beta[128,1]) + 1)

scalar define rho_67   = (exp(2*beta[129,1]) - 1) / (exp(2*beta[129,1]) + 1)
scalar define rho_68   = (exp(2*beta[130,1]) - 1) / (exp(2*beta[130,1]) + 1)
scalar define rho_69   = (exp(2*beta[131,1]) - 1) / (exp(2*beta[131,1]) + 1)
scalar define rho_610   = (exp(2*beta[132,1]) - 1) / (exp(2*beta[132,1]) + 1)


scalar define rho_78   = (exp(2*beta[133,1]) - 1) / (exp(2*beta[133,1]) + 1)
scalar define rho_79   = (exp(2*beta[134,1]) - 1) / (exp(2*beta[134,1]) + 1)
scalar define rho_710   = (exp(2*beta[135,1]) - 1) / (exp(2*beta[135,1]) + 1)

scalar define rho_89   = (exp(2*beta[136,1]) - 1) / (exp(2*beta[136,1]) + 1)
scalar define rho_810   = (exp(2*beta[137,1]) - 1) / (exp(2*beta[137,1]) + 1)

scalar define rho_910   = (exp(2*beta[138,1]) - 1) / (exp(2*beta[138,1]) + 1)



matrix RHO1 = (  1.0,    rho_12,  rho_13, rho_14,  rho_15,  rho_16,  rho_17,   rho_18,  rho_19, rho_110 \ rho_12,  1.0,     rho_23, rho_24,  rho_25,  rho_26,  rho_27,   rho_28,  rho_29, rho_210 \ rho_13, rho_23,   1.0,    rho_34,  rho_35,  rho_36,  rho_37,   rho_38,  rho_39, rho_310 \ rho_14, rho_24,   rho_34,  1.0,    rho_45,  rho_46,  rho_47,   rho_48,  rho_49, rho_410 \ rho_15, rho_25,   rho_35,  rho_45,  1.0,    rho_56,  rho_57,   rho_58,  rho_59, rho_510 \ rho_16, rho_26,   rho_36,  rho_46,  rho_56,  1.0,    rho_67,   rho_68,  rho_69, rho_610 \ rho_17, rho_27,   rho_37,  rho_47,  rho_57,  rho_67, 1.0,      rho_78,  rho_79, rho_710 \ rho_18, rho_28,   rho_38,  rho_48,  rho_58,  rho_68, rho_78,    1.0,    rho_89, rho_810 \ rho_19, rho_29,   rho_39,  rho_49,  rho_59,  rho_69, rho_79,   rho_89,   1.0,   rho_910 \  rho_110, rho_210, rho_310, rho_410, rho_510, rho_610,rho_710,  rho_810, rho_910, 1.0 ) 
 


matrix list RHO1



factormat RHO1, n(695) names(aitech ssftech pftech msptech ewtech pctech fmtech np_L ns_L emps) ml
screeplot, yline(1)

factormat RHO1, n(695) names(aitech ssftech pftech msptech ewtech pctech fmtech np_L ns_L emps) fac(3) ml

rotate, promax
rotate, promax blanks (.1)

* Correlation matrix of the promax(3) rotated common factors
estat common

rotate, clear 

loadingplot, xlab(0(.2)1) ylab(-.4(.2).6) aspect(1) yline(0) xline(0)







