program arboles1;

type

	socio = record
		nroSocio: integer;
		nombre: string;
		edad: integer;
	end;	

	arbol = ^nodo;
	
	nodo = record
		dato: socio;
		HD: arbol;
		HI: arbol;
	end;


procedure leerSocio(var s:socio);
begin
	writeln('Ingrese el nro de socio'); readln(s.nroSocio);
	if(s.nroSocio <> 0) then begin
		writeln('Ingrese el nombre del socio'); readln(s.nombre);
		writeln('Ingrese la edad'); readln(s.edad);
		writeln('SOCIO LEIDO'); writeln('---------------');
	end;	
end;

procedure agregarSocio(var a:arbol; s:socio);
begin
	if(a = nil) then begin
		new(a);
		a^.dato:= s;
		a^.HD:= nil;
		a^.HI:= nil;
	end
	else begin
		if(s.nroSocio <= a^.dato.nroSocio) then agregarSocio(a^.HI,s)
		else agregarSocio(a^.HD,s);
	end;

end;	
	
procedure cargarArbol(var a:arbol);
var
	s:socio;
begin
	writeln('BIENVENIDO'); writeln('INGRESE LOS DATOS DE LOS SOCIOS'); writeln('-----------');
	leerSocio(s);
	while(s.nroSocio <> 0) do begin
		agregarSocio(a,s);
		leerSocio(s);
	end;	
end;

function minimo(a: arbol):integer;

begin
	if(a^.HD = nil) then
		minimo:= a^.dato.nroSocio
	else	
		minimo(a^.HD);
end;	

procedure socioNumeroChico(a:arbol; var s:socio);

begin
	if(a^.HI = nil) then
		s:= a^.dato
	else
		socioNumeroChico(a^.HI, s);
end;

procedure mayorEdad(a:arbol; var maximo:integer; var socioMax:integer);
begin
	if(a <> nil) then begin
		mayorEdad(a^.HI, maximo,socioMax);
		if(a^.dato.edad >= maximo) then begin
			maximo:= a^.dato.edad;
			socioMax:= a^.dato.nroSocio;
		end;	
		mayorEdad(a^.HD, maximo,socioMax);
	end;	
end;	

procedure aumentarEdad(var a:arbol);
begin
	if(a<> nil) then begin
		aumentarEdad(a^.HI);
		a^.dato.edad:= a^.dato.edad + 1;
		aumentarEdad(a^.HD);
	end;
end;	

function buscarSocio(a:arbol; socio: integer): boolean;

begin
	if(a = nil) then buscarSocio:= false 
	else begin
		if(a^.dato.nroSocio = socio) then
			buscarSocio:= true
		else
			if(socio < a^.dato.nroSocio) then
				buscarSocio(a^.HI,socio)
			else
				buscarSocio(a^.HD, socio)
	 end;
end;

function buscarNombreSocio(a:arbol; nombreSocio:string):boolean;

begin
	if(a <> nil) then begin
		buscarNombreSocio(a^.HI,nombreSocio);
		if(a^.dato.nombre = nombreSocio) then buscarNombreSocio:= true;
		buscarNombreSocio(a^.HD,nombreSocio);
	end;	
end;

procedure cantidadSocios(a:arbol; var cantidadSoc:integer);
begin
	if(a <> nil) then begin
		cantidadSocios(a^.HI,cantidadSoc);
		cantidadSoc:= cantidadSoc + 1;
		cantidadSocios(a^.HD,cantidadSoc);

	end;
end;

procedure edades(a:arbol; var sumaEdades: integer);
begin
	if(a <> nil) then begin
		edades(a^.HI, sumaEdades);
		sumaEdades:= sumaEdades + a^.dato.edad;
		edades(a^.HD, sumaEdades);
	end;	
end;

var
	a:arbol; s:socio; maximo:integer;nroSocio:integer;
	socioNum: integer; nombreSocio:string; cantidadSoc: integer; sumaEdades: integer;
begin
	cargarArbol(a);
	//Modulo2
	writeln('----------');
	writeln('El numero de socio mas grande es el ', minimo(a));
	writeln('---------------');
	socioNumeroChico(a,s);
	writeln('El socio de nombre ', s.nombre, ', de edad ', s.edad, ', tiene el menor numero de socio que es el ', s.nroSocio);
	writeln('------------');
	maximo:= -1; mayorEdad(a,maximo,nroSocio);
	writeln('El numero de socio del que tiene mayor edad es el ', nroSocio);
	writeln('-----------');
	aumentarEdad(a);
	writeln('-----------------');
	writeln('Ingrese el nro de socio que desea encontrar'); readln(socioNum);
	writeln(buscarSocio(a,socioNum));
	writeln('-------------------------');
	writeln('Ingrese el nombre de socio que desea encontrar'); readln(nombreSocio);
	writeln(buscarNombreSocio(a,nombreSocio));
	writeln('----------');
	cantidadSoc:= 0; cantidadSocios(a,cantidadSoc);
	writeln('LA CANTIDAD DE SOCIOS ES DE ', cantidadSoc);
	writeln('----------------');
	sumaEdades:= 0;	edades(a, sumaEdades);
	writeln('El promedio de edad de los socios es de ', sumaEdades/cantidadSoc);
	writeln('--------------');
	//ordenCreciente(a);
	//ordenDecreciente(a);
end.		
