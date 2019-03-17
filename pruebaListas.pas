program pruebaListas;
uses uListaOrdenada, uElem;
var
	l1, l2, l3: tListaOrd;
	n1,n2,n3,n4,n5,n6:TElem;
	i:integer;

BEGIN

{
	n1:='a';
	n2:='b';
	n3:='c';
	n4:='d';
	n5:='e';
	CrearListaVacia(l1);
	CrearListaVacia(l2);

	ConstruirLista(n1, l1);
	ConstruirLista(n2, l1);
	ConstruirLista(n3, l1);

	ConstruirLista(n4, l2);
	ConstruirLista(n5, l2);

	InsertarFinal('z', l1);

	CrearListaVacia(l3);
	Concatenar(l1,l2, l3);

	 Copiar(l1, l3);



	writeln(EsVacia(l3));

	writeln('Lista 1');
	ImprimirLista(l1);
	writeln();
	writeln('Lista 2');
	ImprimirLista(l2);
	writeln;

	BorrarElemento('', l3);

	writeln('Lista 3');
	ImprimirLista(l3);

	writeln;
	writeln('GetElem:');
	GetElemPos(l1, 2, n6);
	writeln(n6);

	Destruir(l3);
	writeln('lista3');
	ImprimirLista(l3);

	readln;   }



	n1:=10;
	n2:=6;
	n3:=8;
	n4:=4;
	n5:=2;
	CrearListaOrdVacia(l1);
	CrearListaOrdVacia(l2);

	ConstruirListaOrd(n1, l1);
	ConstruirListaOrd(n2, l1);
	ConstruirListaOrd(n3, l1);

	ConstruirListaOrd(n4, l2);
	ConstruirListaOrd(n5, l2);



	for i:=0 to 4500 do
		ConstruirListaOrd(random(4500), l1);

	CrearListaOrdVacia(l3);

	{ Concatenar(l1,l2, l3); }

	{ Copiar(l1, l3); }

	writeln(EsVacia(l3));

	writeln('Lista 1');
	ImprimirLista(l1);
	writeln();
	writeln('Lista 2');
	ImprimirLista(l2);
	writeln;

	{BorrarElemento(4, l3); }

	writeln('Lista 3');
	ImprimirLista(l3);

	writeln;
	writeln('GetElem:');
	GetElemPos(l1, 2, n6);
	writeln(n6);

	Destruir(l3);
	writeln('lista3');
	ImprimirLista(l3);

	readln;


END.
