UNIT uConjuntos2;
INTERFACE
	USES uElem;
	TYPE
	{	tConjunto = set of tElem;	{ asi se haria con el tipo predefinido de pascal }
		tConjunto = RECORD
			vector:ARRAY [1..MAX] OF tElem;
			cardinalidad:integer;
		END;

	PROCEDURE CrearConjuntoVacio(var c:tConjunto);
	begin
		c.cardinalidad:= 0;
	end;

	PROCEDURE Poner(var c:tConjunto, e:tElem);
	VAR
		i:0..MAX;
		encontrado:boolean;
	begin
		i:=0;
		encontrado:=false;
		while i<c.cardinalidad and (not encontrado) do begin
			i:=i+1;
			encontrado:=Equals(c.vector[i], e); {funcion del tipo tElem}
		end;
		if not encontrado and c.cardinalidad < MAX then begin
			c.cardinalidad:=c.cardinalidad + 1;
			Asignar(c.vector[c.cardinalidad], e);
		end;
	end;

	PROCEDURE Elegir(c:tConjunto; VAR e:tElem);
	begin
		Asignar(e, c.vector[Random(c.cardinalidad)+1]);
	end;

	PROCEDURE Quitar (VAR c:tConjunto; e:tElem);
		var
			i:0..Max;
			encontrado:boolean;
		begin
			i:=0;
			encontrado:=false;
			While (i<c.cardinalidad) AND (not encontrado) do
				c.vector[i]
		end;
