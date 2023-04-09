{Se cuenta con un archivo de productos de una cadena de venta de alimentos congelados.
De cada producto se almacena: código del producto, nombre, descripción, stock disponible,
stock mínimo y precio del producto.
Se recibe diariamente un archivo detalle de cada una de las 30 sucursales de la cadena. Se
debe realizar el procedimiento que recibe los 30 detalles y actualiza el stock del archivo
maestro. La información que se recibe en los detalles es: código de producto y cantidad
vendida. Además, se deberá informar en un archivo de texto: nombre de producto,
descripción, stock disponible y precio de aquellos productos que tengan stock disponible por
debajo del stock mínimo.
Nota: todos los archivos se encuentran ordenados por código de productos. En cada detalle
puede venir 0 o N registros de un determinado producto.}



program punto3;
const
	valorAlto=99999;
type
	producto=record
		cod:integer;
		nombre:string;
		descripcion:string;
		stockDispo:integer;
		stockMin:integer;
		precio:real;
	end;
	
	regDetalle=record
		cod:integer;
		cant:integer;
	end;
	
	archivo_detalle=file of regDetalle;
	
	archivo_maestro=file of producto;
	
	vectorDetalle=array[1..30]of archivo_detalle;
	
	
	
	
	
procedure leer(var detalle:archivo_detalle; var min:regDetalle);
begin
	if(not(eof(detalle)))then begin
		read(detalle,min);
	else
		min.cod:=valorAlto;
end;
end;
	
procedure CalcularMin(var vec:vectorDetalle, var min:regDetalle);
var
	aux:regDetelle;
begin
	min.cod:=valorAlto;
	for i:=1 to 30 do begin
		reset(vec[i]);//esto aca no va
		leer(vec[i],aux);
		if(aux.cod<min.cod)then begin
			min.cod:=aux.cod;
			min.cant:=aux.cant;
		end;
		else
			if(aux.cod<>valorAlto)then 
			seek(vec[i],filepos(vec[i])-1);
	end;
end;
			
		



procedure ActualizarMaestro(var maestro:archivo_maestro; var vec:vectorDetalle);
var
	min:regDetalle:
	regM:producto;
begin
	CalcularMin(vec,min);
	while(min.cod<>valorAlto)do begin
		read(maestro,regM);
		while(min.cod<>regM.cod)do 
			read(maestro,regM);
		while(min.cod=regM.cod)do begin
			regM.stockDispo:=regM.stockDispo - min.cant);
			CalcularMin(vec,min);
		end;
		seek(maestro,filepos(maestro)-1);
		write(maestro,regM);
	end;
	close(maestro);
end;



procedure AgregarTexto(dato:producto, var texto:Text);
begin
			writeln(texto,dato.cod,dato.nombre);
			writeln(texto,dato.stockAct,dato.stockMin,dato.descripcion);
end;


procedure Pasar_Texto(var maestro:archivo_productos)
var
	texto:Text;
	aux:producto;
begin
	assign(texto,'prodcutos.txt');
	rewrite(texto);
	reset(maestro);
	while(not(eof(maestro)))do begin
		read(maestro,aux);
		if(aux.stockAct<aux.stockMin)then begin
			AgregarTexto(aux,texto);
		end;
	end;
end;


		
		
		

