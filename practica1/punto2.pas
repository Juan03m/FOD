program punto2;
type
	archivo=file of integer;
var
	enteros:archivo;
	nombre:string;
	num:integer;
	prom:integer;
	suma,menores,cant:integer;
begin
	menores:=0;
	suma:=0;
	cant:=0;
	writeln('ingrese nombre fisico');
	readln(nombre);
	
	
	assign(enteros,nombre);
	reset(enteros);
	while( not EOF(enteros))do begin
		cant:=cant + 1;
		read(enteros,num);
		suma:=suma + num;
		if(num<1500)then
			menores:=menores + 1;
		writeln(num);
	end;
	close(enteros);
	prom:=suma DIV cant;
	writeln('la cantidad de numeros menores que 1500 son',':',menores);
	writeln('el promedio de los numeros ingresados es de',':',prom);
	end.
