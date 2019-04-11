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
			principio:tPtrNodo;
			fin:tPtrNodo;
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
		pAux, nuevoNodo:tPtrNodo;

	BEGIN
		if EsVacia(c) then BEGIN
			uColas.CrearColaVacia(cAux);
			uColas.Insertar(e, cAux);
			new(c.fin);
			c.fin^.c:=cAux;
			c.fin^.p:=p;
			c.principio:=c.fin;
		END
		else begin
			if (c.principio = c.fin) then begin
				new(nuevoNodo);
				uColas.CrearColaVacia(nuevoNodo^.c);
				nuevoNodo^.p:=p;
				if(uPrioridad.EsMayor(p, c.fin^.p))then begin
					c.principio:=nuevoNodo;
					c.fin^.sig:=nuevoNodo;
					uColas.Insertar(e,nuevoNodo^.c);
				end
				else if (uPrioridad.MismaPrioridad(p, c.fin^.p))then begin
					uColas.Insertar(e,c.fin^.c);
				end
				else begin
					c.fin:=nuevoNodo;
					nuevoNodo^.sig:=c.principio;
					uColas.Insertar(e,nuevoNodo^.c);
				end;
			end
			else BEGIN
			{cuando tiene mas de dos elementos}
				pAux:=c.fin;
				new(nuevoNodo);
				uColas.CrearColaVacia(nuevoNodo^.c);
				nuevoNodo^.p:=p;
				while (pAux^.sig <> NIL) and ((uPrioridad.EsMayor(p, pAux^.sig^.p) or uPrioridad.MismaPrioridad(p, pAux^.sig^.p)))do
				{mientras que nuestra prioridad sea mayor que el siguiente, avanzamos}
					pAux:=pAux^.sig;
				if uPrioridad.EsMayor(p, pAux^.p) then begin
					uColas.Insertar(e, nuevoNodo^.c);
					c.principio^.sig:=nuevoNodo;
					c.principio:=nuevoNodo;
				end
				else if (MismaPrioridad(pAux^.p, p)) then
			   {una vez hemos llegado, si tienen la misma prioridad, insertamos en la cola}
					uColas.Insertar(e, pAux^.c)
				else begin
					uColas.Insertar(e, nuevoNodo^.c);
					nuevoNodo^.sig:=c.fin;
					c.fin:=nuevoNodo;
				end;
			end;
		END;
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
		while(pAux <> NIL) do begin
			writeln('Prioridad ', pAux^.p);
			uColas.ImprimirCola(pAux^.c);
			pAux:=pAux^.sig;
		end;
	end;
END.
