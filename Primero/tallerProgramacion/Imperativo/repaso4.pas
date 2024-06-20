program repaso4;

type

	reclamo = record
		codigo: integer;
		dni: longInt;
		ano: integer;
		tipoReclamo: string;
	end;
	
	//lista del arbol	
		
	datosLista = record
		codigo: integer;
		ano: integer;
		tipoReclamo: string;
	end;
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: datosLista;
		sig: lista;
	end;	
	
	//ARBOL
	
	datosArbol = record
		dni: longInt;
		listaArbol: lista;
		cantReclamos: integer;
	end;	
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: datosArbol;
		HI: arbol;
		HD: arbol;
	end;
	
	
procedure leerReclamo(var r:reclamo);
begin
	readln(r.codigo);
	if(r.codigo <> -1) then begin
		readln(r.dni);
		readln(r.ano);
		readln(r.tipoReclamo);
	end;	
end;	


procedure agregarAdelante(var l:lista; r:reclamo);
var
	nuevo: lista;
begin
	new(nuevo); nuevo^.dato.codigo := r.codigo;
	nuevo^.dato.ano := r.ano; nuevo^.dato.tipoReclamo := r.tipoReclamo;
	nuevo^.sig:= l;
	l:= nuevo;
end;	

procedure agregar(var a:arbol; r:reclamo);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.dni := r.dni;
		a^.dato.listaArbol := nil; agregarAdelante(a^.dato.listaArbol, r);
		a^.dato.cantReclamos := 1;
		a^.HI:= nil; a^.HI:= nil;
	end
	else begin
		if(r.dni = a^.dato.dni) then begin
			agregarAdelante(a^.dato.listaArbol, r);
			a^.dato.cantReclamos := a^.dato.cantReclamos + 1;
		end
		else begin
			if(r.dni > a^.dato.dni) then
				agregar(a^.HD, r)
			else
				agregar(a^.HI,r);
		end;
	end;			
end;

	
procedure cargarArbol(var a:arbol);
var
	r:reclamo;
begin
	leerReclamo(r);
	while(r.codigo <> -1) do begin
		agregar(a,r);
		leerReclamo(r);
	end;	
end;

procedure moduloB(a:arbol; dni: longInt; var cantReclamos:integer);
begin
	if(a <> nil) then begin
		if(dni = a^.dato.dni) then 
			cantReclamos:= a^.dato.cantReclamos
		else begin
			if(dni > a^.dato.dni) then
				moduloB(a^.HD, dni, cantReclamos)
			else
				moduloB(a^.HI, dni, cantReclamos)
		end;
	end;			
end;


procedure moduloC(a:arbol; dniUno: integer; dniDos:integer; var cantReclamosC:integer);
begin
	if(a <> nil) then begin
		if(dniUno >= a^.dato.dni) then
			moduloC(a^.HD, dniUno,dniDos, cantReclamosC)
		else begin
			if(dniDos <= a^.dato.dni) then
				moduloC(a^.HI, dniUno, dniDos, cantReclamosC)
			else begin
				cantReclamosC:= cantReclamosC + a^.dato.cantReclamos;
				moduloC(a^.HD, dniUno,dniDos,cantReclamosC);
				moduloC(a^.HI, dniUno,dniDos,cantReclamosC);
			end;
		end;
	end;			
end;	
	
var
	a:arbol;
	dni: longInt; cantReclamos: integer;
	dniUno: longInt; dniDos: longInt; cantReclamosC: integer;
begin
	cargarArbol(a);
	//modulo b
	readln(dni); cantReclamos:= 0;
	moduloB(a, dni, cantReclamos);
	//modulo c
	readln(dniUno); readln(dniDos); cantReclamosC:= 0;
	moduloC(a,dniUno,dniDos,cantReclamosC);



end.
