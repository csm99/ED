UNIT uConjuntos;
INTERFACE
	USES uElem;
	TYPE
	{	tConjunto = set of tElem;	{ asi se haria con el tipo predefinido de pascal }
		tConjunto = ARRAY [tElem] OF boolean;



	PROCEDURE CrearConjuntoVacio(VAR c:tConjunto);
	VAR
		i: tElem;
	BEGIN
		for i:= PrimerElemento to UltimoElemento do
			c[i] = false;
	END;

	PROCEDURE Poner(VAR c:tConjunto; e:tElem);
	BEGIN
		c[e]:=true;

	END;

	FUNCTION Incluido(c1, c2:tConjunto):boolean;
		VAR
			i:tElem;
			final, encontrado:boolean;
	BEGIN
		encontrado:=true;
		final:=false;
		i:=PrimerElemento;
		while not final and encontrado do
			if c1[i] and not c2[i] then
					encontrado:=false
			ELSE
				i:=Succ(i);
		Incluido:=encontrado;
