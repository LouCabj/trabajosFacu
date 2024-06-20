program arboles2;

type

	venta = record
		codProducto: integer;
		fecha: 1..31;
		cantUnidadesVendidas: integer;
	end;
	
	producto = record
		codProducto: integer;
		cantUnidadesVendidas: integer;
	end;
	
	arbolDos = ^nodoDos;
	
	nodoDos = record
		dato: producto;
		HI: arbolDos;
		HD: arbolDos;
	end;	
	
	arbol = ^nodo;
	
	nodo = record
		dato: venta;
		HI: arbol;
		HD: arbol;
	end;
	


procedure agregar(var a:arbol; v:venta);
begin
	if(a = nil) then begin
		new(a);
		a^.dato:= v; a^.HD:= nil; a^.HI:= nil;
	end
	else begin
		if(v.codProducto <= a^.dato.codProducto) then
			agregar(a^.HI,v)
		else
			agregar(a^.HD,v)
	end;


end;

procedure agregarDos(var a:arbolDos; v:venta);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codProducto:= v.codProducto;
		a^.dato.cantUnidadesVendidas:= v.cantUnidadesVendidas;
		a^.HI:= nil;
		a^.HD:= nil;
	end
	else begin
		if(a^.dato.codProducto = v.codProducto) then
			a^.dato.cantUnidadesVendidas:= a^.dato.cantUnidadesVendidas + v.cantUnidadesVendidas
		else begin
			if(a^.dato.codProducto < v.codProducto) then
				agregarDos(a^.HI,v)
			else
				agregarDos(a^.HD,v)
		end;
	end;			
			
end;


procedure leerVenta(var v:venta);
begin
	writeln('Ingrese el cod de producto'); readln(v.codProducto);
	if(v.codProducto <> 0) then begin
		writeln('Ingrese la fecha'); readln(v.fecha);
		writeln('Ingrese la cantidad de unidades vendidas'); readln(v.cantUnidadesVendidas);
	end;
	writeln('VENTA LEIDA');	

end;

procedure cargarArboles(var a:arbol; var a2: arbolDos);
var
	v:venta; 
begin
	writeln('BIENVENIDO, INGRESE LOS DATOS DE LAS VENTAS'); writeln('-------------------');
	leerVenta(v);
	while(v.codProducto <> 0) do begin
		agregar(a,v);
		agregarDos(a2,v);
		leerVenta(v);
	end;	

end;

procedure recorrerPrimerArbol(a:arbol; c:integer; var cant:integer);  //Como el codigo de producto puede repetirse, tengo que recorrerlo todo?
begin
	if(a<>nil) then begin
		recorrerPrimerArbol(a^.HI,c,cant);
		if(a^.dato.codProducto = c) then
			cant:= cant + a^.dato.cantUnidadesVendidas;
		recorrerPrimerArbol(a^.HD,c,cant);
	end;		
end;

function recorrerSegundoArbol(a:arbolDos; c2:integer):integer;
begin
	if(a = nil) then
		recorrerSegundoArbol:= 0
	else begin	
		if(a^.dato.codProducto = c2) then
			recorrerSegundoArbol:= a^.dato.cantUnidadesVendidas
		else begin
			if(c2 > a^.dato.codProducto) then
				recorrerSegundoArbol(a^.HD,c2)
			else
				recorrerSegundoArbol(a^.HI,c2)
		end;		
	end;
end;

var
	a: arbol; a2:arbolDos; c:integer; c2: integer; cant:integer;
begin
	cargarArboles(a,a2);
	writeln('Bienvenido'); writeln('----------------');
	writeln('Ingrese el cod de producto'); readln(c);
	recorrerPrimerArbol(a,c,cant);
	writeln('El producto de codigo ', c, ' vendio ', cant, ' unidades');
	writeln('-----------------');
	writeln('Ingrese el cod de producto'); readln(c2);
	writeln('El prodcuto de codigo ', c2, ' vendio ', recorrerSegundoArbol(a2,c2), ' unidades');

end.	

