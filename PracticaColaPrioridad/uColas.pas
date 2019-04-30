UNIT uColas;
INTERFACE
	USES uElem;
	TYPE
		tPtr = ^tNodo;
		tNodo = RECORD
			e:tElem;
			sig:tPtr;
		END;
		tCola = RECORD
			principio:tPtr;
			final:tPtr;
		END;

	PROCEDURE CrearColaVacia(VAR c:tCola);
	PROCEDURE Insertar(e:tElem; VAR c:tCola);
	PROCEDURE Primero(VAR e:tElem; c:tCola);
	FUNCTION EsVacia(c:tCola):boolean;
	PROCEDURE Eliminar(VAR c:tCola);
	PROCEDURE Copiar(c:tCola; VAR copia:tCola);
	FUNCTION Iguales(c1, c2:tCola):boolean;
	PROCEDURE ImprimirCola(c:tCola);


IMPLEMENTATION

	PROCEDURE CrearColaVacia(VAR c:tCola);
	begin
		c.principio := NIL;
		c.final := NIL;
	end;

	PROCEDURE Insertar(e:tElem; VAR c:tCola);
	VAR
		p:tPtr;
	begin
		if(EsVacia(c))then begin
			new(p);
			uElem.Asignar(p^.e, e);
			p^.sig:=NIL;
			c.final:=p;
			c.principio:=p;
		end
		else begin
			new(p);
			uElem.Asignar(p^.e, e);
			p^.sig:=NIL;
			c.final^.sig:=p;
			c.final:=p;
		end;
	end;

	PROCEDURE Primero(VAR e:tElem; c:tCola);
	begin
		if(not EsVacia(c))then
			uElem.Asignar(e,c.principio^.e);
	end;

	FUNCTION EsVacia(c:tCola):boolean;
	begin
		EsVacia:= (c.principio = NIL) and (c.final = NIL);
	end;

	PROCEDURE Eliminar(VAR c:tCola);
	VAR
		pAux:tPtr;
	begin
		if not EsVacia(c)then begin
			pAux:=c.principio;
			c.principio:=c.principio^.sig;
			if(c.principio = NIL)then
				c.final:=NIL;
			Dispose(pAux);
		end;
	end;

	PROCEDURE Copiar(c:tCola; VAR copia:tCola);
	VAR
		pAux, pNuevo:tPtr;
	begin
		if(EsVacia(c))then
			CrearColaVacia(copia)
		else begin
			pAux:=c.principio;
			CrearColaVacia(copia);
			while(pAux <> NIL)do begin
				Insertar(pAux^.e, copia);
				pAux:=pAux^.sig;
			end;
		end;
	end;

	FUNCTION Iguales(c1, c2:tCola):boolean;
	var
		pAux1, pAux2:tPtr;
		igual:boolean;
	begin
		pAux1:=c1.principio;
		pAux2:=c2.principio;
		igual:=true;
		if(not EsVacia(c1) and not EsVacia(c2)) then
			while(((pAux1 <> NIL) or (pAux2 <> NIL)) and (igual))do begin
				igual:= uElem.Equals(pAux1^.e, pAux2^.e);
				pAux1:=pAux1^.sig;
				pAux2:=pAux2^.sig;
			end
		else if ((EsVacia(c1) and not EsVacia(c2)) or (not EsVacia(c1) and EsVacia(c2)))then
			igual:=false;
		Iguales:=igual;
	end;

	PROCEDURE ImprimirCola(c:tCola);
	VAR
		pAux:tPtr;
	begin
		if(not EsVacia(c))then begin
			pAux:=c.principio;
			writeln('PRINCIPIO: ');
			uElem.Mostrar(pAux^.e);
			pAux:=pAux^.sig;
			while(pAux <> NIL)do begin
				Mostrar(pAux^.e);
				pAux:=pAux^.sig;
			end;
			writeln('FINAL.');
		end;
	end;

begin
END.
