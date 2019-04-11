UNIT uPrioridad;
INTERFACE
	TYPE
		tPrioridad = integer;
	PROCEDURE CrearPrioridad(n:integer; VAR p:tPrioridad);
	FUNCTION EsMayor(p1, p2:tPrioridad):boolean;
	FUNCTION MismaPrioridad(p1,p2:tPrioridad):boolean;


IMPLEMENTATION

	PROCEDURE CrearPrioridad(n:integer; VAR p:tPrioridad);
	begin
		if(n > 0)then
			p:=n;
	end;

	FUNCTION EsMayor(p1, p2:tPrioridad):boolean;
	begin
		if(p1 - p2 > 0)then
			EsMayor:=true
		ELSE
			EsMayor:=false;
	end;

	FUNCTION MismaPrioridad(p1,p2:tPrioridad):boolean;
	begin
		MismaPrioridad:= p1 = p2;
	end;
end.
