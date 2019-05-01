program main;
uses uGrafos, uElem;
var
	g:tGrafo;

	procedure InsertarLinea(fichero:string; var g:tGrafo);
	var
		f:text;
		ant, act, pos:string;
		o, d1, d2:tElem;
		e:tElem;
	begin
		assign(f,fichero);
		reset(f);
		if not eof(f) then begin
			readln(f, ant);
			readln(f, act);
			uElem.CrearElem(ant, o);
			uElem.CrearElem(act, d1);
			uGrafos.InsertarOrigen(o, g);
			uGrafos.InsertarDestino(d1, o, 0, g);
		end;
		while not eof(f) do begin
			readln(f, pos);
			uElem.CrearElem(act, o);
			uElem.CrearElem(ant, d1);
			uElem.CrearElem(pos, d2);
			uGrafos.InsertarOrigen(o, g);
			uGrafos.InsertarDestino(d1, o, 0, g); // el 0 es pq el grafo esta implementado con pesos
			uGrafos.InsertarDestino(d2, o, 0, g);
			ant:=act;
			act:=pos;
		end;
		close(f);
	end;



begin
	CrearGrafoVacio(g);
	InsertarLinea('L1.txt', g);
	InsertarLinea('L2.txt', g);
	InsertarLinea('L3.txt', g);
	InsertarLinea('L4.txt', g);
	InsertarLinea('L5.txt', g);
	InsertarLinea('L6.txt', g);
	InsertarLinea('L7.txt', g);
	InsertarLinea('L8.txt', g);
	InsertarLinea('L9.txt', g);
	InsertarLinea('L10.txt', g);
	InsertarLinea('L11.txt', g);
	InsertarLinea('L12.txt', g);

	ImprimirGrafo(g);

end.
