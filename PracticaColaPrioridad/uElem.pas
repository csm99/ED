unit uElem;
{Unidad con el tipo que representa los pacientes}
interface
	uses uDate, uPrioridad;

	type
		TElem=RECORD
        	fechaIngreso: TDate;
        	nombre: string;
        	apellidos: string;
        	edad: integer;
        	motivoIngreso: string;
        	gravedad: TPrioridad;
     	END;

	procedure LeerPaciente(var paciente: TElem);
	procedure Mostrar(paciente: TElem);

	procedure GetGravedad(p:tElem; var g:tPrioridad);
	function Equals(e1,e2:tElem):boolean;
	procedure Asignar(var e1:tElem; e2:tElem);

implementation

	procedure LeerPaciente(var paciente: TElem);
	var
	   g: integer;
    begin
       	writeln(' Introduce el nombre del paciente ');
		readln( paciente.nombre );
		writeln(' Introduce el nombre del paciente ');
		readln( paciente.apellidos );
		writeln(' Introduce la edad del paciente ');
		readln( paciente.edad );
		writeln(' Introduce la fecha del ingreso ');
		uDate.Leer(paciente.fechaIngreso);
		writeln(' Introduce el motivo del ingreso ');
		readln( paciente.motivoIngreso );
		writeln(' Introduce la gravedad ');
		readln(g);
		Crear(g,paciente.gravedad);
		writeln( '---------------- ')
    end;


    procedure Mostrar(paciente: TElem);
    begin
    	writeln(' Nombre del paciente: ', paciente.nombre );
    	writeln(' Apellidos del paciente: ', paciente.apellidos );
		writeln(' Edad: ',paciente.edad );
		write(' Fecha de ingreso: ');
		uDate.Mostrar(paciente.fechaIngreso);
		writeln(' Motivo de ingreso: ',paciente.motivoIngreso );
		write(' Gravedad: ');
		uPrioridad.Mostrar(paciente.gravedad);
		writeln( '---------------- ')
    end;

// --------------
	procedure GetGravedad(p:tElem; var g:tPrioridad);
	begin
		g:=p.gravedad;
	end;

	function Equals(e1,e2:tElem):boolean;
	begin
		Equals:= (Iguales(e1.fechaIngreso, e2.fechaIngreso))
				and (e1.nombre = e2.nombre)
				and (e1.apellidos = e2.apellidos)
				and (e1.edad = e2.edad)
				and (e1.motivoIngreso = e2.motivoIngreso)
				and (e1.gravedad = e2.gravedad);
	end;

	procedure Asignar(var e1:tElem; e2:tElem);
	begin
		uDate.Asignar(e1.fechaIngreso, e2.fechaIngreso);
		e1.nombre:=e2.nombre;
		e1.apellidos:=e2.apellidos;
		e1.edad:=e2.edad;
		e1.motivoIngreso:=e2.motivoIngreso;
		e1.gravedad:=e2.gravedad;
	end;
end.
