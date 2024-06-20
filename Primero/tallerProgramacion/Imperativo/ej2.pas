program ejercicio;

type

	propiedadLectura = record
		zona: 1..5;
		codigoPropiedad: integer;
		tipoPropiedad: string;
		cantidadMetrosCuadrados: integer;
		precioMetroCuadrado: integer;
	end;
	
	propiedadAlmacenar = record
		codigo: integer;
		tipoPropiedad: string;
		precioTotal: integer;
	end;	

	listaPropiedades = ^nodo;
	
	nodo = record
		dato:propiedadAlmacenar;
		sig: listaPropiedades;
	end;
	
		
	vListas = array [1..5] of listaPropiedades;
	
procedure inicializarVector(var v:vListas);
var
	i:integer; l:listaPropiedades;
begin
	new(l); l:= nil;
	for i := 1 to 5 do 
		v[i]:= l;

end;

procedure leerPropiedad(var p:propiedadLectura);
begin
	writeln('Ingrese el precio del metro cuadrado'); readln(p.precioMetroCuadrado);
	if(p.precioMetroCuadrado <> -1) then begin
		writeln('Ingrese la zona de propiedad'); readln(p.zona);
		writeln('Ingrese el codigo de propiedad'); readln(p.codigoPropiedad);
		writeln('Ingrese el tipo de propiedad'); readln(p.tipoPropiedad);
		writeln('Ingrese la cantidad de metros cuadrados'); readln(p.cantidadMetrosCuadrados);
		writeln('PROPIEDAD LEIDA'); writeln('----------------');
	end
	else
		writeln('LECTURA DE PROPIEDADES FINALIZADA');

end;

procedure insertarOrdenado(var l:listaPropiedades; pA: propiedadAlmacenar);
var
	aux:listaPropiedades; ant:listaPropiedades; act:listaPropiedades;
begin
	new(aux); aux^.dato:= pA; aux^.sig:= nil; 
	if(l = nil) then 
		l:= aux
	else begin
		act:= l; ant:= l;
		while(act <> nil) and (act^.dato.tipoPropiedad > ant^.dato.tipoPropiedad) do begin
			ant:= act;
			act:= act^.sig;
		end;	
		if(act = l) then begin
			aux^.sig:= l;
			l:= aux;
		end 	
		else begin
			ant^.sig:= aux;
			aux^.sig:= act;
		end;
	end;		

end;

procedure cargarVector(var v:vListas);
var
	p:propiedadLectura; pA:propiedadAlmacenar; aux: listaPropiedades;
begin
	leerPropiedad(p);
	while(p.precioMetroCuadrado <> -1) do begin
		pA.codigo:= p.codigoPropiedad; pA.tipoPropiedad:= p.tipoPropiedad; pA.precioTotal := p.cantidadMetrosCuadrados * p.precioMetroCuadrado;
		aux:= v[p.zona];
		insertarOrdenado(aux,pA);
		v[p.zona]:= aux;
		leerPropiedad(p);
	end;			
		
end;

var
	v: vListas;

begin
	//Punto A
	inicializarVector(v);
	cargarVector(v);

end.	
