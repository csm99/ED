PROGRAM PruebaArboles;
USES uArbinBus, uElem, uLista;
VAR
	a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13, aux, arbol1, arbol2, arbol3:tArbinBus;
	e1,e2,e3,e4,e5,e6,e7:tElem;
	i,j:integer;
	l:tLista;
begin
	e1:=1;
	e2:=2;
	e3:=3;
	e4:=4;
	e5:=6;
	e6:=5;
	e7:=7;

	CrearArbolVacio(a1);
	CrearArbolVacio(a2);
	CrearArbolVacio(a3);
	CrearArbolVacio(aux);


{
	ConstruirArbolBin(aux, aux, e1, a1);
	ConstruirArbolBin(a1, a1, e2, a2);
	ConstruirArbolBin(a2, a2, e3, a3);
	ConstruirArbolBin(NIL, a3, e5, a3);



	ConstruirArbolBin(aux, aux, 1, a1);
	ConstruirArbolBin(aux, aux, 2, a2);
	ConstruirArbolBin(a1, a2, 3, a3);

	ConstruirArbolBin(aux, aux, 6, a4);
	ConstruirArbolBin(aux, aux, 7, a5);
	ConstruirArbolBin(a4, a5, 4, a6);

	ConstruirArbolBin(a3, a6, 5, arbol1);


	ConstruirArbolBin(aux, aux, 2, a7);
	ConstruirArbolBin(aux, a2, 3, a8);

	ConstruirArbolBin(aux, aux, 6, a9);
	ConstruirArbolBin(aux, aux, 7, a10);
	ConstruirArbolBin(a9, a10, 4, a11);

	ConstruirArbolBin(a11,a8, 9, a12);



	ConstruirArbolBin(a8, a12, 5, arbol2);

	ConstruirArbolBin(arbol2, aux, 10, arbol3);
}
	Insertar(4,a1);
	Insertar(2,a1);
	Insertar(3,a1);
	Insertar(1,a1);
	Insertar(6,a1);
	Insertar(5,a1);
	Insertar(7,a1);

	imprimir(a1);


	Preorden(a1, l);
	ImprimirLista(l);
end.
