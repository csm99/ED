unit uLista;
interface
	TYPE
		TLista = ^TNodo;
		TNodo = record
			e:string;
			sig:TLista;
		end;


	procedure CrearListaVacia(VAR lista:TLista);
	procedure ConstruirLista(elem:string; VAR lista:TLista);
	procedure PrimerElemento(lista:TLista; VAR e:string);
	procedure Resto(lista:TLista; VAR resto:TLista);
	procedure BorrarElemento(elem:string; VAR lista:TLista);
	function EsVacia(lista:TLista):boolean;
	function Longitud(lista:TLista):integer;
	procedure Ultimo(lista:tLista; VAR e:string);
	function Pertenece(lista:TLista; e:string):boolean;
	procedure Concatenar(l1, l2:tLista; VAR nuevaLista:tLista);
	procedure InsertarFinal(e:string; VAR lista:tLista);
	procedure ImprimirLista(lista:tLista);
	procedure GestringPos(lista:tLista; pos:integer; VAR e:string);
	PROCEDURE Copiar(lista:tLista; VAR copia:tLista);
	PROCEDURE Destruir(VAR lista:tLista);
	FUNCTION SonIguales(l1,l2:tLista):boolean;


implementation

	function Equals(e1,e2:string):boolean;
	begin
		Equals:= e1 = e2;
	end;

	procedure CrearListaVacia(VAR lista:TLista);
	begin
		lista:=nil;
	end;

	procedure ConstruirLista(elem:string; VAR lista:TLista);
	{ introducimos el elemento elem a la lista por el principio}
	var
		pNodoAux:TLista;
	begin
			new(pNodoAux);
			{
			Asignar(pNodoAux^.e, elem); subprograma del uElem
			*}
			pNodoAux^.e:=elem;
			pNodoAux^.sig:=lista;
			lista:=pNodoAux;
	end;

	procedure PrimerElemento(lista:TLista; VAR e:string);
	begin
		if(not EsVacia(lista))then
			e:=lista^.e;
	end;

	PROCEDURE Resto(lista:tLista; VAR resto:tLista);
	VAR
		pAux:tLista;
	BEGIN
		Copiar(lista, resto);
		pAux:=resto^.sig;
		Dispose(resto);
		resto:=pAux;
	END;

	procedure BorrarElemento(elem:string; VAR lista:TLista);
	{ borramos el elemento elem de la lista }
	var
		pAnterior, pActual:^TNodo;
	begin
		pActual:=lista;
		while((pActual <> nil) and (not Equals(pActual^.e, elem))) do begin
			pAnterior:=pActual;
			pActual:=pActual^.sig;
		end;
		if(pActual <> nil)then begin
			if(pActual = lista)then
				lista:=pActual^.sig
			else
				pAnterior^.sig:=pActual^.sig;
			dispose(pActual);
		end;
	end;

	function EsVacia(lista:TLista):boolean;
	begin
		EsVacia:= lista = nil;
	end;

	FUNCTION Longitud(lista:tLista):integer;
	BEGIN
		if(EsVacia(lista))then
			Longitud:=0
		else
			Longitud:= 1 + Longitud(lista^.sig);;
	END;

	function Longitud2(lista:TLista):integer;
	VAR
		contador:integer;
		aux:tLista;
	begin
		contador:=0;
		aux:=lista;
		while(aux <> nil)do begin
			contador:=contador + 1;
			aux:=aux^.sig;
		end;
		Longitud2:=contador;
	end;

	procedure Ultimo(lista:tLista; VAR e:string);
	begin
		if(not EsVacia(lista))then begin
			while(lista<>nil)do
				lista:=lista^.sig;
			e:=lista^.e;
		end;
	end;

	function Pertenece(lista:TLista; e:string):boolean;
	var
		aux:tLista;
	begin
		if(EsVacia(lista))then
			Pertenece:=false
		else begin
			aux:=lista;
			while((aux<>nil) and (aux^.e <> e))do
				aux:=aux^.sig;
			if(aux^.e = e)then
				Pertenece := true
			else
				Pertenece := false;
		end;
	end;

	procedure Concatenar(l1, l2:tLista; VAR nuevaLista:tLista);
	var
		listaAux, nodo:tLista;
	begin
		CrearListaVacia(nuevaLista);
		if(EsVacia(l1))then
			Copiar(l2, nuevaLista)
		else if(EsVacia(l2))then
			Copiar(l1, nuevaLista)
		else begin
			Copiar(l1, nuevaLista);
			Copiar(l2, listaAux);
			nodo:=nuevaLista;
			while nodo^.sig<>NIL do
				nodo:=nodo^.sig;
			nodo^.sig:=listaAux;
		end;
	end;

	procedure InsertarFinal(e:string; VAR lista:tLista);
	var
		aux,aux2:tLista;
	begin
		if(EsVacia(lista))then
			ConstruirLista(e,lista)
		else begin
			aux:=lista;
			while(aux^.sig <> nil) do
				aux:=aux^.sig;
			new(aux2);
			aux2^.e:=e;
			aux2^.sig:=nil;
			aux^.sig:=aux2;
		end;
	end;

	procedure ImprimirLista(lista:tLista);
	var
		aux:tLista;
	begin
		aux:=lista;
		while(aux <> nil)do begin
			writeln(aux^.e);
			aux:=aux^.sig;
		end;
	end;

	procedure GestringPos(lista:tLista; pos:integer; VAR e:string);
	var
		aux:tLista;
		contador:integer;
	begin
		if not EsVacia(lista) then begin
			contador:= 0;
			aux:=lista;
			while(aux^.sig <> nil) and (contador<pos)do begin
				aux:=aux^.sig;
				contador:=contador+1;
			end;
			if not ((aux^.sig = nil) and (contador < pos)) then
				e:=aux^.e;
		end;
	end;

	procedure Copiar(lista:tLista; VAR copia:tLista);
	begin
		CrearListaVacia(copia);
		WHILE lista <> nil DO BEGIN
			InsertarFinal(lista^.e, copia);
			lista:=lista^.sig;
		END;
	end;

	PROCEDURE Destruir(VAR lista:tLista);
	VAR
		aux:tLista;
	BEGIN
		aux:=lista;
		WHILE lista <> NIL DO BEGIN
			lista:=lista^.sig;
			Dispose(aux);
			aux:=lista;
		END;
	END;

	FUNCTION SonIguales(l1,l2:tLista):boolean;
	var
		aux1,aux2:tLista;
		iguales:boolean;
	begin
		aux1:=l1;
		aux2:=l2;
		iguales:=true;
		while (aux1<>nil) and (aux2 <> nil) and (aux1^.e = aux2^.e) do begin
			aux1:=aux1^.sig;
			aux2:=aux2^.sig;
		end;
		if(aux1 = NIL) and (aux2 = nil)then
			iguales:=true
		else
			iguales:=false;
		SonIguales:=iguales;
	end;



end.
