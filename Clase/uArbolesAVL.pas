UNIT uArbolesAVL;
INTERFACE

	tArbolEq = ^tNodo;
	tNodo = record
		r:tElem;
		izq, der:tArbolEq;
		factorEquilibrio:-1..1;
	end;


	// al rotar, el nombre de la rotacion lo llmamos segun en que lado
	// nos faltan nodos

	// no se va a preguntar codigo de estos arboles

	
