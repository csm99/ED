unit uGrafos;

interface
uses uElem, uLista;

	type
		tNodo = record
			e:tElem;
			lista:tLista; // lista de adyacencias
			sig:^tNodo;
		end;

		tGrafo = ^tNodo;

		procedure CrearGrafoVacio(var g:tGrafo);
		procedure InsertarOrigen(origen:tElem; var g:tGrafo);
		procedure InsertarDestino(destino:tElem; origen:tElem; peso:integer; var g:tGrafo);
		function Contains(e:tElem; g:tGrafo):boolean;
		function EsVacio(g:tGrafo):boolean;
		function ContainsDestinos(e, origen:tElem; g:tGrafo):boolean;
		procedure GetListaAdyacencia(e:tElem; g:tGrafo; var l:tLista);
		procedure ImprimirGrafo(g:tGrafo);


implementation

	procedure CrearGrafoVacio(var g:tGrafo);
	begin
		g:=nil;
	end;

	procedure InsertarOrigen(origen:tElem; var g:tGrafo);
	var
		nuevoNodo:tGrafo;
	begin
		if not Contains(origen, g) then begin
			new(nuevoNodo);
			Asignar(nuevoNodo^.e, origen);
			uLista.CrearListaVacia(nuevoNodo^.lista);
			nuevoNodo^.sig:=g;
			g:=nuevoNodo;
		end;
	end;

	procedure InsertarDestino(destino:tElem; origen:tElem; peso:integer; var g:tGrafo);
	var
		aux:tGrafo;
	begin
		if not ContainsDestinos(destino, origen, g) then begin
			aux:=g;
			while (aux <> nil) and (not Equals(aux^.e, origen)) do
				aux:=aux^.sig;
			if (aux <> nil) then
				uLista.ConstruirLista(destino, peso, aux^.lista);
		end;
	end;

	function Contains(e:tElem; g:tGrafo):boolean;
	var
		esta:boolean;
	begin
		if EsVacio(g) then
			Contains:=false
		else begin
			if Equals(e,g^.e) then
				Contains:=true
			else
				Contains:=Contains(e, g^.sig);
		end;
	end;

	function EsVacio(g:tGrafo):boolean;
	begin
		EsVacio:= g = nil;
	end;

	function ContainsDestinos(e, origen:tElem; g:tGrafo):boolean;
	var
		aux:tGrafo;
	begin
		if EsVacio(g) then
			ContainsDestinos:=false
		else begin
			aux:=g;
			while (aux <> nil) and (not Equals(aux^.e, origen)) do
				aux:=aux^.sig;
			if (aux <> nil) then
				ContainsDestinos:=uLista.Pertenece(aux^.lista, e)
			else
				ContainsDestinos:=false;
		end;
	end;

	procedure GetListaAdyacencia(e:tElem; g:tGrafo; var l:tLista);
	var
		aux:tGrafo;
	begin
		if EsVacio(g) then
			CrearListaVacia(l)
		else begin
			aux:=g;
			while (aux <> nil) and (not Equals(aux^.e, e)) do
				aux:=aux^.sig;
			if (aux <> nil) then
				uLista.Copiar(aux^.lista, l)
			else
				CrearListaVacia(l);
		end;
	end;

	procedure ImprimirGrafo(g:tGrafo);
	begin
		while g <> nil do begin
			writeln('***');
			write('Or: ');
			uElem.Mostrar(g^.e);
			uLista.ImprimirLista(g^.lista);
			writeln('***');
			g:=g^.sig;
		end;
	end;


end.
