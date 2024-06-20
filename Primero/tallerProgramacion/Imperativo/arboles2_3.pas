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
	
	//TERCER ARBOL (Modulo F y G)
	
	datosArbolTres = record
		isbn: integer;
		cantDiasPrestamos: integer;
	end;	
	
	arbolPrestamosTres = ^nodoTres;
	
	nodoTres = record
		dato: datosArbolTres;
		HI: arbolPrestamosTres;
		HD: arbolPrestamosTres;
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
	writeln('PRESTAMO LEIDO'); writeln('--------------------'); 	
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
	writeln('Lectura de los prestamos');
	leerPrestamo(p);
	while(p.isbn <> -1) do begin
		agregar(a,p);
		agregarDos(a2,p);
		leerPrestamo(p)
	end;
	writeln('TODOS LOS PRESTAMOS HAN SIDO LEIDOS');	
end;	
		
procedure imprimirArbolUno(a: arbolPrestamos);
begin
	if(a <> nil) then begin
		imprimirArbolUno(a^.HI);
		writeln('ISBN: ', a^.dato.isbn, ' cuya cantidad de dias de prestamo es ', a^.dato.cantDiasPrestamo);
		imprimirArbolUno(a^.HD)
	end;	
end;

function diasPrestamo(l:lista):integer;
var
	aux:integer;
begin
	aux:= 0;
	while(l <> nil) do begin
		aux:= aux + l^.dato.cantDiasPrestamo;
		l:= l^.sig;
	end;
	diasPrestamo:= aux;
end;		

procedure imprimirArbolDos(a: arbolPrestamosDos);
begin
	if(a <> nil) then begin
		imprimirArbolDos(a^.HI);
		writeln('ISBN: ', a^.dato.isbn);
		writeln('Cantidad de dias de prestamo es ', diasPrestamo(a^.dato.listaPrestamos));
		imprimirArbolDos(a^.HD);
	end;
end;		


procedure moduloB(a:arbolPrestamos; var isbnGrande:integer);
begin
	if(a <> nil) then begin
		moduloB(a^.HD,isbnGrande);
		if(a^.dato.isbn > isbnGrande ) then
			isbnGrande := a^.dato.isbn
	end;		

end;

procedure moduloC(a2:arbolPrestamosDos; var isbnChico: integer);
begin
	if(a2 <> nil) then begin
		moduloC(a2^.HI,isbnChico);
		if(a2^.dato.isbn < isbnChico) then
			isbnChico := a2^.dato.isbn
	end;
end;

procedure moduloD(a:arbolPrestamos; nroSocio:integer; var cantPrestamos:integer);
begin
	if(a <> nil) then begin
		moduloD(a^.HI, nroSocio, cantPrestamos);
		if(a^.dato.nroSocio = nroSocio) then 
			cantPrestamos:= cantPrestamos + a^.dato.cantDiasPrestamo;
		moduloD(a^.HD, nroSocio, cantPrestamos);
	end;		
end;

procedure recorrerLista(l:lista; nroSocio:integer; var cantPrestamos:integer);
begin
	while(l <> nil) do begin
		if(l^.dato.nroSocio = nroSocio) then 
			cantPrestamos:= cantPrestamos + l^.dato.cantDiasPrestamo;
		l:= l^.sig;	
	end;		

end;

procedure moduloE(a2: arbolPrestamosDos; nroSocio:integer; var cantPrestamos: integer);
begin
	if(a2 <> nil) then begin
		moduloE(a2^.HI,nroSocio, cantPrestamos);
		recorrerLista(a2^.dato.listaPrestamos,nroSocio,cantPrestamos);
		moduloE(a2^.HD,nroSocio,cantPrestamos);
	end;
end;		

procedure agregarModuloF(a:arbolPrestamos; var a3:arbolPrestamosTres);
begin
	if(a3 = nil) then begin
		new(a3); a3^.dato.isbn:= a^.dato.isbn; a3^.dato.cantDiasPrestamos:= a^.dato.cantDiasPrestamo;
		a3^.HI:= nil; a3^.HD:= nil;
	end	
	else begin	
		if(a^.dato.isbn = a3^.dato.isbn) then
			a3^.dato.cantDiasPrestamos:= a3^.dato.cantDiasPrestamos + a^.dato.cantDiasPrestamo
		else begin
			if(a^.dato.isbn > a3^.dato.isbn) then
				agregarModuloF(a,a3^.HD)
			else
				agregarModuloF(a,a3^.HI)
		end;
	end;
end;			
	

procedure moduloF(a:arbolPrestamos; var a3:arbolPrestamosTres);
begin
	if(a <> nil) then begin
		moduloF(a^.HI, a3);
		agregarModuloF(a,a3);
		moduloF(a^.HD,a3)
	end;	
end;

procedure cantidadPrestamos(var cant:integer; l:lista);
begin
	while(l <> nil) do begin
		cant:= cant + l^.dato.cantDiasPrestamo;
		l:= l^.sig;
	end;	
end;

procedure agregarModuloG(a:arbolPrestamosDos; var a3:arbolPrestamosTres);
var
	cant: integer;
begin
	if(a3 = nil) then begin
		new(a3);
		a3^.dato.isbn := a^.dato.isbn;
		cant:= 0;
		cantidadPrestamos(cant,a^.dato.listaPrestamos);
		a3^.dato.cantDiasPrestamos := cant;
		a3^.HI:= nil; a3^.HD:= nil;
	end
	else begin
			if(a^.dato.isbn > a3^.dato.isbn) then
				agregarModuloG(a,a3^.HD)
			else
				agregarModuloG(a,a3^.HI)
		end;
end;				

procedure moduloG(a:arbolPrestamosDos; var a3:arbolPrestamosTres);
begin
	if(a <> nil) then begin
		moduloG(a^.HI, a3);
		agregarModuloG(a,a3);
		moduloG(a^.HD, a3)
	end;
end;

procedure imprimirArbolTres(a3:arbolPrestamosTres);
begin
	if(a3 <> nil) then begin
		imprimirArbolTres(a3^.HI);
		writeln('Codigo isbn: ', a3^.dato.isbn, ' cuya cantidad de prestamos es: ', a3^.dato.cantDiasPrestamos);
		imprimirArbolTres(a3^.HD);
	end;
end;		
		
var
	a:arbolPrestamos;  a2:arbolPrestamosDos;
	//modulo B y c
	isbnGrande: integer; isbnChico: integer;
	//Modulo D y E
	nroSocio: integer; nroSocioDos: integer;
	cantPrestamos: integer; cantPrestamosDos: integer;
	// Modulo F y G
	a3: arbolPrestamosTres; a4: arbolPrestamosTres;
	
begin
	cargarArboles(a,a2);
//	imprimirArbolUno(a); TESTEADO AMBOS ARBOLES FUNCIONAN BIEN EN SU CARGA DE DATOS.
//	imprimirArbolDos(a2);
	isbnGrande:= -1;	moduloB(a,isbnGrande);
	isbnChico:= 1000; 	moduloC(a2, isbnChico);
	writeln('El isbn mas chico es el ', isbnChico); writeln('-----------');
	writeln('El isbn mas grande es el ', isbnGrande); writeln('--------');
//	Modulo D y E
	cantPrestamos:= 0; writeln('Ingrese el numero de socio para buscar sus prestamos'); readln(nroSocio);
	moduloD(a,nroSocio,cantPrestamos); writeln('-------------');
	writeln('Ingrese otro nro de socio'); readln(nroSocioDos);
	cantPrestamosDos:=0;  moduloE(a2,nroSocioDos, cantPrestamosDos);
	writeln('El primer numero de socio ingresado tiene ', cantPrestamos, ' de prestamos');
	writeln('El segundo numero de socio ingresado tiene ', cantPrestamosDos, ' de prestamos');
//	Modulo F y G
	moduloF(a,a3);
	moduloG(a2,a4);
//	----------------------------------------------------
//	imprimirArbolTres(a3);
	imprimirArbolTres(a4);
//------------------------------------------------------
//Modulo I y J
		
end.	
	
