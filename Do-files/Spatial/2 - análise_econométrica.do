



cd "D:\Econometria Espacial\Dados"

use crime_espacial, clear


/*
Modelo SAR (com Wy no lado direito da regressão) por máxima verossimilhança e por MQ2E;
Modelo SEM (com Werro no lado direito) por MV e GMM;
Modelo SAC (com Wy e Werro no lado direito) por MV e MQ2E;
Modelo SDM (com Wy e WX) por MV e MQ2E;
Modelo SDEM (com WX e Werro) por MV e GMM.

*/


grmap thom12

grmap trouv12


spmatrix create contiguity Wc, replace normalize(row)
spmatrix create contiguity rook, replace normalize(row) rook


reg thom12
estat moran, errorlag(Wc)
estat moran, errorlag(rook)





reg trouv12
estat moran, errorlag(Wc)



reg thom12 tpol12 renda12 educ12 bfpc12 theil12
estat moran, errorlag(Wc)

********   Análise espacial




***********    Modelos Econométricos 

**** SAR

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , ml dvarlag(Wc) 

estimates store sar

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , gs2sls dvarlag(Wc) 



estat impact


*** SEM 

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , ml  errorlag(Wc)

estimates store sem

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , gs2sls  errorlag(Wc)


*** SAC

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12, ml dvarlag(Wc)   errorlag(Wc)

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12, gs2sls dvarlag(Wc)   errorlag(Wc)



*** SDM

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , ml dvarlag(Wc) ivarlag(Wc: tpol12 renda12 educ12 bfpc12 theil12)

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , gs2sls dvarlag(Wc) ivarlag(Wc: tpol12 renda12 educ12 bfpc12 theil12)


*** SDEM 

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , ml dvarlag(Wc) ivarlag(Wc: tpol12 renda12 educ12 bfpc12 theil12) errorlag(Wc)

spregress thom12 tpol12 renda12 educ12 bfpc12 theil12 , gs2sls dvarlag(Wc) ivarlag(Wc: tpol12 renda12 educ12 bfpc12 theil12) errorlag(Wc)





**************************************************************************************************************************************
**************************************************************************************************************************************


spivregress thom12  renda12 educ12 bfpc12 theil12 (tpol12 = tbomb12), dvarlag(Wc)

estimates store sariv

estimates table sar sariv




spivregress thom12  renda12 educ12 bfpc12 theil12 (tpol12 = tbomb12), dvarlag(Wc) errolag(Wc)

estimates store semiv

estimates table sem semiv





