program main;
uses uArbinBus, uElem, uLista;

var

	a:tArbinBus;
	h:string;
	e:tElem;

	procedure CargarHashtags(fichero:string; var a:tArbinBus);
	var
		f:text;
		linea:string;
		e:tElem;
	begin
		assign(f,fichero);
		reset(f);
		uArbinBus.CrearArbolVacio(a);
		while not eof(f) do begin
			readln(f, linea);
			uElem.CrearNodo(linea, e);
			uArbinBus.Insertar(e, a);
		end;
		close(f);
	end;

	procedure CargarTweets(fichero:string; var a:tArbinBus);
	var
		f:text;
		linea, hashtag:string;
		e:tElem;
		listaHashtags:tLista;
	begin
		assign(f,fichero);
		reset(f);
		while not eof(f) do begin
			readln(f, linea);
			uElem.BuscarHashtagsEnTwit(linea, listaHashtags);
			while (not EsVacia(listaHashtags)) do begin
				PrimerElemento(listaHashtags, hashtag);
				CrearNodo(hashtag, e);
				//writeln(hashtag);
				//uArbinBus.BuscarElemento(hashtag, a, e);
				//writeln(uArbinBus.Pertenece(e, a));
				//uElem.SetTweet(linea, e);
				//ImprimirElem(e);
				uArbinBus.AnadirTwitNodo(hashtag, linea, a);
				//uArbinBus.BuscarElemento(hashtag, a, e);
				//ImprimirElem(e);
				//writeln('----------------');
				//ImprimirLista(listaHashtags);
				uLista.Resto(listaHashtags, listaHashtags);
			end;
		end;
		close(f);
	end;

begin
	CargarHashtags('hashtags.txt', a);
	CargarTweets('tweets.txt', a);
	repeat
		readln(h);
		BuscarElemento(h, a, e);
		writeln(uArbinBus.Pertenece(e,a));
		uElem.ImprimirElem(e);
		CrearNodo('', e);
	until h = 'exit';

end.
