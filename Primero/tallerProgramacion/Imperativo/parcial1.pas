program parcialUno;

type

	compra = record
		codVideojuego: integer;
		codCliente: integer;
		dia: 1..31;
		mes: 1..12;
	end;
	
	
	//LISTA DE LA ESTRUCTURA 1
	
	datosLista = record
		codVideojuego: integer;
		dia: 1..31;
		mes: 1..12;
	end;	
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: datosLista;
		sig:lista;
	end;
	
	//ESTRUCTURA 1	
	
	datosArbol = record
		codCliente: integer;
		listaArbol: lista;
	end;	
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: datosArbol;
		HI: arbol;
		HD: arbol;
	end;	


	//ESTRUCTURA 2
	
	datoListaVector = record
		dia: 1..31;
		codVideojuego: integer;
		codCliente: integer;
	end;	
	
	listaVector = ^nodoListaVector;
	
	nodoListaVector = record
		dato: datoListaVector;
		sig:listaVector;
	end;	
		
	
	vector = array[1..12] of listaVector;
	
	
procedure leerCompra(var c:compra);
begin
	c.codCliente := Random(100);
	if(c.codCliente <> 0) then begin
		c.mes:= Random(12) + 1;
		c.dia:= Random(31) + 1;
		c.codVideojuego:= Random(20000) + 1;
	end;	
end;	
	
procedure cargarVector(var l:listaVector; c:compra);
var
	nuevo: listaVector;
begin
	new(nuevo); nuevo^.dato.dia := c.dia;
	nuevo^.dato.codVideojuego:= c.codVideojuego; 
	nuevo^.dato.codCliente := c.codCliente;
	nuevo^.sig:= l;
	l:= nuevo;

end;	


procedure agregarAdelante(var l:lista; c:compra);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato.codVideojuego := c.codVideojuego;
	nuevo^.dato.dia:= c.dia;
	nuevo^.dato.mes := c.mes;
	nuevo^.sig:= l;
	l:= nuevo;

end;	


procedure agregarArbol(var a:arbol; c:compra);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codCliente := c.codCliente;
		agregarAdelante(a^.dato.listaArbol,c);
		a^.HI:= nil; a^.HD:= nil;
	end
	else begin
		if(c.codCliente = a^.dato.codCliente) then
			agregarAdelante(a^.dato.listaArbol, c)
		else begin
			if(c.codCliente > a^.dato.codCliente) then
				agregarArbol(a^.HD, c)
			else
				agregarArbol(a^.HI, c)
		end;
	end;			
end;	
	
procedure cargarEstructuras(var a:arbol; var v:vector);
var
	c:compra;
begin
	leerCompra(c);
	while(c.codCliente <> 0) do begin
		cargarVector(v[c.mes], c);
		agregarArbol(a,c);
		leerCompra(c);
	end;	
end;

procedure inicializarVector(var v:vector);
var
	i: integer;
begin
	for i:= 1 to 12 do 
		v[i]:= nil;

end;	


procedure cargarCompras(listaA: lista; var l:lista);
begin
	while(listaA <> nil) do begin
		agregarAdelante(l, listaA^.dato)
		listaA:= listaA^.sig;
	end;	
	
end;

procedure moduloB(a:arbol; codCliente:integer; var l:lista);
begin
	if(a <> nil) then begin
		if(codCliente = a^.dato.codCliente) then
			cargarCompras(a^.dato.listaArbol, l)
		else begin
			if(codCliente > a^.dato.codCliente) then
				moduloB(a^.HD, codCliente, l)
			else
				moduloB(a^.HI, codCliente, l)
		end;
	end;			

end;
	
	
var
	a:arbol; v:vector;
	l:lista;
begin
	inicializarVector(v);
	cargarEstructuras(a,v);
	//MODULO B;
	l:= nil; codCliente:= Random(100) + 1;
	moduloB(a,codCliente,l);


end.	
	
	
	
	
	
	
	
