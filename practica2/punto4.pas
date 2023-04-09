program punto4;
const
	valorAlto=9999;
type
	logs=record
		cod_usuario:integer;
		fecha:integer;
		tiempo_sesion:real;
	end;
	
	total=record
		cod_usuario:integer;
		fecha:string;
		tiempo_total:real;
	
	
	archivo_maestro=file of total;
	archivo_detalle=file of logs;
	
		vector_detalle=array[1..5]of archivo_detalle;
		vector_regDetalle=array[1..5]of logs;
		
	







procedure leer(var detalle:archivo_detalle,var dato:logs);
begin
	if(not(eof(detalle)))then
		read(detalle,dato);
	else
		dato.cod_usuario:=valorAlto;
end;
end;


procedure minimo(var vecDetalle:vector_detalle; var vecReg:vector_regDetalle; var min:logs)
var
	i,posMin:integer;
begin
	min.codigo_usuario:=valorAlto;
	min.fecha:=valorAlto;
	for i:=1 to 5 do begin
		if(vecReg[i].codigo_usuario<min.codigo_usuario)then begin
			if(vecReg[i].fecha<min.fecha)then begin
				min:=vecReg[i];
				posMin:=i;
			end;
		end;
	end;
	if(min.codigo_usuario<>valorAlto)then
		leer(vecDetalle[posMin],vecReg[posMin]);
		
end;


procedure crearMaestro(var maestro:archivo_maestro; var vecReg:vector_regDetalle; var vecDetalle:vector_detalle);
var
	min:logs;
	actual:total;
begin
	assign(maestro,'maestro.dat');
	rewrite(maestro);
	
	minimo(vecDetalle,vecReg,min);
	while(min.codigo_usario<>valorAlto)do begin
		actual.codigo_usuario:=min.codigo_usuario;
		while(actual.codigo_usuario=min.codigo_usuario)do begin
			actual.fecha:=min.fecha;
			actual.tiempo_total:=0;
			while(min.codigo<>valorAlto) and (actual.codigo_usuario=min.codigo_usuario) and (actual.fecha=min.fecha)do begin
				actual.tiempo_total:=actual.tiempo_total + min.tiempo_sesion;
				minimo(vecDetalle,vecReg,min);
			end;
		write(maestro,actual);
	end;
end;
close(maestro);
end;
	
	

var
	maestro:archivo_maestro;
	vectorDetalle:vector_detalle;
	vecReg:vector_regDetalle;
	i:integer;
	fisico:string;
begin
	for i:= 1 to 5 do begin
		writeln('ingrese nombre fisico del detalle',i);
		readln(fisico);
		assign(vectorDetalle[i],fisico);
		rewrite(vectorDetalle[i]);
		leer(vectorDetalle[i],vecReg[i]);
		close(vectorDetalle[i]);
	end;
	crearMaestro(maestro,vecReg,vectorDetalle);
end.




	


