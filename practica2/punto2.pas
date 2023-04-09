program punto2;
const
	valorAlto=9999;
type
	alumno=record
		nombre:string;
		apellido:string;
		conFinal:integer;
		sinFinal:integer;
		cod:integer;
	end;
	
	regDetalle=record
		codigo:integer;
		conFinal:boolean;
	end;
	
	
	

procedure leer(var deta:Text; var reg:regDetalle);
begin
	if(not(eof(deta)))then 
		readln(deta,reg.codigo,reg.conFinal)
	else
		reg.codigo:=valorAlto;
end;

procedure ActualizarMaestro;
var
	maestro,detalle:Text;
	regM:alumno;
	regD:regDetalle;
	conF,sinF,aux:integer;
begin
	assign(maestro,'maestro.txt');
	assign(detalle,'detalle.txt');
	
	reset(maestro);
	reset(detalle);
	
	leer(detalle,regD);
	while(regD.codigo<>valorAlto)do begin
		//primero proceso todos los datos del detalle q apuntan a un mismo prod;
		aux:=regD.codigo;
		conF:=0;
		sinF:=0;
		while(aux=regD.codigo)then 
		begin
			if(regD.conFinal)then
				conF:=conF+1;
			else
				sinF:=sinF + 1;
			leer(detalle,regD);
		end;
		//busco el codigo del detalle en el maestro
		readln(maestro,regM.cod,regM.conFinal,regM.sinFinal,regM.nombre);
		readln(maestro,regM.apellido);
		while(regM.cod<>regD.codigo)do begin
				readln(maestro,regM.cod,regM.conFinal,regM.sinFinal,regM.nombre);
		        readln(maestro,regM.apellido);
		end;
		//modifico el registro del maestro
		regM.conFinal:=regM.conFinal + conF;
		regM.sinFinal:=regM.sinFinal + sinF;
		//me reubico en el maestro para guardar el registro modificado
		seek(maestro,filepos(maestro)-1);
		writeln(maestro,regM.cod,regM.conFinal,regM.sinFinal,regM.nombre);
		writeln(maestro,regM.apellido);
		if(not(eof(maestro)))then begin
			readln(maestro,regM.cod,regM.conFinal,regM.sinFinal,regM.nombre);
		    readln(maestro,regM.apellido);
		  end;
	end;
	close(detalle);
	close(maestro);
end;

		
		
		
			
