unit uDate;
interface
	uses dos;
	type
		TDate = RECORD
			day, month, year: integer;
		END;

	PROCEDURE Init(VAR f: TDate; d,m,y: integer);
	procedure Leer(var f: TDate);
	FUNCTION Day(f: TDate): integer;
	FUNCTION Month(f: TDate): integer;
	FUNCTION Year(f: TDate): integer;
	PROCEDURE Today(VAR f: TDate);
	procedure Mostrar(f: TDate);

	function Iguales(d1, d2:TDate):boolean;
	procedure Asignar(var d1:TDate; d2:TDate);

implementation

	procedure Init(var f: TDate; d,m,y: integer);
	begin
		f.day:= d;
		f.month:= m;
		f.year:= y
	end;

	procedure Leer(var f: TDate);
	begin
		write('   Enter a day:  ');
		readln(f.day);
		write('   Enter a month:  ');
		readln(f.month);
		write('   Enter a year:  ');
		readln(f.year);
	end;

	function Day(f: TDate): integer;
	begin
		Day:= f.day
	end;

	function Month(f: TDate): integer;
	begin
		Month:= f.month
	end;

	function Year(f: TDate): integer;
	begin
		Year:= f.year
	end;

	procedure Today(var f: TDate);
	var
		a,m,d,ds: Word;
		// en vez de word ponia integer
	begin
		getdate(a,m,d,ds);
		Init(f,d,m,a);
	end;

	procedure Mostrar(f: TDate);
	begin
		writeln(f.day,'/',f.month,'/',f.year);
	end;

	function Iguales(d1, d2:TDate):boolean;
	begin
		Iguales:= (d1.day = d2.day)
				and (d1.month = d2.month)
				and (d1.year = d2.year);
	end;

	procedure Asignar(var d1:TDate; d2:TDate);
	begin
		d1.day:=d2.day;
		d1.month:=d2.month;
		d1.year:=d2.year;
	end;
end.
