program Practica1_1;
type
	archivo_enteros=file of integer;

var
	enteros:archivo_enteros;
	nombre:string;
	numero:integer;
begin
	writeln('ingrese el nombre del archivo');
	readln(nombre);
	
	assign(enteros,nombre);
	rewrite(enteros);
	
	writeln('ingrese un numero o 3000 para terminar la carga');
	read(numero);
	while(numero<>3000)do begin
		write(enteros,numero);
		writeln('ingrese un numero o 3000 para terminar la carga');
		read(numero);
	end;
	close(enteros);
end.
	
