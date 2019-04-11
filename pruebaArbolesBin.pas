PROGRAM pruebaArbolesBin;
USES uElem, uArbolBin;
VAR
	i,d,a:tArbolBin;
	e:tElem;
begin
	CrearArbolVacio(a);
	CrearArbolVacio(i);
	CrearArbolVacio(d);
	Crear(1,e);
	Construir(i,e,d,i);
	Crear(3,e);
	Construir(i,e,d,i);
	
end.
