program pruebaListas;
uses uLista, uElem;
var
	l1, l2, l3: tLista;
	n1,n2,n3,n4,n5,n6:TElem;
	i:integer;
	aux:integer;

	FUNCTION Subcadena (c1, c2:tLista):boolean;
	var
		aux1, aux2:tLista;
		e1, e2:tElem;
		i,j:integer;
	begin
		if not EsVacia(c1) and not EsVacia(c2) then begin
			i:=0;
			GetElemPos(c1, i, e1);
			GetElemPos(c2, 0, e2);
			while(e1 <> e2) and (i < Longitud(c1))do begin
				i:=i+1;
				GetElemPos(c1, i, e1);
			end;
			if e1 <> e2 then
				Subcadena:=false
			else begin
				j:=0;
				while (e1 = e2) and (j < Longitud(c2)-1) do begin
					i:=i+1;
					j:=j+1;
					GetElemPos(c1, i, e1);
					GetElemPos(c2, j, e2);
				end;
				if(e1 = e2)then
					Subcadena:=true
				else
					Subcadena:=false;
			end;
		end;
	end;




BEGIN


	n1:='a';
	n2:='b';
	n3:='c';
	n4:='b';
	n5:='u';
	CrearListaVacia(l1);
	CrearListaVacia(l2);
{
	ConstruirLista(n1, l1);
	ConstruirLista(n2, l1);
	ConstruirLista(n3, l1);

	ConstruirLista(n4, l2);
	ConstruirLista(n5, l2);
}
	InsertarFinal(n1,l1);
	InsertarFinal(n2,l1);
	InsertarFinal(n3,l1);
	InsertarFinal(n4,l1);
	InsertarFinal(n5,l1);
	InsertarFinal(n4,l2);
	InsertarFinal(n5,l2);


	InsertarFinal('z', l1);

	CrearListaVacia(l3);
	Concatenar(l1,l2, l3);

	Copiar(l1, l3);



	writeln('Subcadena: ', Subcadena(l1,l2));

	writeln('Lista 1');
	ImprimirLista(l1);
	writeln();
	writeln('Lista 2');
	ImprimirLista(l2);
	writeln;


	writeln('Lista 3');
	ImprimirLista(l3);

	writeln;
	writeln('GetElem:');
	GetElemPos(l1, 2, n6);
	writeln(n6);

	Destruir(l3);
	writeln('lista3');
	ImprimirLista(l3);

	readln;


END.
