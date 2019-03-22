PROGRAM practica5;
USES uPila;
VAR
	s1:string;
	bool:boolean;
	function EsPalindroma(cadena:string):boolean;
	VAR
		i:integer;
		c, c1, c2:char;
		p1, p2, pAux:tPila;
		iguales:boolean;
	begin
		CrearPilaVacia(p1);
		CrearPilaVacia(p2);
		CrearPilaVacia(pAux);
		iguales:=true;
		for i:=1 to Length(cadena) do begin
			if(cadena[i] <> ' ') then
				Apilar(cadena[i], p1);
		end;

		Copiar(p1, pAux);

		while not EsVacia(pAux) do begin
			Cima(c, pAux);
			Apilar(c, p2);
			Desapilar(pAux);
		end;

		while(iguales = true) and ((not EsVacia(p1)) or (not EsVacia(p2))) do begin
			Cima(c1, p1);
			Cima(c2, p2);
			iguales:= c1 = c2;
			Desapilar(p1);
			Desapilar(p2);
		end;
		EsPalindroma:=iguales;
	end;

begin
	writeln('Inserte la frase: ');
	readln(s1);
	bool:=EsPalindroma(s1);
	if EsPalindroma(s1) then
		writeln('La frase es palindroma.')
	else
		writeln('La frase no es palindroma.')

end.
