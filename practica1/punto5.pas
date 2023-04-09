program pepe;
type
	celular=record
		codigo:integer;
		nombre:string;
		desc:string;
		marca:string;
		precio:integer;
		stockMin:integer;
		stockAct:integer;
	end;
	
	archivo_celulares=file of celular;
	

procedure LeerCelular(var cel:celular);
begin
	writeln('ingrese el nombre del celular');
	readln(cel.nombre);
	if(cel.nombre<>'fin')then begin
		writeln('ingrese la marca del celular');
		readln(cel.marca);
		writeln('ingrese descripcion del celular');
		readln(cel.desc);
		cel.precio:=Random(1000);
		cel.stockMin:=Random(50);
		cel.stockAct:=Random(50);
		cel.codigo:=Random(30);
		
	end;
end;
	
	
procedure CargarTexto;
var
	cel:celular;
	archi:Text;
begin
	assign(archi,'celulares.txt');
	rewrite(archi);
	LeerCelular(cel);
	while(cel.nombre<>'fin')do begin
		writeln(archi,cel.codigo,'  ',cel.precio,'  ',cel.marca);
		writeln(archi,cel.stockAct,'   ',cel.stockMin,'   ',cel.desc);
		writeln(archi,cel.nombre);
		LeerCelular(cel);
	end;
	close(archi);
end;



procedure ArmarBinario;
var
	cel:celular;
	carga:Text;
	archi:archivo_celulares;
	nombre:string;
begin
	writeln('ingrese el nombre para el archivo binario');
	readln(nombre);
	assign(archi,nombre);
	assign(carga,'celulares.txt');
	reset(carga);
	rewrite(archi);
	while(not EOF(carga))do begin
		readln(carga,cel.codigo,cel.precio,cel.marca);
		readln(carga,cel.stockAct,cel.stockMin,cel.desc);
		readln(carga,cel.nombre);
		Write(archi,cel);
	end;
	close(archi);
	close(carga);
end;




var
	op:integer;
begin
	writeln('elija una opcion para continuar');
	writeln('1 para crear un archivo de texto con la informacion de los celulares');
	writeln('2 para exportar la informacion de un arch de texto a un archivo binario');
	readln(op);
	case op of
		1:CargarTexto;
		2:ArmarBinario;
	end;
	
end.
