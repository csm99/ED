program pruebaColas;
uses uColas, uElem;
var
	l1, l2, l3: tCola;
	n1,n2,n3,n4,n5,n6:TElem;
	i:integer;
	aux:integer;

BEGIN

	n1:='a';
	n2:='b';
	n3:='c';
	n4:='d';
	n5:='e';
	CrearColaVacia(l1);
	CrearColaVacia(l2);

	Insertar(n1, l1);
	Insertar(n2, l1);
	Insertar(n3, l1);

	Insertar(n4, l2);
	Insertar(n5, l2);

	CrearColaVacia(l3);

	writeln('Iguales: ', Iguales(l1, l3));

	writeln('Cola 1');
	ImprimirCola(l1);
	writeln();
	writeln('Cola 2');
	ImprimirCola(l2);
	writeln;


	writeln('Cola 3');
	ImprimirCola(l3);

	Primero(n6, l3);

	writeln(n6);


END.
