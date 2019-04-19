UNIT uArbinBus;
INTERFACE
	USES uElem, uArbolBinario;
	TYPE
		tArbinBus = tArbin;

	procedure CrearArbolVacio(VAR a:tArbinBus);
	procedure Insertar(e:tElem; VAR a:tArbinBus);
	procedure HijoIzquierdo(VAR izq:tArbinBus; a:tArbinBus);
	procedure HijoDerecho(VAR der:tArbinBus; a:tArbinBus);
	procedure Raiz(VAR r:tElem; a:tArbinBus);
	FUNCTION EsVacio(a:tArbinBus):boolean;
	FUNCTION Pertenece(e:tElem; a:tArbinBus):boolean;
	FUNCTION Igual(a1, a2:tArbinBus):boolean;
	FUNCTION Profundidad(a:tArbinBus):integer;
	function NivelElemento(e:tElem; a:tArbinBus):integer;
	function NumeroNodos(a:tArbinBus):integer;
	function Compensado(a:tArbinBus):boolean;
	function Equilibrado(a:tArbinBus):boolean;
	PROCEDURE Imprimir(a:tArbinBus);


IMPLEMENTATION

	procedure CrearArbolVacio(VAR a:tArbinBus);
	begin
		uArbolBinario.CrearArbolVacio(a);
	end;

	procedure Insertar(e:tElem; VAR a:tArbinBus);
	var
		izq, der, vacio, aux:tArbinBus;
		r:tElem;
	begin
		if EsVacio(a) then begin
			CrearArbolVacio(vacio);
			ConstruirArbolBin(vacio, vacio, e, a);
		end
		else begin
			if not Pertenece(e,a) then begin
				Raiz(r, a);
				HijoIzquierdo(izq, a);
				HijoDerecho(der, a);
				if uElem.EsMenor(e,r) then begin
					Insertar(e, izq);
					if EsHoja(izq) then
						InsertarHijoIzq(izq, a);
				end
				else if uElem.EsMayor(e,r) then begin
					Insertar(e, der);
					if EsHoja(der) then
						InsertarHijoDer(der, a);
				end;
			end;
		end;
		Imprimir(a);
	end;

	procedure HijoIzquierdo(VAR izq:tArbinBus; a:tArbinBus);
	begin
		uArbolBinario.HijoDerecho(izq, a);
	end;

	procedure HijoDerecho(VAR der:tArbinBus; a:tArbinBus);
	begin
		uArbolBinario.HijoDerecho(der, a);
	end;

	procedure Raiz(VAR r:tElem; a:tArbinBus);
	begin
		uArbolBinario.Raiz(r,a);
	end;

	FUNCTION EsVacio(a:tArbinBus):boolean;
	begin
		EsVacio:=uArbolBinario.EsVacio(a);
	end;

	FUNCTION Pertenece(e:tElem; a:tArbinBus):boolean;
	VAR
		hijo:tArbinBus;
		r:tElem;
	begin
		//write('I');
		if EsVacio(a) then
			Pertenece:=false
		else begin
			Raiz(r, a);
			if Equals(e,r) then
				Pertenece:=true
			else if EsMenor(e,r) then begin
				HijoIzquierdo(hijo,a);
				Pertenece:=Pertenece(e,hijo);
			end
			else if EsMayor(e,r) then begin
				HijoDerecho(hijo, a);
				Pertenece:=Pertenece(e, hijo);
			end;
		end;
	end;


	FUNCTION Igual(a1, a2:tArbinBus):boolean;
	begin
		Igual:=uArbolBinario.Igual(a1,a2);
	end;

	FUNCTION Profundidad(a:tArbinBus):integer;
	begin
		Profundidad:=uArbolBinario.Profundidad(a);
	end;


	function NivelElemento(e:tElem; a:tArbinBus):integer;
	begin
		NivelElemento:=-1;
	end;


	function NumeroNodos(a:tArbinBus):integer;
	begin
		NumeroNodos:=uArbolBinario.NumeroNodos(a);
	end;

	function Compensado(a:tArbinBus):boolean;
	begin
		Compensado:=uArbolBinario.Compensado(a);
	end;

	function Equilibrado(a:tArbinBus):boolean;
	begin
		Equilibrado:=uArbolBinario.Equilibrado(a);
	end;

	PROCEDURE Imprimir(a:tArbinBus);
	begin
		uArbolBinario.Imprimir(a);
	end;
end.
