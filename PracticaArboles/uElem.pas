unit uElem;
interface
	uses uLista, sysutils;
	type
		tElem = RECORD {cambiar "integer" por el tipo deseado}
			hashtag:string;
			listaTweets:tLista;
		end;

	function Equals(e1, e2:tElem):boolean;
	procedure Asignar(VAR eNuevo:tElem; eOriginal:tElem);
	//procedure Mostrar(e:tElem);
	//procedure Leer(VAR e:tElem);
	function Minimo(e1, e2:tElem):tElem;
	function EsMayor(e1, e2:tElem):boolean;
	function EsMenor(e1, e2:tElem):boolean;
	procedure Hashtag(e:tElem; var hashtag:string);
	procedure CrearNodo(hashtag:string; var e:tElem);
	procedure SetTweet(s:string; var e:tElem);
	procedure BuscarHashtagsEnTwit(t:string; var listaHashtags:tLista);
	procedure ImprimirElem(e:tElem);

implementation

		procedure CrearNodo(hashtag:string; var e:tElem);
		begin
			e.hashtag:=hashtag;
			CrearListaVacia(e.listaTweets);
		end;

		function Equals(e1, e2:tElem):boolean;
		begin
			Equals:= (e1.hashtag = e2.hashtag) and (SonIguales(e1.listaTweets, e2.listaTweets));
		end;

		procedure Asignar(VAR eNuevo:tElem; eOriginal:tElem);
		begin
			eNuevo.hashtag:=eOriginal.hashtag;
			CrearListaVacia(eNuevo.listaTweets);
			uLista.Copiar(eOriginal.listaTweets, eNuevo.listaTweets);
		end;

		procedure SetTweet(s:string; var e:tElem);
		begin
			ConstruirLista(s, e.listaTweets);
		end;

(*
		procedure Mostrar(e:tElem);
		begin
			writeln(e);
		end;

		procedure Leer(VAR e:tElem);
		begin
			readln(e);
		end;
*)
		function Minimo(e1, e2:tElem):tElem;
		begin
			if EsMenor(e1,e2) then
				Minimo:=e1
			else if EsMenor(e2,e1) then
				Minimo:=e2
			else
				Minimo:=e1;
		end;

		function EsMayor(e1, e2:tElem):boolean;
		var
			i:integer;
		begin
			i:=ansicomparetext(e1.hashtag, e2.hashtag);
			EsMayor:= (i > 0);
		end;

		function EsMenor(e1, e2:tElem):boolean;
		var
			i:integer;
		begin
			i:=ansicomparetext(e1.hashtag, e2.hashtag);
			EsMenor:= (i < 0);
		end;

		procedure Hashtag(e:tElem; var hashtag:string);
		begin
			hashtag:=e.hashtag;
		end;

		procedure BuscarHashtagsEnTwit(t:string; var listaHashtags:tLista);
		var
			i:integer;
			s:string;
		begin
			i:=1;
			CrearListaVacia(listaHashtags);
			while (i < Length(t)) do begin
				s:='';
				while (t[i] <> '#') and (i < Length(t)) do
					i:=i+1;
				while (((t[i] <> ' ') and (t[i] <> '.')) and (i < Length(t))) do begin
					s:= s + t[i];
					i:=i+1;
				end;
				if not (s = '') then
					ConstruirLista(s, listaHashtags);
			end;
			//ImprimirLista(listaHashtags);
			//writeln('--------------------------------------------------');
		end;

		procedure ImprimirElem(e:tElem);
		begin
			writeln('---------------------------------------------------');
			writeln('* HASHTAG: ', e.hashtag);
			writeln('* LISTA TWITS:');
			uLista.ImprimirLista(e.listaTweets);
			writeln('---------------------------------------------------');
		end;

end.
