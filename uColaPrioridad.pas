UNIT uColaPrioridad;
INTERFACE
	USES uCola, uElem;
	TYPE
		tNodo = RECORD
			c:tCola;
			sig:^tNodo;
			p:tPrioridad;
		END;

		tPtrNodo = ^tNodo;

		tColaPr = RECORD
			inicio:tPtrNodo;
			fin:tPtrNodo;
		END;

IMPLEMENTATION

	PROCEDURE CrearColaPrVacia(VAR c:tColaPr);
	BEGIN
		c.inicio:=NIL;
		c.fin:=NIL;
	END;

	PROCEDURE Insertar(e:tElem; VAR c:tColaPr);
	VAR
		cAux: tCola;
	BEGIN
		if EsVacia(c) then BEGIN
			uCola.CrearColaVacia(cAux);
			uCola.Insertar(e, cAux);
			new(c.fin);
			c.fin^.c:=cAux;
			c.principio:=c.fin;
		END
		else BEGIN
			
		END;
	END;
