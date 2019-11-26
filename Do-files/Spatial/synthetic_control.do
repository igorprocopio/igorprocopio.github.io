
cd "D:\Econometria Espacial"
***** Controle Sintético
 ssc install synth, replace all
 
 
 
 use synth_smoking, clear
 
 xtset state year
 
 
 
preserve
gen treated = state == 3
collapse (mean) cigsale, by(year treated)
twoway (line cigsale year if treated == 1) (line cigsale year if treated == 0), ///
	ytitle(per-capita cigarette sales (in packs)) xline(1989, lpattern(dash) ///
	lcolor(black)) xlabel(1970(5)2000) legend(order(1 "California" ///
	2 "rest of the U.S."))
 
restore
 
 
 
 
synth cigsale beer lnincome age15to24 cigsale(1988) cigsale(1980) cigsale(1975), ///
	trunit(3) trperiod(1989) xperiod(1980(1)1988) nested fig keep(synth.dta, replace)
	

*use synth, clear
	
*** Placebos

synth cigsale beer lnincome age15to24 cigsale(1988) cigsale(1980) cigsale(1975), ///
	trunit(1) trperiod(1989) xperiod(1980(1)1988) nested fig
	
	
synth cigsale beer lnincome age15to24 cigsale(1988) cigsale(1980) cigsale(1975), ///
	trunit(2) trperiod(1989) xperiod(1980(1)1988) nested fig
	
	
	
	
	
	
	
	
	
	
	
	
	