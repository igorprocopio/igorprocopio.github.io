


cd "D:\Econometria Espacial\Georreferenciamento"


***** Plotar pontos no mapa

use bairros, clear

grmap if TIPO == "URBANO", point(data(jf_estb_2017_ceps.dta) x(lng) y(lat) size(vtiny) fcolor(red)) 




**********************************************************************************

***  Atribuir pontos a polígono


use jf_estb_2017_ceps, clear
drop _ID
geoinpoly lat lng using bairros_shp

gen n = 1
collapse (sum) n qtdvínculosativos, by(_ID)

merge 1:1 _ID using bairros

drop if _ID == .


grmap n

grmap qtdvínculosativos
