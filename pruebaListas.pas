program pruebaListas;
uses uLista, uElem;
var
	l1, l2, l3: tLista;
	n1,n2,n3,n4,n5,n6:TElem;

BEGIN
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

	l3:=nil;
	{Concatenar(l1,l2, l3);}

	writeln(EsVacia(l3));

	writeln('Lista 1');
	ImprimirLista(l1);
	writeln();
	writeln('Lista 2');
	ImprimirLista(l2);
	writeln;
	writeln('Lista 3');
	ImprimirLista(l3);

	GetElemPos(l1, 2, n6);
	writeln(n6);
	readln;

END.
