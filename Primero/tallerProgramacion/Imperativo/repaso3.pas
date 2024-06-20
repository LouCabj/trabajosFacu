program repaso3;

type

	producto = record
		codigo: integer;
		rubro: 1..10;
		stock: integer;
		precioUnitario: real;
	end;
	
	datosArbol = record
		codigo: integer;
		stock: integer;
		precioUnitario: real;
	end;	
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:datosArbol;
		HI: arbol;
		HD: arbol;
	end;	
	
	vector = array[1..10] of arbol;	
	
	datoVectorDos = record
		codigo: integer;
		stock: integer;
	end;	

	vectorDos = array[1..10] of datoVectorDos;
	
	vectorTres = array[1..10] of integer;


procedure inicializarVector(var v:vector; var v2:vectorDos; var v3:vectorTres);
var
	i:integer;
begin
	for i:= 1 to 10 do begin
		v[i]:= nil;
		v2[i].codigo := 0;
		v2[i].stock := 0;
		v3[i]:= 0;
	end;	
end;	

procedure leerProducto(var p:producto);
begin
	readln(p.codigo);
	if(p.codigo <> -1) then begin
		readln(p.rubro);
		readln(p.stock);
		readln(p.precioUnitario);
	end;	
end;

procedure agregar(var a:arbol ; p:producto);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codigo := p.codigo; a^.dato.precioUnitario := p.precioUnitario; a^.dato.stock := p.stock;
		a^.HI := nil; a^.HD := nil;
	end
	else begin
		if(p.codigo <= a^.dato.codigo) then 
			agregar(a^.HI, p)
		else
			agregar(a^.HD, p)
	end;


end;


procedure cargarVector(var v:vector);
var
	p: producto;
begin
	leerProducto(p);
	while(p.codigo <> -1) do begin
		agregar(v[p.rubro], p);
		leerProducto(p);
	end;	
end;	


function busqueda(a:arbol; codigo:integer):boolean;
begin
	if(a = nil) then
		busqueda := false
	else begin
		if(codigo = a^.dato.codigo) then
			busqueda := true
		else begin
			if(codigo <= a^.dato.codigo) then
				busqueda(a^.HI,codigo)
			else
				busqueda(a^.HD,codigo)
		end;
	end;			
end;

function moduloB(v:vector; rubro:integer; codigo:integer):boolean;
begin
	moduloB:= busqueda(v[rubro], codigo);
end;

procedure maximo(a:arbol; var codigo:integer;  var stock:integer);
begin
	if(a <> nil) then begin
		maximo(a^.HD, codigo, stock);
		if(a^.dato.codigo >= codigo) then begin
			codigo:= a^.dato.codigo;
			stock:= a^.dato.stock;
		end;
	end;		
end;

procedure moduloC(v: vector; var v2: vectorDos);
var
	i: integer; codigo: integer; stock:integer;
begin
	for i:= 1 to 10 do begin
		codigo:= -1; stock:= -1;
		maximo(v[i],codigo,stock);
		v2[i].codigo := codigo;
		v2[i].stock := stock;
	end;	
end;

procedure rango(a:arbol; codUno: integer; codDos: integer; var cant: integer);
begin
	if(codUno >= a^.dato.codigo) then
		rango(a^.HD,codUno,codDos,cant)
	else begin 
		if(codDos <= a^.dato.codigo) then 
			rango(a^.HI,codUno,codDos,cant)
		else begin
			cant:= cant + 1;
			rango(a^.HD,codUno,codDos,cant);
			rango(a^.HI, codUno,codDos,cant);
		end;
	end;		
end;

procedure moduloD(v: vector; var v3:vectorTres; codUno: integer; codDos: integer);
var
	i:integer; cant: integer;
begin
	for i:= 1 to 10 do begin
		cant:= 0;
		rango(v[i],codUno,codDos,cant);
		v3[i] := cant;

	end;
end;	

var
	v: vector; rubro: integer; codigo: integer;
	v2:vectorDos; v3: vectorTres; codUno: integer; codDos: integer;
begin
	inicializarVector(v,v2,v3);
	cargarVector(v);
	readln(rubro); readln(codigo);
	moduloB(v, rubro, codigo);
	moduloC(v,v2);
	//modulo D
	readln(codUno); readln(codDos);
	moduloD(v,v3,codUno,codDos);



end.	
