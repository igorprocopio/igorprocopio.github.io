


cd "D:\Econometria Espacial\Dados"


copy "ftp://geoftp.ibge.gov.br/organizacao_do_territorio/malhas_territoriais/malhas_municipais/municipio_2017/Brasil/BR/br_unidades_da_federacao.zip" .
unzipfile br_unidades_da_federacao.zip, replace


spshape2dta BRUFE250GC_SIR, saving(uf) replace

use uf, clear
spset

codebook CD_GEOCUF


import delimited "https://igorprocopio.github.io/Datasets/Spatial/Crime_2012.csv", clear

codebook cod_uf
drop if cod_uf == .




ren cod_uf CD_GEOCUF

tostring CD_GEOCUF, replace


merge 1:1 CD_GEOCUF using uf

drop _merge

spset



grmap


destring pol12 bomb12 renda12, ignore(",") replace

save crime_espacial, replace




