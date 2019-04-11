UNIT uConjuntos3;
INTERFACE
	USES uElem;
	TYPE
		tConjunto = ^tNodo;
		tNodo = RECORD
			e:tElem;
			enlace:tConjunto;
		END;
		{tb se puede poner tConjunto = tLista}


	PROCEDURE Poner(VAR c:tConjunto; e:tElem);
	var
		nuevoNodo:^tNodo;
	begin
		if not Pertenece(c,e) then
			new(nuevoNodo);
			Asignar(nuevoNodo^e, e);
			nuevoNodo^.enlace:=c;
			c:=nuevoNodo;
	end;
