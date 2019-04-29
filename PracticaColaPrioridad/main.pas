program main;
uses uColaPrioridad, uElem, uElemIO;
	{
	dia = record
		cola:tColaPr;
		fecha:TDate;
	end;
	mes = array [1..30] of dia;
	anyo = array [1..12] of mes;
}
var

	colaAnual:tColaPr;

begin
	CrearColaPrVacia(colaAnual);
	//MostrarTodosPacientes('pacientes.dat');
	uElemIO.InsertarPacientesEnCola('pacientes.dat', colaAnual);
	uColaPrioridad.ImprimirColaPr(colaAnual);



end.
