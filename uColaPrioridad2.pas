UNIT uColaPrioridad2;
INTERFACE
	USES uElem;
	TYPE
		tPtr = ^tNodo;
		tNodo = RECORD
			e:tElem;
			sig:tPtr;
			prioridad:tPrioridad;
		END;
		tPrioridad = integer;
		tColaPr = RECORD
			principio:tPtr;
			final:tPtr;
		END;

IMPLEMENTATION

	PROCEDURE CrearColaVacia(VAR c:tColaPr);
	begin
		c.principio:=NIL;
		c.final:=NIL;
	end;

	PROCEDURE Insertar(e:tElem; VAR c:tColaPr);
	var
		pNuevo:tPtr;
	begin
		if(EsVacia(c))then begin
			new(pNuevo);
			pNuevo^.e:=e;
			p
		end;

	end;
