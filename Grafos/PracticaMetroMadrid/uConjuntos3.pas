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

		procedure CrearConjuntoVacio(var c:tConjunto);
		PROCEDURE Poner(e:tElem; VAR c:tConjunto);
		function EsVacio(c:tConjunto):boolean;
		function Pertenece(e:tElem; c:tConjunto):boolean;
		function Cardinal(c:tConjunto):integer;
		procedure Quitar(e:tElem; var c:tConjunto);
		procedure ImprimirConjunto(c:tConjunto);


IMPLEMENTATION

	procedure CrearConjuntoVacio(var c:tConjunto);
	begin
		c:=nil;
	end;

	PROCEDURE Poner(e:tElem; VAR c:tConjunto);
	var
		nuevoNodo:^tNodo;
	begin
		if not Pertenece(e,c) then begin
			new(nuevoNodo);
			uElem.Asignar(nuevoNodo^.e, e);
			nuevoNodo^.enlace:=c;
			c:=nuevoNodo;
		end;
	end;

	function EsVacio(c:tConjunto):boolean;
	begin
		EsVacio:= c = nil;
	end;

	function Pertenece(e:tElem; c:tConjunto):boolean;
	begin
		while (c <> nil) and (not Equals(e, c^.e)) do
			c:=c^.enlace;
		if (c <> nil) and (Equals(e, c^.e)) then
			Pertenece:=true
		else
			Pertenece:=false;
	end;

	function Cardinal(c:tConjunto):integer;
	begin
		if EsVacio(c) then
			Cardinal:=0
		else
			Cardinal:= 1 + Cardinal(c^.enlace);
	end;

	procedure Quitar(e:tElem; var c:tConjunto);
	var
		aux, aux2:tConjunto;
	begin
		if not EsVacio(c) then begin
			aux:=c;
			if Equals(e, c^.e) then begin
				c:=aux^.enlace;
				Dispose(aux);
			end
			else begin
				while (aux^.enlace <> nil) and (not Equals(e, aux^.enlace^.e)) do
					aux:=aux^.enlace;
				if (Equals(e, aux^.enlace^.e)) then begin
					aux2:=aux^.enlace;
					aux^.enlace:=aux2^.enlace;
					Dispose(aux2);
				end;
			end;
		end;
	end;

	procedure ImprimirConjunto(c:tConjunto);
	begin
		while not EsVacio(c) do begin
			Mostrar(c^.e);
			c:=c^.enlace;
		end;
	end;
end.
