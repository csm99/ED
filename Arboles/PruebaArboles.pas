PROGRAM PruebaArboles;
USES uArbolBinario, uElem;
VAR
	a1,a2,a3,aux:tArbin;
	e1,e2,e3,e4,e5,e6,e7:tElem;
begin
	e1:=1;
	e2:=2;
	e3:=3;
	e4:=4;
	e5:=5;
	e6:=6;
	e7:=7;

	CrearArbolVacio(a1);
	CrearArbolVacio(a2);
	CrearArbolVacio(aux);

	ConstruirArbolBin(aux, aux, e1, a1);
	ConstruirArbolBin(a1, a1, e2, a2);
	ConstruirArbolBin(a2, a2, e3, a3);
	ConstruirArbolBin(NIL, a3, e5, a3);

	imprimir(a3);


end.
