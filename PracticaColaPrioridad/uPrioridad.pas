unit uPrioridad;
interface
	type
		TPrioridad = integer;

		function MismaPrioridad(prioridad1, prioridad2 : TPrioridad): boolean;
		function EsMenor(prioridad1, prioridad2 : TPrioridad): boolean;
		function EsMayor(prioridad1, prioridad2 : TPrioridad): boolean;
		procedure Asignar(var pd: TPrioridad; po: TPrioridad);
		procedure Mostrar(p: TPrioridad);
		procedure Leer(var p: TPrioridad);
		procedure Crear(valor: integer; var p: TPrioridad);

implementation
	function MismaPrioridad(prioridad1, prioridad2 : TPrioridad): boolean;
	begin
		MismaPrioridad:= prioridad1 = prioridad2
	end;

	function EsMenor(prioridad1, prioridad2 : TPrioridad): boolean;
	begin
		EsMenor:= prioridad1 < prioridad2
	end;

	function EsMayor(prioridad1, prioridad2 : TPrioridad): boolean;
	begin
		EsMayor:= prioridad1 > prioridad2
	end;

	procedure Asignar(var pd: TPrioridad; po: TPrioridad);
	begin
		pd:= po
	end;
	procedure Mostrar(p: TPrioridad);
	begin
		writeln('Prioridad: ',p);
	end;

	procedure Leer(var p: TPrioridad);
	begin
		writeln('Introduce una prioridad (valor entero)');
		readln(p);
	end;

	procedure Crear(valor: integer; var p: TPrioridad);
	begin
		p:= valor;
	end;
end.
