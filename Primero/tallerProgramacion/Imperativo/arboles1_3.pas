program arboles3;

type

	//PRIMER ARBOL

	prestamo = record
		isbn: integer;
		nroSocio: integer;
		dia: integer;
		mes: string;
		cantDiasPrestamo: integer;
	end;
	
	arbolPrestamos = ^nodo;
	
	nodo = record
		dato: prestamo;
		HI:arbolPrestamos;
		HD:arbolPrestamos;
	end;
	
	//SEGUNDO ARBOL
	
	prestamoDos = record
		nroSocio: integer;
		dia: integer;
		mes: string;
		cantDiasPrestamo: integer;
	end;	
		
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: prestamoDos;
		sig: lista;
	end;	
	
	datosArbolDos = record
		isbn: integer;
		listaPrestamos: lista;
	end;
	
	arbolPrestamosDos = ^nodoDos;
	
	nodoDos = record
		dato: datosArbolDos;
		HI: arbolPrestamosDos;
		HD: arbolPrestamosDos;
	end;	



procedure leerPrestamo(var p:prestamo);
begin
	writeln('Ingrese el isbn del prestamo'); readln(p.isbn);
	if(p.isbn <> -1) then begin
		writeln('Ingrese el numero de socio'); readln(p.nroSocio);
		writeln('Ingrese el dia del prestamo'); readln(p.dia);
		writeln('Ingrese el mes del prestamo'); readln(p.mes);
		writeln('ingrese la cantidad de dias del prestamo'); readln(p.cantDiasPrestamo);
	end;	
end;

procedure agregarEspecial(var a:arbolPrestamos; p:prestamo; aux: arbolPrestamos);
begin
	new(a); a^.dato:= p; a^.HI:= aux; a^.HD:= nil;
end;	

procedure agregar(var a:arbolPrestamos; p:prestamo);
var
	aux: arbolPrestamos;
begin
	if(a = nil) then begin 
		new(a); a^.dato:= p; a^.HI:= nil; a^.HD:= nil;
	end
	else begin
		if(a^.dato.isbn = p.isbn) then begin
			aux:= a^.HI;
			a^.HI:= nil;
			agregarEspecial(a^.HI,p,aux);
		end	
		else begin
			if(a^.dato.isbn < p.isbn) then
				agregar(a^.HD, p)
			else
				agregar(a^.HI, p)
		end;
	end;	
end;

procedure agregarAdelante(var l:lista; p:prestamo);
var
	nuevo: lista;
begin
	new(nuevo);
	nuevo^.dato.nroSocio:= p.nroSocio; nuevo^.dato.dia:= p.dia;
	nuevo^.dato.mes:= p.mes; nuevo^.dato.cantDiasPrestamo:= p.cantDiasPrestamo;
	nuevo^.sig:= l;
	l:= nuevo;

end;	

procedure agregarDos(var a:arbolPrestamosDos; p:prestamo);
begin
	if(a = nil) then begin
		new(a);
		a^.dato.isbn:= p.isbn;
		agregarAdelante(a^.dato.listaPrestamos,p);
		a^.HI:= nil; a^.HD:= nil; 
	end
	else begin
		if(a^.dato.isbn = p.isbn) then 
			agregarAdelante(a^.dato.listaPrestamos,p)
		else begin
			if(a^.dato.isbn < p.isbn) then
				agregarDos(a^.HD,p)
			else
				agregarDos(a^.HI,p)
		end;
	end;			

end;

procedure cargarArboles(var a: arbolPrestamos; var a2: arbolPrestamosDos);
var
	p:prestamo;
begin
	leerPrestamo(p);
	while(p.isbn <> -1) do begin
		agregar(a,p);
		agregarDos(a2,p);
		leerPrestamo(p)
	end;	
end;	
		
		
var
	a:arbolPrestamos;  a2:arbolPrestamosDos;
begin
	cargarArboles(a,a2);
	






end.	
	
