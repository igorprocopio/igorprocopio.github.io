
cd "D:\Econometria Espacial"


copy http://www.stata-press.com/data/r15/homicide_1960_1990.dta .
copy http://www.stata-press.com/data/r15/homicide_1960_1990_shp.dta .



use homicide_1960_1990

xtset _ID year
spset



spmatrix create contiguity Wc if year == 1990, replace normalize(row)




***********    Modelos Econométricos 

**** SAR
spxtregress hrate ln_population ln_pdensity gini i.year, re dvarlag(Wc)
estimates store re

spxtregress hrate ln_population ln_pdensity gini i.year, fe dvarlag(Wc)
estimates store fe

estimates table re fe

hausman fe re

estat impact


*** SEM 

spxtregress hrate ln_population ln_pdensity gini i.year, re  errorlag(Wc) 


spxtregress hrate ln_population ln_pdensity gini i.year, fe  errorlag(Wc) 


*** SAC

spxtregress hrate ln_population ln_pdensity gini i.year, re dvarlag(Wc)   errorlag(Wc)

spxtregress hrate ln_population ln_pdensity gini i.year, fe dvarlag(Wc)   errorlag(Wc)



*** SDM

spxtregress hrate ln_population ln_pdensity gini i.year,  re dvarlag(Wc) ivarlag(Wc: ln_population ln_pdensity gini)

spxtregress hrate ln_population ln_pdensity gini i.year,  fe dvarlag(Wc) ivarlag(Wc: ln_population ln_pdensity gini)


*** SDEM 

spxtregress hrate ln_population ln_pdensity gini i.year,  re ivarlag(Wc: ln_population ln_pdensity gini) errorlag(Wc)

spxtregress hrate ln_population ln_pdensity gini i.year,  fe ivarlag(Wc: ln_population ln_pdensity gini) errorlag(Wc)


*** SLX

spxtregress hrate ln_population ln_pdensity gini i.year,  re ivarlag(Wc: ln_population ln_pdensity gini)

spxtregress hrate ln_population ln_pdensity gini i.year,  fe ivarlag(Wc: ln_population ln_pdensity gini)


