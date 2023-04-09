program pp;
type
	novela=record
		codigo:integer;
		nombre:string;
		genero:string;
		precio:integer;
	end;
	
	archivo_novelas= file of novela;
	
	
	
procedure LeerNovela(var n:novela);
begin
		writeln('ingrese nombre de la novela');
		readln(n.nombre);
		if(n.nombre<>'fin')then begin
			writeln('ingrese codigo de la novela');
			readln(n.codigo);
			writeln('ingrese el genero de la novela');
			readln(n.genero);
			writeln('ingrese el precio');
			readln(n.precio);
		end;
end;

	
procedure ArmarTexto();
var
	texto:Text;
	n:novela;
begin
	assign(texto,'novelas.txt');
	rewrite(texto);
	
	LeerNovela(n);
	while(n.nombre<>'fin')do begin
		writeln(texto,n.codigo,'  ',n.precio,'  ',n.genero,'  ');
		writeln(texto,n.nombre);
		LeerNovela(n);
	end;
	close(texto);
end;



procedure Carga();
var
	carga:Text;
	nuevo:archivo_novelas;
	n:novela;
begin
	assign(carga,'novelas.txt');
	assign(nuevo,'novelas.dat');
	
	reset(carga);
	rewrite(nuevo);
	
	while(not eof(carga))do begin
		readln(carga,n.codigo,n.precio,n.genero);
		readln(carga,n.nombre);
		write(nuevo,n);
	end;
	close(carga);
	close(nuevo);
end;



var
	op:integer;
begin
	writeln('ingrese una opcion para continuar');
	writeln('1 para armar el archivo de texto');
	writeln('2 para armar el binario apartir del archivo de texto');
	readln(op);
	
	case op of
		1:ArmarTexto;
		2:Carga;
	end;
	
	
end.
	
	
	

