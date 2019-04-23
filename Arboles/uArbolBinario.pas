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
	FUNCTION Profundidad(a:tArbin):integer;
	function NivelElemento(e:tElem; a:tArbin):integer;
	function NumeroNodos(a:tArbin):integer;
	function Compensado(a:tArbin):boolean;
	function Equilibrado(a:tArbin):boolean;
	procedure InsertarHijoIzq(hijo:tArbin; VAR a:tArbin);
	procedure InsertarHijoDer(hijo:tArbin; VAR a:tArbin);
	function EsHoja(a:tArbin):boolean;
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

	function ElementosVacios(c:tCola):boolean;
	var
		vacio:boolean;
		aux:tPtr;
	begin
		if EsVacia(c) then
			ElementosVacios:=true
		else begin
			vacio:=true;
			aux:=c.principio;
			while (aux <> nil) and vacio do begin
				if(aux^.e^.r <> -1) then
					vacio:=false;
				aux:=aux^.sig;
			end;
			ElementosVacios:=vacio;
		end;
	end;

	PROCEDURE CrearColaVacia(VAR c:tCola);
	begin
		c.principio := NIL;
		c.final := NIL;
	end;

	PROCEDURE Insertar(e:tarbin; VAR c:tCola);
	VAR
		p:tPtr;
		aux:tArbin;
	begin
		if(EsVacio(e))then begin
			ConstruirArbolBin(NIL, NIL, -1, aux);
			{-1 si es una rama VACÍA}
			e:=aux;
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

	function Minimo(e1, e2:integer):integer;
	begin
		if e1 < e2 then
			Minimo:=e1
		else if e2 < e1 then
			Minimo:=e2
		else
			Minimo:=e1;
	end;

	procedure ImprimirCola(c:tCola);
	var
		aux:tCola;
	begin
		aux:=c;
		while (aux.principio <> NIL) do begin
			if(aux.principio^.e^.r = -1)then
				write('.')
			else
				write(aux.principio^.e^.r,' ');
			aux.principio:=aux.principio^.sig;
		end;
		writeln;
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
		a^.der:=der;
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
		if not EsVacio(a) then begin
		{while (not encontrado) and (pAux <> NIL) do begin}
			if(Equals(e,pAux^.r))then
				encontrado:=true
			else
				encontrado := Pertenece(e, pAux^.izq) or Pertenece(e, pAux^.der);
		end;
		Pertenece:=encontrado;
	end;

	FUNCTION Igual(a1, a2:tArbin):boolean;
	begin
		if EsVacio(a1) and EsVacio(a2) then
			Igual:=true
		else if EsVacio(a1) or EsVacio(a2) then
			Igual:=false
		else begin
			Igual := Equals(a1^.r, a2^.r) and Igual(a1^.izq, a2^.izq) and Igual(a1^.der, a2^.der);
		end;


	end;

	FUNCTION Profundidad(a:tArbin):integer;
	var
		profundidad1, profundidad2:integer;
	BEGIN
		if EsVacio(a) then
			Profundidad:=0
		ELSE BEGIN
			profundidad1:=Profundidad(a^.izq);
			profundidad2:=Profundidad(a^.der);
			if(profundidad1 > profundidad2) then
				Profundidad:=profundidad1 + 1
			else if (profundidad2 > profundidad1) then
				Profundidad:=profundidad2 + 1
			else
				Profundidad:=profundidad1 + 1;
		END;
	END;

	function NivelElemento(e:tElem; a:tArbin):integer;
	begin
		if(Pertenece(e, a))then begin
			if EsVacio(a) then
				NivelElemento:=0
			else if uElem.Equals(e, a^.r) then
				NivelElemento:=1
			else begin
				if EsVacio(a^.izq) and not EsVacio(a^.der) then
					NivelElemento:= 1 + NivelElemento(e, a^.der)
				else if EsVacio(a^.der) and not EsVacio(a^.izq) then
					NivelElemento:= 1 + NivelElemento(e, a^.izq)
				else
					NivelElemento:= 1 + Minimo(NivelElemento(e, a^.izq), NivelElemento(e, a^.der));
			end;
		end;
	end;


	function NumeroNodos(a:tArbin):integer;
	begin
		if EsVacio(a) then
			NumeroNodos:=0
		else
			NumeroNodos:= 1 + NumeroNodos (a^.izq) + NumeroNodos (a^.der);
	end;

	function Compensado(a:tArbin):boolean;
	begin
		Compensado:= NumeroNodos(a^.izq) = NumeroNodos(a^.der);
	end;

	function Equilibrado(a:tArbin):boolean;
	VAR
		nodos:integer;
	begin
		if EsVacio(a) then
			Equilibrado:=true
		else begin
			Equilibrado:= Compensado(a) and Equilibrado(a^.izq) and Equilibrado(a^.der);
		end;
	end;

	procedure InsertarHijoIzq(hijo:tArbin; VAR a:tArbin);
	begin
		if (not EsVacio(a)) and (Profundidad(a^.izq) <= 1) then
			a^.izq:=hijo;
	end;

	procedure InsertarHijoDer(hijo:tArbin; VAR a:tArbin);
	begin
		if (not EsVacio(a)) and (Profundidad(a^.der) <= 1) then
			a^.der:=hijo;
	end;

	procedure SetRaiz(e:tElem; VAR a:tArbin);
	begin
		if not EsVacio(a) then
			a^.r:=e;
	end;

	function EsHoja(a:tArbin):boolean;
	begin
		if EsVacio(a) then
			EsHoja:=false
		else
			EsHoja:= ((a^.izq = nil) and (a^.der = nil));
	end;

	{ ------------------------------ }


	PROCEDURE Imprimir(a:tArbin);
	VAR
		cAux, cAux2:tCola;
		nodo:tArbin;
		prof, i, j:integer;
	begin
		CrearColaVacia(cAux);
		CrearColaVacia(cAux2);
		prof:=Profundidad(a);
				//writeln(prof);
		if not EsVacio(a) then begin
			for i:=1 to prof do
				write(' ');
			prof:=prof-1;
			Mostrar(a^.r);
			Insertar(a^.izq, cAux);
			Insertar(a^.der, cAux);
			Copiar(cAux, cAux2);
			for i:=1 to prof do
				write(' ');
			prof:=prof-1;
			while not EsVacia(cAux) do begin
				Primero(nodo,cAux);
				if not EsVacio(nodo) then
					if nodo^.r = -1 then
						write('.')
					else
						write(nodo^.r, ' ');
				Eliminar(cAux);
			end;
			writeln;
			j:=1;
			while (not ElementosVacios(cAux2)) do begin
				Primero(nodo,cAux2);
				while not EsVacia(cAux2) do begin
					Insertar(nodo^.izq, cAux);
					Insertar(nodo^.der, cAux);
					Eliminar(cAux2);
					if not EsVacia(cAux2)then
						Primero(nodo,cAux2)
					else
						nodo:=NIL;
				end;
				j:=j-1;
				for i:=1 to prof-j do
					write(' ');
				prof:=prof-1;
				ImprimirCola(cAux);
				Primero(nodo, cAux);
				while (not EsVacia(cAux)) and (not EsVacio(nodo)) do begin
					Insertar(nodo^.izq, cAux2);
					Insertar(nodo^.der, cAux2);
					Eliminar(cAux);
					if not EsVacia(cAux)then
						Primero(nodo,cAux)
					else
						nodo:=NIL;
				end;
				for i:=1 to prof-j do
					write(' ');
				prof:=prof-1;
				//writeln('cola');
				ImprimirCola(cAux2);
				//if(ElementosVacios(cAux2))then
					//CrearColaVacia(cAux2);
				//writeln(ElementosVacios(cAux2));
				//writeln(EsVacia(caux2), EsVacio(nodo));
			end;
			writeln;

		end;
	end;





end.
