program ordenacion4;

const
	dimF = 30;
type
	producto = record
		codProducto: integer;
		codRubro: 1..8;
		precio: real;
	end;
	
	productoTres = record //moduloC
		codProducto: integer;
		precio:real;
	end;	
	
	vProductos = array[1..8] of listaProductos;
	
	listaProductos = ^nodo;
	
	nodo = record
		dato: producto;
		sig: listaProductos;
	end;
	
	vRubroTres = array [1..dimF] of productoTres; //moduloC
	
	
procedure inicializarVector(var v:vProductos);
var
	i:integer;
begin
	for i:= 1 to 8 do
		v[i]:= nil;
end;	

procedure leerProducto(var p:producto);
begin
	writeln('Ingrese el precio del producto'); readln(p.precio);
	if(p.precio <> 0) then begin
		writeln('Ingrese el codigo del producto'); readln(p.codProducto);
		writeln('Ingrese el precio del producto'); readln(p.codRubro);
	end;
	writeln('PRODUCTO LEIDO'); writeln('------------------');	
end;

procedure insertarOrdenado(var l:listaProductos; p:producto);
var
	nuevo:listaProductos; act: listaProductos; ant: listaProductos;
begin
	new(nuevo); nuevo^.dato := p; nuevo^.sig:= nil;
	if(l = nil) then
		l:= nuevo;
	else begin
		act:= l; ant:= l;
		while(act <> nil) and (act^.dato.codProducto > nuevo^.dato.codProducto) do begin
			ant:= act;
			act:= act^.sig;
		end;
		
		if(act = l) then begin
			nuevo^.sig := l;
			l:= nuevo;
		end	
		else begin
			ant^.sig:= nuevo;
			nuevo^.sig:= act;
		end;
	end;		
end;

procedure cargarVector(var v:vProductos);
var
	p:producto; codRubro: 1..8; l:listaProductos;
begin
	writeln('LECTURA DE PRODUCTOS'); writeln('----------');
	leerProducto(p);
	while(p.precio <> 0) do begin
		codRubro:= p.codRubro;
		l:= v[codRubro];
		insertarOrdenado(l,p);
		v[codRubro]:= l;
		leerProducto(p);
	end;

end;

procedure recorrerLista(l: listaProductos);
var

begin
	while(l <> nil) do begin
		writeln('Producto de codigo ', l^.dato.codProducto, ', de precio ', l^.dato.precio);
		writeln('PRODUCTO IMPRESO'); writeln('--------------');
		l:= l^.sig;
	end;
	

end;

procedure imprimirVector(v:vProductos);
var
	i:= integer; l:listaProductos;
begin
	for i:= 1 to 8 do begin
		if(v[i] <> nil) then begin 
			writeln('IMPRESION DE PRODUCTOS DEL RUBRO ', i); writeln('---------------');
			l:= v[i];
			recorrerLista(l);
			writeln('TODOS LOS PRODUCTOS DEL RUBRO ', i, ' FUERON IMPRESOS');
		end;
	end;		
end;

procedure moduloC(l:listaProductos; var vR: vRubroTres; var dimL:integer);
begin
	while((dimL < 30) and (l <> nil)) do begin
		dimL:= dimL + 1;
		v[dimL].codProducto:= l^.dato.codProducto;
		v[dimL].precio:= l^.dato.precio;
		l:= l^.sig;
	end;	
end;

procedure moduloD(var vR:vRubroTres; dimL:integer);
var
	i,j,pos: integer; item:producto;
begin
	for i:= 1 to (dimL-1) do begin
		pos:= 1;
		for j:= i+1 to dimL do begin
			if(v[j].precio < v[pos].precio) then 
				pos:= j;
		end;
		item:= v[pos];
		v[pos]:= v[i];
		v[i]:= item;
	end;	
end;

procedure moduloEyF(vR: vRubroTres; dimL:integer); //SE PUEDE DIVIDIR REAL POR INTEGER?
var
	i:integer; acumulado: real; cont:real; promedio:real;
begin
	acumulado:= 0; cont:= 0;
	writeln('PRODUCTOS DEL RUBRO TRES'); writeln('-----------------------');
	for i:= 1 to dimL do begin
		writeln('El producto de codigo ', vR[i].codProducto, ' cuesta ', vR[i].precio, ' pesos');
		writeln('-----------------');
		acumulado:= acumulado + vR[i].precio;
		cont:= cont + 1;
	end;
	promedio:= acumulado/cont;
	writeln('EL PROMEDIO DE PRECIOS DE ESTE RUBRO ES DE ', promedio);
end;


var
	v:vProductos; rubroTres:listaProductos; vR: vRubroTres; dimL:integer;
begin
	inicializarVector(v);
	cargarVector(v);
	imprimirVector(v);
	rubroTres:= v[3]; dimL:= 0;
	moduloC(rubroTres,vR,dimL);
	moduloD(vR,dimL);
	moduloEyF(vR,dimL);
end.		


//CORREGIR
