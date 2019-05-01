unit uElem;
interface
	type
		tElem = string; {cambiar "integer" por el tipo deseado}
	function Equals(e1, e2:tElem):boolean;
	procedure Asignar(VAR eNuevo:tElem; eOriginal:tElem);
	procedure Mostrar(e:tElem);
	procedure Leer(VAR e:tElem);
	procedure CrearElem(s:string; var e:tElem);

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

		procedure CrearElem(s:string; var e:tElem);
		begin
			e:=s;
		end;

end.
