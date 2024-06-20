program ordenacion1;

const
	dimF = 50;
type
	venta = record
		diaVenta: 0..31;
		codigoProducto: 1..15;
		cantidadVendida: 1..99;
	end;	
	
	vVentas = array [1..dimF] of venta;

procedure leerVenta(var a:venta);
begin
	writeln('Ingrese el dia de la venta'); readln(a.diaVenta);
	if(a.diaVenta <> 0) then begin
		randomize;
		a.codigoProducto:= random(15) + 1;
		writeln('Ingrese la cantidad vendida'); readln(a.cantidadVendida);
		writeln('VENTA LEIDA');writeln('-------------');
	end;
end;


procedure moduloA(var v:vVentas; var dimL:integer);
var
	a:venta;
begin
	leerVenta(a);
	while(a.diaVenta <> 0) and (dimL <= dimF) do begin
		dimL:= dimL + 1;
		v[dimL]:= a;
		leerVenta(a);
	end;
	writeln('----------'); writeln('FIN DE LECTURA DE VENTAS');	
end;

procedure moduloB(v:vVentas; dimL:integer);
var
	i:integer;
begin
	for i:= 1 to dimL do begin
		writeln('---------------------------'); writeln('SIGUIENTE VENTA'); 
		writeln('Venta numero ', i);
		writeln('La venta con codigo de producto ', v[i].codigoProducto, ' y vendida el dia ', v[i].diaVenta, ' del presente mes, vendio ', v[i].cantidadVendida, ' de unidades');
	end;
	writeln('TODAS LAS VENTAS HAN SIDO LEIDAS');
end;

procedure moduloC(var v:vVentas; dimL:integer);
var
	i,j,pos: integer; item:venta;
begin
	for i:= 1 to dimL-1 do begin
		pos:= i;
		for j:= i + 1 to dimL do 
			if(v[j].codigoProducto < v[pos].codigoProducto) then pos:= j;
		
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;		
end;


procedure busqueda(v:vVentas; dimL: integer; valor1,valor2:1..15 ; var cont: integer; var pos1: integer);
var
	pos:integer; 
begin
	pos:= 1;
	while((pos <= dimL) and(v[pos].codigoProducto < valor1)) do 
		pos:= pos + 1;
		pos1:= pos1 + 1;
	if(pos <= dimL) then
			cont:= cont + 1;
	while((pos <= dimL) and (v[pos].codigoProducto < valor2)) do begin
		pos:= pos + 1;
		cont:= cont + 1;
	end;
	
	if((pos <= dimL) then begin
		if(v[pos].codigoProducto = valor2) then
			cont:= cont + 1;
	end;	
end;

procedure eliminarElementos(var v:vVentas; var dimL:integer; cont:integer; pos1:integer);
var
	i:integer;
begin
	for i:= 1 to cont do begin
		for j:= pos1 to (dimL-1) do 
			v[i]:= v[i + 1];
		dimL:= dimL - 1;
	end;		
		


end;

procedure moduloE(var v:Ventas; var dimL:integer);
var
	valor1,valor2: 1..15; 
	i,cont,pos1,pos2: integer;
begin
	writeln('-----------'); writeln('Ingrese los codigos de producto entre los cuales quiere eliminar las ventas');
	readln(valor1); readln(valor2);
	pos1:= 1; 
	busqueda(v,dimL,valor1,valor2,cont,pos1);
	eliminarElementos(v,dimL, cont,pos1,pos2);
	writeln('---------------'); writeln('ESTRUCTURA DE DATOS MODIFICADA');
end;

var
	v: vVentas; dimL:integer;
begin
	dimL:= 0;
	moduloA(v,dimL);
	moduloB(v,dimL);
	moduloC(v,dimL);
	moduloB(v,dimL); //volver a usar para testeo
	moduloE(v,dimL);
	moduloB(v,dimL)
end.
