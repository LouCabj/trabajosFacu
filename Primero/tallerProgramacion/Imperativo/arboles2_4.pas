program arboles4;

const
	dimF = 30;
type
	
	finales = record
		codAlumno: integer;
		codMateria: 1..30;
		nota: -1..10;
	end;	
	
//PRIMERA ESTRUCTURA
	
	alumno = record
		codAlumno: integer;
		codMateria: 1..30;
		nota: 4..10;
	end;
	
	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato:alumno;
		HI: arbol;
		HD: arbol;
	end;
	
//SEGUNDA ESTRUCTURA

	materia = record
		codAlumno: integer;
		nota: 1..10;
	end;	

	listaMateria = ^nodo;
	
	nodo = record
		dato:materia;
		sig:listaMateria;
	end;	
		
	
	vector = array[1..dimF] of listaMateria;



procedure inicializarVector(var v:vector);
var
	i:integer;
begin
	for i:= 1 to dimF do 
		v[i]:= nil;

end;

procedure leerFinales(var f:finales);
begin
	writeln('Ingrese la nota del final'); readln(f.nota);
	if(f.nota <> -1) then begin
		writeln('Ingrese el codigo del alumno'); readln(f.codAlumno);
		writeln('Ingrese el codigo de materia'); readln(f.codMateria);
	end;	
end;


procedure agregarEspecial(var a:arbol; f:finales; aux: arbol);
begin
	new(a);
	a^.dato.codAlumno := f.codAlumno;
	a^.dato.codMateria:= f.codMateria;
	a^.dato.nota:= f.nota;
	a^.HD:= nil;
	a^.HI := aux;
end;	

procedure agregarArbol(var a:arbol; f:finales);
var
	aux:arbol;
begin
	if(a = nil) then begin
		new(a);
		a^.dato.codAlumno := f.codAlumno;
		a^.dato.codMateria:= f.codMateria;
		a^.dato.nota := f.nota;
		a^.HI:= nil; a^.HD:= nil;
	end	
	else begin
		if(f.codAlumno = a^.dato.codAlumno) then begin
			aux:= a^.HI;
			a^.HI:= nil;
			agregarEspecial(a^.HI,f,aux);
		end
		else begin
			if(f.codAlumno > a^.dato.codAlumno) then 
				agregarArbol(a^.HD, f)
			else
				agregarArbol(a^.HI, f)
		end;
	end;			

end;

procedure agregarAdelante(var l:listaMateria; f:finales);
var
	nuevo: listaMateria;
begin
	new(nuevo); nuevo^.dato.codAlumno := f.codAlumno; nuevo^.dato.nota := f.nota;
	nuevo^.sig:= l;
	l:= nuevo;
end;
	
procedure cargarEstructuras(var a:arbol; var v:vector);
var
	f:finales;
begin
	leerFinales(f);
	while(f.nota <> -1) do begin
		if(f.nota >= 4) then
			agregarArbol(a,f);
		agregarAdelante(v[f.codMateria], f);
		leerFinales(f);
	end;
end;		
		
var
	a:arbol; v:vector;
begin
	inicializarVector(v);
	cargarEstructuras(a,v);





end.
