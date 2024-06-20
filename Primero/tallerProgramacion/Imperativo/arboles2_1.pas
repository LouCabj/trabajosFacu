program arboles4;

type

	venta = record
		codVenta: integer;
		codProductoVendido: integer;
		cantidadUnidadesVendidas: integer;
		precioUnitario: real;
	end;
	
	producto = record
		codProducto: integer;
		cantUnidadesVendidas: integer;
		montoTotal: real;
	end;
	
	arbol = ^nodo;
	
	nodo = record
		dato: producto;
		HI: arbol;
		HD: arbol;
	end;


procedure leerVenta(var v:venta);
begin
	writeln('Ingrese el codigo de venta'); readln(v.codVenta);
	if(v.codVenta <> -1) then begin
		writeln('Ingrese el codigo de producto vendido'); readln(v.codProductoVendido);
		writeln('Ingrese la cantidad de unidades vendidas'); readln(v.cantidadUnidadesVendidas);
		writeln('Ingrese el precio unitario'); readln(v.precioUnitario);
	end;
	writeln('VENTA LEIDA'); writeln('----------------');	

end;

procedure agregar(var a:arbol; v:venta);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codProducto := v.codProductoVendido;
		a^.dato.cantUnidadesVendidas:= v.cantidadUnidadesVendidas;
		a^.dato.montoTotal := (v.cantidadUnidadesVendidas * v.precioUnitario);
	end	
	else begin
		if(a^.dato.codProducto = v.codProductoVendido) then begin
			a^.dato.cantUnidadesVendidas := a^.dato.cantUnidadesVendidas + v.cantidadUnidadesVendidas;
			a^.dato.montoTotal := a^.dato.montoTotal + (v.cantidadUnidadesVendidas * v.precioUnitario);
		end
		else begin
			if(a^.dato.codProducto < v.codProductoVendido) then
				agregar(a^.HD,v)
			else
				agregar(a^.HI,v)
		end;		
	end;	

end;

procedure cargarArbol(var a:arbol);
var
	v:venta;
begin
	writeln('Lectura de ventas/productos'); writeln('----------------');
	leerVenta(v);
	while(v.codVenta <> -1) do begin
		agregar(a,v);
		leerVenta(v);
	end;
	writeln('VENTAS LEIDAS, FIN DEL PROGRAMA');	
end;

procedure imprimirArbol(a:arbol);
begin
	if(a <> nil) then begin
		imprimirArbol(a^.HI);
		writeln('Producto de codigo ', a^.dato.codProducto);
		writeln('Ha vendido una cantidad de ', a^.dato.cantUnidadesVendidas);
		writeln('Dejando una ganancia de ', a^.dato.montoTotal:10:10);
		imprimirArbol(a^.HD);
	end;	 
end;
	
procedure moduloC(a:arbol; var cantUnidadesMax:integer; var codProductoMax:integer);
begin
	if(a <> nil) then begin
		moduloC(a^.HI,cantUnidadesMax,codProductoMax);
		if(a^.dato.cantUnidadesVendidas >= cantUnidadesMax) then begin
			codProductoMax := a^.dato.codProducto;
			cantUnidadesMax := a^.dato.cantUnidadesVendidas
		end;	
		moduloC(a^.HD,cantUnidadesMax,codProductoMax)
	end;		
end;


procedure busqueda(a: arbol; var cant: integer);
begin
	if(a <> nil) then begin
		busqueda(a^.HI, cant);
		cant:= cant + 1;
		busqueda(a^.HD, cant);
	end;	
end;

procedure moduloD(a:arbol; codProducto:integer;  var cant: integer);	
begin
	if(a <> nil) then begin
		if(a^.dato.codProducto = codProducto) then
			busqueda(a^.HI,cant)
		else
			if(codProducto < a^.dato.codProducto) then 
				moduloD(a^.HI,codProducto,cant)
			else begin
				cant:= cant + 1;
				busqueda(a^.HI,cant);
				moduloD(a^.HD,codProducto,cant)
			end;	
	end;					
end;	

procedure moduloE(a:arbol; codUno: integer; codDos:integer; var montoTotal:real);
begin
	if(a <> nil) then begin
		if(a^.dato.codProducto <= codUno) then
			moduloE(a^.HD,codUno,codDos,montoTotal)
		else
			if(a^.dato.codProducto >= codDos) then
				moduloE(a^.HI, codUno,codDos, montoTotal)
			else begin
				if(a^.dato.codProducto > codUno) and (a^.dato.codProducto < codDos) then begin
					montoTotal:= montoTotal + a^.dato.montoTotal;
					moduloE(a^.HD,codUno,codDos,montoTotal);
					moduloE(a^.HI,codUno,codDos,montoTotal);
				end
			end;	

	end;
end;

var
	a: arbol; cantUnidadesMax: integer; codProductoMax:integer; cant:integer; codProducto:integer;
	codUno: integer; codDos:integer; montoTotal: real;
begin
	cargarArbol(a);
	writeln('IMPRIMIENDO ARBOL'); writeln('---------------');
//	imprimirArbol(a);
	cantUnidadesMax:= -1;
	moduloC(a,cantUnidadesMax, codProductoMax);
	writeln('El codigo del producto que mas vendio es el ', codProductoMax);
	writeln('-------------');
	cant:= 0; readln(codProducto);  moduloD(a,codProducto, cant);
	writeln('La cantidad de productos con codigo menor a ', codProducto,' son ', cant);
	writeln('-------------------');
	readln(codUno); readln(codDos); montoTotal:= 0; moduloE(a,codUno,codDos,montoTotal);
	writeln('El monto total de los productos que se encuentran entre los dos valores es ', montoTotal:10:10);

end.		
