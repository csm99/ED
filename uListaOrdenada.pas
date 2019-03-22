UNIT uListaOrdenada;
INTERFACE
	USES uElem, uLista;

	TYPE
		tListaOrd = tLista;

	PROCEDURE CrearListaOrdVacia(VAR l:tListaOrd);
	PROCEDURE ConstruirListaOrd(elem:tElem; VAR l:tListaOrd);
	PROCEDURE PrimerElemento(lista:tListaOrd; VAR elem:tElem);
	PROCEDURE Resto(lista:tListaOrd; VAR resto:tListaOrd);
	PROCEDURE Copiar(lista:tListaOrd; VAR copia:tListaOrd);
	FUNCTION EsVacia(lista:tListaOrd):boolean;
	FUNCTION Longitud(lista:tListaOrd):integer;
	PROCEDURE Ultimo(lista:tListaOrd; VAR e:tElem);
	{procedure Concatenar(l1, l2:tListaOrd; VAR nuevaLista:tListaOrd);}
	PROCEDURE BorrarElemento(elem:tElem; VAR lista:tListaOrd);
	procedure ImprimirLista(lista:tListaOrd);
	PROCEDURE Destruir(VAR lista:tListaOrd);
	procedure GetElemPos(lista:tListaOrd; pos:integer; VAR e:tElem);


IMPLEMENTATION

	PROCEDURE CrearListaOrdVacia(VAR l:tListaOrd);
	BEGIN
		l:=NIL;
	END;

	PROCEDURE ConstruirListaOrd(elem:tElem; VAR l:tListaOrd);
	VAR
		aux, nNodo:tListaOrd;
	BEGIN
		aux:=l;
		if(EsVacia(l))then begin
			new(nNodo);
			nNodo^.e:=elem;
			nNodo^.sig:=NIL;
			l:=nNodo;
		end
		else if (elem < aux^.e)then begin
			new(nNodo);
			nNodo^.e:=elem;
			nNodo^.sig:=aux;
			l:=nNodo;
		end
		else begin
			while  (aux^.sig <> NIL) and (elem > aux^.e) and (elem > aux^.sig^.e)do
				aux:=aux^.sig;
			new(nNodo);
			nNodo^.e:=elem;
			nNodo^.sig:=aux^.sig;
			aux^.sig:=nNodo;
		end;
	END;

	PROCEDURE PrimerElemento(lista:tListaOrd; VAR elem:tElem);
	BEGIN
		elem:=lista^.e;
	END;

	PROCEDURE Resto(lista:tListaOrd; VAR resto:tListaOrd);
	VAR
		pAux:tListaOrd;
	BEGIN
		Copiar(lista, resto);
		pAux:=resto^.sig;
		Dispose(resto);
		resto:=pAux;
	END;


	PROCEDURE Copiar(lista:tListaOrd; VAR copia:tListaOrd);
	BEGIN
		CrearListaOrdVacia(copia);
		while(lista <> NIL)do begin
			ConstruirListaOrd(lista^.e, copia);
			lista:=lista^.sig;
		end;
	END;

	FUNCTION EsVacia(lista:tListaOrd):boolean;
	BEGIN
		EsVacia:= lista = NIL;
	END;

	FUNCTION Longitud(lista:tListaOrd):integer;
	BEGIN
		if(EsVacia(lista))then
			Longitud:=0
		else
			Longitud:= 1 + Longitud(lista^.sig);
	END;

	PROCEDURE Ultimo(lista:tListaOrd; VAR e:tElem);
	BEGIN
		while(lista^.sig<>NIL)do
			lista:=lista^.sig;
		e:=lista^.e;
	END;

	procedure Concatenar(l1, l2:tListaOrd; VAR nuevaLista:tListaOrd);
	var
		listaAux, nodo:tListaOrd;
	begin
		CrearListaOrdVacia(nuevaLista);
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

	PROCEDURE BorrarElemento(elem:tElem; VAR lista:tListaOrd);
	VAR
		pAux, pAux2:tListaOrd;
	BEGIN
		pAux:=lista;
		if(pAux^.e = elem)then begin
			lista:=pAux^.sig;
			Dispose(pAux);
		end
		else begin
			while (pAux^.sig <> NIL) or (pAux^.sig^.e <> elem) do
				pAux:=pAux^.sig;
			if(pAux^.sig <> NIL) and (pAux^.sig^.e = elem) then begin
				pAux2:=pAux^.sig;
				pAux^.sig:=pAux^.sig^.sig;
				Dispose(pAux2);
			end;
		end;
	END;

	procedure ImprimirLista(lista:tListaOrd);
	var
		aux:tListaOrd;
	begin
		aux:=lista;
		while(aux <> nil)do begin
			writeln(aux^.e);
			aux:=aux^.sig;
		end;
	end;

	PROCEDURE Destruir(VAR lista:tListaOrd);
	VAR
		aux:tListaOrd;
	BEGIN
		aux:=lista;
		WHILE lista <> NIL DO BEGIN
			lista:=lista^.sig;
			Dispose(aux);
			aux:=lista;
		END;
	END;

	procedure GetElemPos(lista:tListaOrd; pos:integer; VAR e:tElem);
	var
		aux:tListaOrd;
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

END.

{

UNIT uListaOrdenada;
INTERFACE
	USES uElem;

	TYPE
		tListaOrd = ^tNodo;
		tNodo = RECORD
			e:tElem;
			sig:^tNodo;
		END;

	PROCEDURE CrearListaOrdVacia(VAR l:tListaOrd);
	PROCEDURE ConstruirListaOrd(elem:tElem; VAR l:tListaOrd);
	PROCEDURE PrimerElemento(lista:tListaOrd; VAR elem:tElem);
	PROCEDURE Resto(lista:tListaOrd; VAR resto:tListaOrd);
	PROCEDURE Copiar(lista:tListaOrd; VAR copia:tListaOrd);
	FUNCTION EsVacia(lista:tListaOrd):boolean;
	FUNCTION Longitud(lista:tListaOrd):integer;
	PROCEDURE Ultimo(lista:tListaOrd; VAR e:tElem);
	PROCEDURE BorrarElemento(elem:tElem; VAR lista:tListaOrd);
	procedure ImprimirLista(lista:tListaOrd);
	PROCEDURE Destruir(VAR lista:tListaOrd);
	procedure GetElemPos(lista:tListaOrd; pos:integer; VAR e:tElem);


IMPLEMENTATION

	PROCEDURE CrearListaOrdVacia(VAR l:tListaOrd);
	BEGIN
		l:=NIL;
	END;

	PROCEDURE ConstruirListaOrd(elem:tElem; VAR l:tListaOrd);
	VAR
		aux, nNodo:tListaOrd;
	BEGIN
		aux:=l;
		if(EsVacia(l))then begin
			new(nNodo);
			nNodo^.e:=elem;
			nNodo^.sig:=NIL;
			l:=nNodo;
		end
		else if (elem < aux^.e)then begin
			new(nNodo);
			nNodo^.e:=elem;
			nNodo^.sig:=aux;
			l:=nNodo;
		end
		else begin
			while  (aux^.sig <> NIL) and (elem > aux^.e) and (elem > aux^.sig^.e)do
				aux:=aux^.sig;
			new(nNodo);
			nNodo^.e:=elem;
			nNodo^.sig:=aux^.sig;
			aux^.sig:=nNodo;
		end;
	END;

	PROCEDURE PrimerElemento(lista:tListaOrd; VAR elem:tElem);
	BEGIN
		elem:=lista^.e;
	END;

	PROCEDURE Resto(lista:tListaOrd; VAR resto:tListaOrd);
	VAR
		pAux:tListaOrd;
	BEGIN
		Copiar(lista, resto);
		pAux:=resto^.sig;
		Dispose(resto);
		resto:=pAux;
	END;


	PROCEDURE Copiar(lista:tListaOrd; VAR copia:tListaOrd);
	BEGIN
		CrearListaOrdVacia(copia);
		while(lista <> NIL)do begin
			ConstruirListaOrd(lista^.e, copia);
			lista:=lista^.sig;
		end;
	END;

	FUNCTION EsVacia(lista:tListaOrd):boolean;
	BEGIN
		EsVacia:= lista = NIL;
	END;

	FUNCTION Longitud(lista:tListaOrd):integer;
	BEGIN
		if(EsVacia(lista))then
			Longitud:=0
		else
			Longitud:= 1 + Longitud(lista^.sig);;
	END;

	PROCEDURE Ultimo(lista:tListaOrd; VAR e:tElem);
	BEGIN
		while(lista^.sig<>NIL)do
			lista:=lista^.sig;
		e:=lista^.e;
	END;

	procedure Concatenar(l1, l2:tListaOrd; VAR nuevaLista:tListaOrd);
	var
		listaAux, nodo:tListaOrd;
	begin
		CrearListaOrdVacia(nuevaLista);
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

	PROCEDURE BorrarElemento(elem:tElem; VAR lista:tListaOrd);
	VAR
		pAux, pAux2:tListaOrd;
	BEGIN
		pAux:=lista;
		if(pAux^.e = elem)then begin
			lista:=pAux^.sig;
			Dispose(pAux);
		end
		else begin
			while (pAux^.sig <> NIL) or (pAux^.sig^.e <> elem) do
				pAux:=pAux^.sig;
			if(pAux^.sig <> NIL) and (pAux^.sig^.e = elem) then begin
				pAux2:=pAux^.sig;
				pAux^.sig:=pAux^.sig^.sig;
				Dispose(pAux2);
			end;
		end;
	END;

	procedure ImprimirLista(lista:tListaOrd);
	var
		aux:tListaOrd;
	begin
		aux:=lista;
		while(aux <> nil)do begin
			writeln(aux^.e);
			aux:=aux^.sig;
		end;
	end;

	PROCEDURE Destruir(VAR lista:tListaOrd);
	VAR
		aux:tListaOrd;
	BEGIN
		aux:=lista;
		WHILE lista <> NIL DO BEGIN
			lista:=lista^.sig;
			Dispose(aux);
			aux:=lista;
		END;
	END;

	procedure GetElemPos(lista:tListaOrd; pos:integer; VAR e:tElem);
	var
		aux:tListaOrd;
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

END.
}
