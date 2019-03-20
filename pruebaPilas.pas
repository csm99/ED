program pruebaPilas;
uses uPila, uElem;
var
	l1, l2, l3: tPila;
	n1,n2,n3,n4,n5,n6:TElem;
	i:integer;
	aux:integer;

BEGIN

	n1:=10;
	n2:=6;
	n3:=8;
	n4:=4;
	n5:=2;
	CrearPilaVacia(l1);
	CrearPilaVacia(l2);

	Apilar(n1, l1);
	Apilar(n2, l1);
	Apilar(n3, l1);

	Apilar(n4, l2);
	Apilar(n5, l2);



	for i:=0 to 15 do
		Apilar(random(4500), l1);

	CrearPilaVacia(l3);

	{ Concatenar(l1,l2, l3); }

	{ Copiar(l1, l3); }

	writeln(EsVacia(l3));

	writeln('Lista 1');
	ImprimirPila(l1);
	writeln();
	writeln('Lista 2');
	ImprimirPila(l2);
	writeln;

	{BorrarElemento(4, l3); }

	writeln('Lista 3');
	ImprimirPila(l3);

	writeln;

	Destruir(l3);
	writeln('lista3');
	ImprimirPila(l3);

	aux:=Longitud(l1);
	writeln('Longitud L1: ', aux);

	readln;

	Desapilar(l2);
	ImprimirPila(l2);


END.
