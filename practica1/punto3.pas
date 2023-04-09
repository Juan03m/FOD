program punto3;
type
	empleado=record
		num:integer;
		apellido:string;
		nombre:string;
		edad:integer;
		dni:integer;
	end;
	
	archivo_empleados=file of empleado;

procedure leerEmpleado(var emple:empleado);
begin
	writeln('ingrese el apellido del empleado');
	readln(emple.apellido);
	if(emple.apellido<>'fin')then begin
		writeln('ingrese nombre del empleado');
		readln(emple.nombre);
		writeln('ingrese numero  de empleado');
		readln(emple.num);
		writeln('ingrese dni del empleado');
		readln(emple.dni);
		writeln('ingrese edad del empleado');
		readln(emple.edad);
	end;
end;


procedure CargarArchivo(var archi:archivo_empleados);
var
	e:empleado;
begin
	rewrite(archi);
	leerEmpleado(e);
	while(e.apellido<>'fin')do begin
		write(archi,e);
		leerEmpleado(e);
	end;
	close(archi);
end;



procedure NombreDeterminado(var archi:archivo_empleados);
var
	nombre,apellido:string;
	ok:boolean;
	emple:empleado;
begin
	ok:=false;
	writeln('ingrese nombre y apellido para la busqueda');
	readln(nombre);
	readln(apellido);
	reset(archi);
	while((not EOF(archi) and (ok=false)))do begin
		read(archi,emple);
		if((emple.nombre=nombre) and (emple.apellido=apellido)) then begin
			ok:=true;
			writeln('se encontro al usuario con el nombre',emple.nombre,'',emple.apellido);
		end;
	end;
	close(archi);
	if(ok=false)then
		writeln('no se encontro el empleado');
end;


procedure ImprimirTodos(var archi:archivo_empleados);
var
	emple:empleado;
begin
	reset(archi);
	
	while(not EOF(archi)) do begin
		read(archi,emple);
		writeln(emple.nombre,'  ',emple.apellido);
	end;
	
	close(archi);
end;
	

procedure Jubilados(var archi:archivo_empleados);
var
	emple:empleado;
begin
	reset(archi);
	
	while(not EOF(archi)) do begin
		read(archi,emple);
		if(emple.edad<70)then begin
			writeln(emple.nombre,'',emple.apellido,'',emple.edad);
		end;	
	end;
	close(archi);
end;

	


procedure Procesar (var archi:archivo_empleados);
var
	op:integer;
begin
	writeln('ingrese la opcion para imprimir');
	writeln('1   : mostrar por nombre o apellido');
	writeln('2  : todos los empleados');
	writeln('3 : empleados proximo a jubilarse');
	read(op);
	case op of
		1:NombreDeterminado(archi);
		2:ImprimirTodos(archi);
		3:Jubilados(archi);
	end;
end;



procedure AgregarDatos(var archi:archivo_empleados);
var
	emple:empleado;
	ok:boolean;
	op:integer;
begin
	ok:=false;
	reset(archi);
	seek(archi,fileSize(archi)-1);
	while(not ok)do begin
		leerEmpleado(emple);
		write(archi,emple);
		writeln('ingrese 1 para finalizar o 2 para agregar un nuevo empleado');
		readln(op);
		if(op=1)then
			ok:=true;
	end;
	close(archi);
end;

procedure ModificarEdad(var archi:archivo_empleados);
var
	dni:integer;
	actual:empleado;
begin
	reset(archi);
	writeln('ingrese el dni del empleado buscado');
	readln(dni);
	while(not EOF(archi))do begin
		read(archi,actual);
		if(actual.dni=dni)then begin
			writeln('ingrese la nueva edad del empleado');
			readln(actual.edad);
			seek(archi,filePos(archi)-1);
			write(archi,actual);
		end;
			
end;
end;

procedure Exportar(var carga:archivo_empleados; var nuevo:Text);
var
	nombrearch:string;
	emple:empleado;
begin
	writeln('ingrese el nombre del archivo de texto');
	Readln(nombrearch);
	
	assign(nuevo,nombrearch);
	reset(carga);
	rewrite(nuevo);
	while(not EOF(carga))do begin
		read(carga,emple);
		Write(nuevo,emple.nombre,'  ', emple.apellido,'   ',emple.num,'   ',emple.dni,'   ',emple.edad);
	end;
	close(carga);
	close(nuevo);
end;


	

	
	


var
	archi:archivo_empleados;
	nombre:string;
	op:integer;
	texto:Text;
begin
	randomize;
	writeln('ingrese nombre del archivo');
	readln(nombre);
	
	assign(archi,nombre);
	writeln('elija una opcion para continuar');
	writeln('1 para crear un nuevo archivo');
	writeln('2 para procesar un archivo existente');
	writeln('3 para agregar un nuevo dato al archivo');
	writeln('4 para exportar los datos a un archivo de texto');
	read(op);
	case op of
		1:CargarArchivo(archi);
		2:Procesar(archi);
		3:AgregarDatos(archi);
		4:Exportar(archi,texto);
	end;
end.

	
	
