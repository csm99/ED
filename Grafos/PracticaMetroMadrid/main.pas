program main;
uses uGrafos, uElem, uLista;
var
	g:tGrafo;
	l,l2:tLista;

	procedure InsertarLinea(fichero:string; var g:tGrafo);
	var
		f:text;
		ant, act, pos:string;
		o, d1, d2:tElem;
		e:tElem;
		i:integer;
	begin
		i:=0;
		assign(f,fichero);
		reset(f);
		if not eof(f) then begin
			readln(f, ant);
			readln(f, act);
			i:=i+2;
			uElem.CrearElem(ant, o);
			uElem.CrearElem(act, d1);
			uGrafos.InsertarOrigen(o, g);
			uGrafos.InsertarDestino(d1, o, g);
		end;
		while not eof(f) do begin
			readln(f, pos);
			i:=i+1;
			uElem.CrearElem(act, o);
			uElem.CrearElem(ant, d1);
			uElem.CrearElem(pos, d2);
			uGrafos.InsertarOrigen(o, g);
			uGrafos.InsertarDestino(d1, o, g); // el 0 es pq el grafo esta implementado con pesos
			uGrafos.InsertarDestino(d2, o, g);
			ant:=act;
			act:=pos;
		end;
		uElem.CrearElem(act, o);
		uElem.CrearElem(ant, d1);
		uGrafos.InsertarOrigen(o, g);
		uGrafos.InsertarDestino(d1, o, g);
		close(f);
		writeln(i);
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
	CrearListaVacia(l);
	RecorridoAnchura(g, 'La Elipa', l);
	RecorridoProfundidad(g, 'La Elipa', l2);
	//Camino('Conservatorio', 'Sol', g, l);
	uLista.ImprimirLista(l);
	writeln('*******');
	uLista.ImprimirLista(l2);
	//writeln(uLista.Longitud(l));
	//writeln(Tamano(g));

end.
