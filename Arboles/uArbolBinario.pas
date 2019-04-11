UNIT uArbolBinario;
INTERFACE
	USES uElem;
	TYPE
	tArbin = ^tNodo;
	tNodo = record
		r:tElem;
		izq:tArbin;
		der:tArbin;
	end;

	PROCEDURE CrearArbolVacio(VAR a:tArbin);
	PROCEDURE ConstruirArbolBin(izq, der:tArbin; e:tElem; VAR a:tArbin);
	PROCEDURE Raiz(VAR r:tElem; a:tArbin);
	PROCEDURE HijoIzquierdo(VAR izq:tArbin; a:tArbin);
	PROCEDURE HijoDerecho(VAR der:tArbin; a:tArbin);
	FUNCTION EsVacio(a:tArbin):boolean;
	FUNCTION Pertenece(e:tElem; a:tArbin):boolean;
	FUNCTION Igual(a1, a2:tArbin):boolean;
	PROCEDURE Imprimir(a:tArbin);

IMPLEMENTATION
type
	tPtr = ^tNodoC;
	tNodoC = RECORD
		e:tArbin;
		sig:tPtr;
	END;
	tCola = RECORD
		principio:tPtr;
		final:tPtr;
	END;

	{---------------------------------------}
	{TAD COLA DE NODOS DE ARBOL ADAPTADA PARA IMPRIMIR UN ARBOL}

	FUNCTION EsVacia(c:tCola):boolean;
	begin
		EsVacia:= (c.principio = NIL) and (c.final = NIL);
	end;

	PROCEDURE CrearColaVacia(VAR c:tCola);
	begin
		c.principio := NIL;
		c.final := NIL;
	end;

	PROCEDURE Insertar(e:tarbin; VAR c:tCola);
	VAR
		p:tPtr;
	begin
		if(EsVacio(e))then begin
			ConstruirArbolBin(NIL, NIL, -1, e);
			{-1 si es una rama VACÍA}
		end;
		if(EsVacia(c))then begin
			new(p);
			p^.e:=e;
			p^.sig:=NIL;
			c.final:=p;
			c.principio:=p;
		end
		else begin
			new(p);
			p^.e:=e;
			p^.sig:=NIL;
			c.final^.sig:=p;
			c.final:=p;
		end;
	end;

	PROCEDURE Primero(VAR e:tArbin; c:tCola);
	begin
		if(not EsVacia(c))then
			e:=c.principio^.e;
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



{----------------------------------------------------------------}

	PROCEDURE CrearArbolVacio(VAR a:tArbin);
	begin
		a:=NIL;
	end;

	PROCEDURE ConstruirArbolBin(izq, der:tArbin; e:tElem; VAR a:tArbin);
	begin
		new(a);
		a^.izq:=izq;
		a^.der:=DEr;
		Asignar(a^.r, e);
	end;

	PROCEDURE Raiz(VAR r:tElem; a:tArbin);
	begin
		Asignar(r, a^.r);
	end;

	PROCEDURE HijoIzquierdo(VAR izq:tArbin; a:tArbin);
	begin
		izq:=a^.izq;
	end;

	PROCEDURE HijoDerecho(VAR der:tArbin; a:tArbin);
	begin
		der:=a^.der;
	end;

	FUNCTION EsVacio(a:tArbin):boolean;
	begin
		EsVacio:= a = NIL;
	end;

	FUNCTION Pertenece(e:tElem; a:tArbin):boolean;
	var
		encontrado:boolean;
		pAux:tArbin;
	begin
		encontrado:=False;
		pAux:=a;
		while (not encontrado) and (pAux <> NIL) do begin
			if(Equals(e,a^.r))then
				encontrado:=true
			else
				encontrado := Pertenece(e, a^.izq) or Pertenece(e, a^.der);
		end;
		Pertenece:=encontrado;
	end;

	FUNCTION Igual(a1, a2:tArbin):boolean;
	begin
		if not EsVacio(a1) and not EsVacio(a2)then begin
			if(Equals(a1^.r, a2^.r))then
				Igual := true
			else
				Igual := Igual(a1^.izq, a2^.izq) and Igual(a1^.der, a2^.der);
		end;


	end;

	PROCEDURE Imprimir(a:tArbin);
	VAR
		cAux, cAux2:tCola;
		nodo:tArbin;
	begin
		CrearColaVacia(cAux);
		CrearColaVacia(cAux2);
		if not EsVacio(a) then begin
			Mostrar(a^.r);
			Insertar(a^.izq, cAux);
			Insertar(a^.der, cAux);
			Copiar(cAux, cAux2);
			while not EsVacia(cAux) do begin
				Primero(nodo,cAux);
				if not EsVacio(nodo) then
					write(nodo^.r, ' ');
				Eliminar(cAux);
			end;
			writeln;
			while (not EsVacia(cAux2)) and (not EsVacio(nodo)) do begin
				Primero(nodo,cAux2);
				while not EsVacia(cAux2) do begin
					Insertar(nodo^.izq, cAux);
					Insertar(nodo^.der, cAux);
					if(nodo^.izq <> NIL) then
						write(nodo^.izq^.r, ' ');
					if(nodo^.der <> NIL) then
						write(nodo^.der^.r, ' ');
					Eliminar(cAux2);
					if not EsVacia(cAux2)then
						Primero(nodo,cAux2)
					else
						nodo:=NIL;
				end;
				writeln;
				Primero(nodo, cAux);
				while (not EsVacia(cAux)) and (not EsVacio(nodo)) do begin
					Insertar(nodo^.izq, cAux2);
					Insertar(nodo^.der, cAux2);
					if(nodo^.izq <> NIL) then
						write(nodo^.izq^.r, ' ');
					if(nodo^.der <> NIL) then
						write(nodo^.der^.r, ' ');
					Eliminar(cAux);
					if not EsVacia(cAux)then
						Primero(nodo,cAux)
					else
						nodo:=NIL;
				end;
				writeln;
			end;
		end;
	end;




end.
