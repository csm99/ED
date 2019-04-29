UNIT uColaPrioridad;
INTERFACE
	USES uColas, uElem, uPrioridad;
	TYPE
		tNodo = RECORD
			c:tCola;
			sig:^tNodo;
			p:tPrioridad;
		END;

		tPtrNodo = ^tNodo;

		tColaPr = RECORD
			principio, fin:tPtrNodo;
		END;



	PROCEDURE CrearColaPrVacia(VAR c:tColaPr);
	PROCEDURE Insertar(e:tElem; p:tPrioridad; VAR c:tColaPr);
	PROCEDURE PrimeroCola(VAR e:tElem; c:tColaPr);
	PROCEDURE Eliminar(VAR c:tColaPr);
	FUNCTION EsVacia(c:tColaPr):boolean;
	PROCEDURE ImprimirColaPr(c:tColaPr);

IMPLEMENTATION

	PROCEDURE CrearColaPrVacia(VAR c:tColaPr);
	BEGIN
		c.principio:=NIL;
		c.fin:=NIL;
	END;

	PROCEDURE Insertar(e:tElem; p:tPrioridad; VAR c:tColaPr);
	VAR
		cAux: tCola;
		pAux, pAnt, nuevoNodo:tPtrNodo;

	BEGIN
		if EsVacia(c) then BEGIN
			uColas.CrearColaVacia(cAux);
			uColas.Insertar(e, cAux);
			new(c.fin);
			c.fin^.sig:=NIL;
			c.fin^.c:=cAux;
			c.fin^.p:=p;
			c.principio:=c.fin;
		END
		else if EsMenor(p, c.fin^.p) then begin
			new(pAux);
			pAux^.p:=p;
			pAux^.sig:=c.fin;
			uColas.CrearColaVacia(pAux^.c);
			uColas.Insertar(e, pAux^.c);
			c.fin:=pAux;
		end
		else begin
			pAux:=c.fin;
			while (pAux^.sig <> NIL) and (not MismaPrioridad(p, pAux^.p)) and (EsMayor(p, pAux^.sig^.p) or MismaPrioridad(p, pAux^.sig^.p)) do
				pAux:=pAux^.sig;
			if MismaPrioridad(p, pAux^.p)then begin
				uColas.Insertar(e, pAux^.c);
			end
			else begin
				new(nuevoNodo);
				nuevoNodo^.sig:=pAux^.sig;
				pAux^.sig:=nuevoNodo;
				nuevoNodo^.p:=p;
				uColas.CrearColaVacia(nuevoNodo^.c);
				uColas.Insertar(e, nuevoNodo^.c);
			end;
		end;
	END;

	PROCEDURE PrimeroCola(VAR e:tElem; c:tColaPr);
	begin
		if not EsVacia(c)then
			Primero(e, c.principio^.c);
	end;

	PROCEDURE Eliminar(VAR c:tColaPr);
	begin
		if not EsVacia(c)then begin
			uColas.Eliminar(c.principio^.c);
		end;
	end;

	FUNCTION EsVacia(c:tColaPr):boolean;
	begin
		EsVacia:= (c.principio = NIL) and (c.fin = NIL);
	end;

	PROCEDURE ImprimirColaPr(c:tColaPr);
	VAR
		pAux:tPtrNodo;
	begin
		pAux:=c.fin;
		writeln('---- COLA PRIORIDAD ----');
		while(pAux <> NIL) do begin
			writeln(' >>>>>>>>>>>>>>>>>>>>>>>>>>> Prioridad ', pAux^.p);
			uColas.ImprimirCola(pAux^.c);
			pAux:=pAux^.sig;
		end;
	end;
END.
