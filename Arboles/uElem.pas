unit uElem;
interface
	type
		tElem = integer; {cambiar "integer" por el tipo deseado}
	function Equals(e1, e2:tElem):boolean;
	procedure Asignar(VAR eNuevo:tElem; eOriginal:tElem);
	procedure Mostrar(e:tElem);
	procedure Leer(VAR e:tElem);
	function Minimo(e1, e2:tElem):tElem;

implementation
		function Equals(e1, e2:tElem):boolean;
		begin
			Equals:=e1=e2;
		end;

		procedure Asignar(VAR eNuevo:tElem; eOriginal:tElem);
		begin
			eNuevo := eOriginal;
		end;

		procedure Mostrar(e:tElem);
		begin
			writeln(e);
		end;

		procedure Leer(VAR e:tElem);
		begin
			readln(e);
		end;

		function Minimo(e1, e2:tElem):tElem;
		begin
			if e1 < e2 then
				Minimo:=e1
			else if e2 < e1 then
				Minimo:=e2
			else
				Minimo:=e1;
		end;
end.
