program ordenacion3;

const
	dimF = 8;
type

	pelicula = record
		codPelicula : integer;
		codGenero: 1..8;
		puntajePromedio: real;
	end;
	
	listaPeliculas = ^nodo;
	
	nodo = record
		dato: pelicula;
		sig: ^listaPeliculas;
	end;	
	
	vPeliculas = array [1..8] of listaPeliculas;

	peliculaB = record
		codPelicula:integer;
		puntajePromedio:real
	end;
	
	vPeliculasB = array[1..8] of peliculaB;	
	
procedure inicializarVector(var v:vPeliculas);
var

begin
	for i:= 1 to dimF do 
		v[i]:= nil;

end;

procedure leerPelicula(var p:pelicula);
begin
	writeln('Ingrese el codigo de la pelicula'); readln(p.codPelicula);
	if(p.codPelicula <> -1) then begin
		writeln('Ingrese el codigo de genero'); readln(p.codGenero);
		writeln('Ingrese el puntaje promedio de la pelicula'); readln(p.puntajePromedio);
	end;	

end;

procedure agregarAdelante(var l:listaPeliculas; p:pelicula);
var
	nuevo:listaPeliculas;
begin
	new(nuevo); nuevo^.dato:= p; nuevo^.sig:=l;
	l:= nuevo;


end;

procedure cargarVector(var v:vPeliculas);
var
	p:pelicula; genero: 1..8; aux:listaPeliculas;
begin
	writeln('BIENVENIDO'); writeln('POR FAVOR, INGRESE LOS DATOS DE LAS PELICULAS'); writeln('----------------');
	leerPelicula(p);
	while(p.codPelicula <> -1) do begin
		genero:= p.codGenero;
		aux:= v[genero];
		agregarAdelante(aux,p);
		v[genero]:= aux;
		leerPelicula(p);
	end;	

end;

procedure conseguirMaximo(l:listaPeliculas; var codPelicula:integer; var puntajePromedio:real);
var
	max: real;
begin
	max:= -1;
	while(l <> nil) do begin
		if(l^.dato.puntajePromedio > max) then begin
 			max:= l^.dato.puntajePromedio;
			puntajePromedio:= l^.dato.puntajePromedio;
			codPelicula:= l^.dato.codPelicula;
		end;
		l:= l^.sig;
	end;	

end;

procedure moduloB(v:vPeliculas; var vB: vPeliculasB);
var
	i:integer; l:listaPeliculas;
begin
	for i:= 1 to dimF do begin
		l:= v[i];
		conseguirMaximo(l,codPelicula,puntajePromedio);
		vB[i].codPelicula := codPelicula;
		vB[i].puntajePromedio := puntajePromedio;
	end;	
end;	

procedure recorrerLista(l: listaPeliculas);

begin
	while(l <> nil) do begin
		writeln('La pelicula de codigo ', l^.dato.codPelicula, ' tuvo un puntaje de ', l^.dato.puntajePromedio);
		l:= l^.sig;
	end;
	
end;

procedure imprimirVectorListas(v: vPeliculas);
var
	i:integer;
begin
	writeln('Informacion de todas las peliculas'); writeln('-----------');
	for i:= 1 to dimF do begin
		writeln('GENERO DE CODIGO ', i);
		lista: v[i];
		recorrerLista(l);
		writeln('-------------------');
	end;
	writeln('Se ha impreso la informacion de todas las peliculas');	

end;

procedure imprimirVectorPeliculas(v: vPeliculasB);
var
	i:integer;
begin
	for i:= 1 to dimF do begin
		writeln('La pelicula de codigo ', v[i].codPelicula, ' tuvo un puntaje de ', v[i].puntajePromedio);
		writeln('---------------');
	end;
	writeln('PELICULAS IMPRESAS');	
end;
	
var	
	v:vPeliculas; vB: vPeliculasB
begin
	inicializarVector(v)
	cargarVector(v);
	moduloB(v,vB);
	imprimirVectorPeliculas(vB);
	//ordenarSeleccion() COMO ORDENAR UN VECTOR DONDE NO QUEDA CLARO SU DIMENSION LOGICA? USO DIMENSION FISICA?
end.	
