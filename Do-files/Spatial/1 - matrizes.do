************************************************************************************************************
************************************************************************************************************


cd "D:\Econometria Espacial\Dados"



use crime_espacial, clear

**********			 1 - Marizes de Contiguidade			 ***************

**********   Rainha
spmatrix create contiguity Wc, replace

spmatrix summarize Wc

spmatrix summarize Wc, gen(neighbor)


grmap, label(label(neighbor) x(_CX) y(_CY))


spmatrix matafromsp W id = Wc
mata: W


** Normalização das matrizes
spmatrix create contiguity Wc, replace normalize(row)
spmatrix matafromsp W id = Wc
mata: W



spmatrix create contiguity Wc, replace normalize(none)
spmatrix matafromsp W id = Wc
mata: W

spmatrix normalize Wc, normalize(row)
spmatrix matafromsp W id = Wc
mata: W




****** Rook (Torre)

spmatrix create contiguity Wc, replace rook



****** Ordem superior

spmatrix create contiguity Wc, second() replace

spmatrix create contiguity Wc, first second() replace

** É possível definir o peso da contiguidade de segunda ordem 


spmatrix matafromsp W id = Wc
mata: W

spmatrix create contiguity Wc, first second(0.5) replace

*********************     2 - Distância geográfica       *************************


spmatrix create idistance Wi, replace
spmatrix matafromsp W id = Wi
mata: W

** Distância truncada

spmatrix create contiguity IO, vtruncate(.01)

***************************************************

spmat idistance mat2 _CX _CY, id(_ID) df(dhav, mi) knn(2) replace

spmat getmatrix mat2 W
mata: W

spmatrix matafromsp W id = W2
mata: W



********* 		3 - Distância geográfica e contiguidade      ********************



spmatrix create idistance Wi, normalize(none) replace
spmatrix create contiguity Wc, normalize(none) replace

spmatrix matafromsp I v = Wi
spmatrix matafromsp C v = Wc


mata: IC = I :* C


spmatrix spfrommata Wci = IC v // 

mata: mata drop IC I C

spmatrix matafromsp W id = Wci
mata: W




********************************************************************************

*** Salvando uma matriz

spmatrix save Wci using wci, replace


**Apagando uma matriz da memória do Stata
spmatrix drop Wci

***Listar matrizes armazenadas na memória
spmatrix dir

** Usar uma matriz salva no disco
spmatrix use Wci using wci
