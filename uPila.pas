UNIT uPila;
INTERFACE
	USES uElem, uLista;
	TYPE
		tPila = tLista;

	PROCEDURE CrearPilaVacia(p:tPila);
	PROCEDURE Apilar(e:tElem; VAR p:tPila);
	PROCEDURE Cima(VAR e:tElem; p:tPila);
	FUNCTION EsVacia(p:tPila):boolean;
	PROCEDURE Desapilar(VAR p:tPila);
	PROCEDURE Copiar(pila:tPila; VAR copia:tPila);
	PROCEDURE Destruir(VAR p:tPila);
	PROCEDURE ImprimirPila(p:tPila);
	FUNCTION Longitud(p:tPila):integer;


IMPLEMENTATION

	PROCEDURE CrearPilaVacia(p:tPila);
	BEGIN
		p:=NIL;
	END;

	PROCEDURE Apilar(e:tElem; VAR p:tPila);
	BEGIN
		uLista.ConstruirLista(e, p);
	END;

	PROCEDURE Cima(VAR e:tElem; p:tPila);
	BEGIN
		uLista.PrimerElemento(p, e);
	END;

	FUNCTION EsVacia(p:tPila):boolean;
	BEGIN
		EsVacia:=uLista.EsVacia(p);
	END;

	PROCEDURE Desapilar(VAR p:tPila);
	VAR
		elem:tElem;
	BEGIN
		Cima(elem, p);
		uLista.BorrarElemento(elem, p);
	END;

	PROCEDURE Copiar(pila:tPila; VAR copia:tPila);
	BEGIN
		uLista.Copiar(pila, copia);
	END;


	PROCEDURE Destruir(VAR p:tPila);
	BEGIN
		uLista.Destruir(p);
	END;

	PROCEDURE ImprimirPila(p:tPila);
	BEGIN
		uLista.ImprimirLista(p);
	END;

	FUNCTION Longitud(p:tPila):integer;
	BEGIN
		uLista.Longitud(p);
	END;

END.
