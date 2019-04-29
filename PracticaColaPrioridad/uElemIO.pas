unit uElemIO;
interface
	uses uElem, uDate, uColaPrioridad, uPrioridad;
type
    TArchivo=FILE OF TElem;

	function ExisteArchivo(Nombre: string):boolean;
	procedure RellenarFichero(nombreFichero:string; size: integer);
	procedure LeerDatosPacienteFromFile(nombreFichero:string; pos: integer; var paciente: TElem);
	{Modificar esta operacion para que en lugar de mostrar todos los pacientes los inserte en una cola de prioridad}
	procedure MostrarTodosPacientes(nombreFichero:string);

	procedure InsertarPacientesEnCola(nombreFichero:string; var c:tColaPr);

implementation

	function ExisteArchivo(Nombre: string):boolean;
	var
		fichero: file;
	begin
		Assign(fichero, Nombre);
		{$i-}
		Reset(fichero,1);
		{$i+}
		ExisteArchivo:= IOResult = 0;
		Close(fichero);
	end;

	procedure RellenarFichero(nombreFichero: string; size: integer);
	var
	 	i: integer;
	 	datoActual: TElem;
	 	fichero: TArchivo;
	begin
		assign(fichero, nombreFichero ); (* Asignamos *)
		rewrite(fichero); (* Abrimos (escritura) *)
		writeln(' Te ire pidiendo los datos de diferentes pacientes...' );
		for i := 1 to size do (* Repetimos 4 veces *)
			begin
				LeerPaciente(datoActual);
				write( fichero, datoActual ); (* Guardamos el dato *)
			end;
		close( fichero ); (* Cerramos el fichero *)
	end;

	procedure LeerDatosPacienteFromFile(nombreFichero: string; pos: integer; var paciente: TElem);
	var
		fichero: TArchivo;
	begin
		assign( fichero, nombreFichero );
		reset( fichero ); (* Abrimos (lectura) *)
		seek( fichero, pos-1 ); (* <== Vamos al alumno en la posicion pos *)
		read( fichero, paciente ); (* Leemos *)
		close( fichero );
	end;

	procedure MostrarTodosPacientes(nombreFichero:string);
	var
		fichero: TArchivo;
		paciente: TElem;
	begin
		Assign(fichero, nombreFichero);
		Reset(fichero);
		while not eof(fichero) do
			begin
				read(fichero, paciente);
					uElem.Mostrar(paciente);
			end
	end;

	procedure InsertarPacientesEnCola(nombreFichero:string; VAR c:tColaPr);
	var
		fichero: TArchivo;
		paciente: TElem;
		gravedad:tPrioridad;
	begin
		Assign(fichero, nombreFichero);
		Reset(fichero);
		while not eof(fichero) do
			begin
				read(fichero, paciente);
				uElem.GetGravedad(paciente, gravedad);
				uColaPrioridad.Insertar(paciente, gravedad, c);
			end
	end;

end.
