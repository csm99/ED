UNIT uArbolExtension;
INTERFACE
	USES uElem, uArbolBin;

	FUNCTION Profundidad(a:tArbolBin):integer;

IMPLEMENTATION

	FUNCTION Profundidad(a:tArbolBin):integer;
	VAR
		hi,hd:tArbolBin;
	begin
		if EsVacio(a) then
			Profundidad:=0
		else begin
			HijoIzq(a,hi);
			HijoDer(a,hd);
			Profundidad:= 1 + Maximo(Profundidad(hi), Profundidad(hd));
		end;
	end;

	FUNCTION Equilibrado(a:tArbolBin):boolean;
	VAR
		eq:boolean;
	begin
		if(EsVacio(a)) then begin
			Equilibrado:=true;
		end
		else begin
			HijoIzq(a,hi);
			HijoDer(a,hd);
			Equilibrado:=Compensado(a) and Equilibrado(hi) and Equilibrado(hd);
		end;
	end;

	FUNCTION Compensado(a:tArbolBin):boolean;
	VAR
		eq:boolean;
	begin
		if(EsVacio(a)) then begin
			Compensado:=true;
		end
		else begin
			HijoIzq(a,hi);
			HijoDer(a,hd);
			Compensado:= NumNodos(hd) = NumNodos(hi);
		end;
	end;

	PROCEDURE Espejo(a:tArbolBin; VAR esp:tArbolBin);
	var
		r:tElem;
		izq, der:tArbolBin;
		espIzq, espDer:tArbolBin;
	begin
		CrearArbolVacio(esp);
		if EsArbolVacio(a) then
			CrearArbolVacio(esp)	(* es el caso para la recursividad, el otro Crear Vacío es para inicializar *)
		else begin
			Raiz(a,r);
			HijoDer(a,der);
			HijoIzq(a,izq);
			Espejo(izq, espIzq);
			Espejo(der, espDer);
			Construir(der, r, izq, esp);
		end;
	end;


	FUNCTION NivelElemento(a:tArbolBin; e:tElem):integer;
	VAR
		r:tElem;
		izq, der:tArbolBin;
		aux:integer;
	begin
		if EsArbolVacio(a) then
			NivelElemento:=0
		else begin
			Raiz(a,r);
			if uElem.Equals(r,e) then
				NivelElemento:=1
			else begin
				HijoIzq(a,izq);
				HijoDer(a,der);
				if Pertenece(izq, e) and Pertenece (hd,e) then
					NivelElemento:= 1 + Minimo(NivelElemento(izq, e), NivelElemento(der, e))
				else
					if (not Pertenece(izq, e)) and (not Pertenece(der, e)) then
						NivelElemento:=0
					else
						NivelElemento:= 1 + Maximo(NivelElemento(izq, e), NivelElemento(der,e));
			end;
		end;
	end;
