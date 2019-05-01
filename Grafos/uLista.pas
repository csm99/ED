// Lista para las listas de adyacencias del
// grafo dirigido. Con campo peso en los nodos.

// ¡¡CUIDADO!! Hay partes desencapsuladas.

unit uLista;
interface
uses uElem;
	TYPE
		TLista = ^TNodo;
		TNodo = record
			e:TElem;
			sig:TLista;
			peso:integer;
		end;


	procedure CrearListaVacia(VAR lista:TLista);
	procedure ConstruirLista(elem:TElem; peso:integer; var lista:TLista);
	procedure PrimerElemento(lista:TLista; VAR e:TElem);
	procedure Resto(lista:TLista; VAR resto:TLista);
	procedure BorrarElemento(elem:TElem; VAR lista:TLista);
	function EsVacia(lista:TLista):boolean;
	function Longitud(lista:TLista):integer;
	procedure Ultimo(lista:tLista; VAR e:TElem);
	function Pertenece(lista:TLista; e:TElem):boolean;
	function Peso(e:tElem):integer;
	procedure Concatenar(l1, l2:tLista; VAR nuevaLista:tLista);
	procedure InsertarFinal(e:tElem; VAR lista:tLista);
	procedure ImprimirLista(lista:tLista);
	procedure GetElemPos(lista:tLista; pos:integer; VAR e:tElem);
	PROCEDURE Copiar(lista:tLista; VAR copia:tLista);
	PROCEDURE Destruir(VAR lista:tLista);
	FUNCTION SonIguales(l1,l2:tLista):boolean;


implementation
	procedure CrearListaVacia(VAR lista:TLista);
	begin
		lista:=nil;
	end;

	procedure ConstruirLista(elem:TElem; peso:integer; var lista:TLista);
	{ introducimos el elemento elem a la lista por el principio}
	var
		pNodoAux:TLista;
	begin
		new(pNodoAux);
		Asignar(pNodoAux^.e, elem);
		pNodoAux^.sig:=lista;
		pNodoAux^.peso:=peso;
		lista:=pNodoAux;
	end;

	procedure PrimerElemento(lista:TLista; VAR e:TElem);
	begin
		if(not EsVacia(lista))then
			e:=lista^.e;
			Asignar(e, lista^.e);
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

	procedure BorrarElemento(elem:TElem; VAR lista:TLista);
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

	procedure Ultimo(lista:tLista; VAR e:TElem);
	begin
		if(not EsVacia(lista))then begin
			while(lista<>nil)do
				lista:=lista^.sig;
			e:=lista^.e;
		end;
	end;

	function Pertenece(lista:TLista; e:TElem):boolean;
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

	function Peso(e:tElem):integer;
	var
		aux:tLista;
	begin
		if not EsVacia(lista) then begin
			aux:=lista;
			while((aux<>nil) and (aux^.e <> e))do
				aux:=aux^.sig;
			if(aux^.e = e)then
				Peso:=aux^.peso;
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

	procedure InsertarFinal(e:tElem; VAR lista:tLista; peso:integer);
	var
		aux,aux2:tLista;
	begin
		if(EsVacia(lista))then
			ConstruirLista(e,lista,peso)
		else begin
			aux:=lista;
			while(aux^.sig <> nil) do
				aux:=aux^.sig;
			new(aux2);
			Asignar(aux2^.e, e);
			aux2^.peso:=peso;
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
			writeln(aux^.e , '(Peso ', aux^.peso, ')');
			aux:=aux^.sig;
		end;
	end;

	procedure GetElemPos(lista:tLista; pos:integer; VAR e:tElem);
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
