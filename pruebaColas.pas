program pruebaColas;
uses uElem, uColaPrioridad, uPrioridad;
var
	l1, l2, l3: tColaPr;
	n1,n2,n3,n4,n5,n6:TElem;
	p1,p2,p3,p4,p5:tPrioridad;
	i:integer;
	aux:integer;

BEGIN

	n1:='a';
	n2:='b';
	n3:='c';
	n4:='d';
	n5:='e';


	CrearPrioridad(1,p1);
	CrearPrioridad(2,p2);
	CrearPrioridad(3,p3);
	CrearPrioridad(4,p4);
	CrearPrioridad(5,p5);



	CrearColaPrVacia(l1);

	Insertar(n1, p2, l1);
	Insertar(n2, p1, l1);
	Insertar(n3, p5, l1);
	Insertar(n4, p2, l1);



	writeln('Cola 1');
	ImprimirColaPr(l1);
	writeln();


END.
