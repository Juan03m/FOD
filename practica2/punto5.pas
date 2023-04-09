program punto5;
const
	valorAlto=9999;
	dimF=50;
type
	detallada=record
		calle:string;
		nro:integer;
		piso:string;
		depto:integer;
		ciudad:string;
	end;
	
		datos=record
			nombre:string;
			apellido:string;
			dni:integer;
		end;
		
	regNacimientos=record
		nro_partida:integer;
		nacimiento:integer;
		nombre:string;
		apellido:string;
		direccion:detellada;
		matricula:integer;
		padre:datos;
		madre:datos;
	end;
	
	regFallecimientos=record
		nro_partida:integer;
		fallecido:datos;
		matricula:integer;
		fechaHora:string;
		lugar:string;
	end;
	
	
	
	regMaestro=record
		nro_partida:integer;
		nombre:string;
		apellido:string;
		direccion:detallada;
		matricula:integer;
		madre:datos;
		padre:datos;
		deceso:integer
		fechaHora:string;
		lugar:string;
	end;
	

	archivo_nacimientos=file of regNacimientos;
	archivo_fallecidos=file of regFallecimiento;
	arhivo_maestro=file of regMaestro;
	
	vector_nacimientos=array[1..dimF]of archivo_nacimientos;
	vector_fallecidos=array[1..dimF]of archivo_fallecidos;
	vector_regNacimientos[1..dimF]of regNacimientos;
	vector_regFallecidos[1..dimF]of regFallecidos;
	
	
		
procedure leerNacimiento(var nacimiento:archivo_nacimiento; var dato:regNacimiento);
begin
	if(not(eof(nacimiento)))then
		read(nacimiento,dato);
	else
		dato.nropartida:=valorAlto;
end;



procedure leerFallecidos(var archivo:archivo_fallecido; var dato:regFallecidos);
begin
	if(not(eof(archivo)))then 
		read(fallecidos,dato);
	else
		dato.nro_partida:=valorAlto;
end;


procedure minimoNacimientos(var vec:vector_nacimientos;var registros:vector_regNacimientos;  var min:regNacimientos);
var
i,posMin:integer;
begin
	min.nro_partida:=valorAlto;
	for i:=1 to dimF do begin
		if(registros[i].nro_partida<min.nro_partida)then begin
			min:=registros[i]:
			posMin:=i;
		end;
	end;
	if(min.nro_partida<>valorAlto)then
		leerNacimiento(vec[posMin];registros[posMin]);
end;


procedure minimoFallecidos(var vec:vector_fallecidos;var registros:vector_regFallecidos;  var min:regFallecidos);
var
i,posMin:integer;
begin
	min.nro_partida:=valorAlto;
	for i:=1 to dimF do begin
		if(registros[i].nro_partida<min.nro_partida)then begin
			min:=registros[i]:
			posMin:=i;
		end;
	end;
	if(min.nro_partida<>valorAlto)then
		leerFallecidos(vec[posMin];registros[posMin]);
end;



procedure crearMaestro2(var maestro:archivo_maestro; var vecNacimientos:vector_nacimientos; var vecFallecidos:vector_fallecidos; var fallecidos:regFallecidos; var nacimientos:regNacimientos);
var
minN:regNacimientos:
minF:regFallecidos;
actual:regMaestro;
begin
	minimoNacimientos(vecNacimientos,nacimientos,minN);
	minimoFallecidos(vecFallecidos,fallecidos,minF);
	while(minN.nro_partida<>valorAlto)do begin
		actual.nro_parida:=minN.nro_partida;
		actual.nombre:=minN.nombre;
		actual.apelldio:=minN.apellido;
		actual.direccion:=minN.direccion;
		actual.matricula:=minN.matricula;
		actual.madre:=minN.madre;
		actual.padre:=minN.padre;
		if(minF.nro_partida=minN.nro_partida)then begin
			actual.deceso:=minF.matricula;
			actual.fechaHora:=minF.fechaHora;
			actual.lugar:=minF.lugar;
		end;
		write(maestro,actual);
		minimoNacimientos(vecNacimientos,nacimientos,minN);
		minimoFallecidos(vecFallecidos,fallecidos,minF);
	end;
end;





var
	maestro:archivo_maestro;
	vecNacimientos:vector_nacimientos;
	vecFallecidos:vector_fallecidos;
	fallecidos:vector_regFallecidos;
	nacimientos:vector_regNacimientos;
	i:integer:
	nombreArchivo:string;
begin
	assign(maestro,'maestro.dat');
	rewrite(maestro);
	
	for i:=1 to dimF do begin
		readln(nombreArchivo);
		readln(nombreArchivo2)
		assign(vecNacimientos[i],nombreArchivo);
		assign(vecFallecidos[i],nombreArchivo2);
		reset(vecFallecidos[i]);
		reset(vecNacimientos[i]);
		leerNacimiento(vecNacimientos[i],nacimiento[i]);
		leerFallecidos(vecFallecidos[i],fallecidos[i]);
		close(vecFallecidos[i];
		close(vecNacimientos[i];
	end;
	crearMaestro2(maestro,vecNacimientos,vecFallecidos,fallecidos,nacimientos);
	close(maestro);
end.
		
	
		


		
	
	
		
