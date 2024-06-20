program repaso2;

type

	//PRIMER ARBOL
	
	auto = record
		patente: integer;
		anoFabricacion: 2010..2018;
		marca: string;
		modelo: string;
	end;
	
		


	arbol = ^nodoArbol;
	
	nodoArbol = record
		dato: auto;
		HI: arbol;
		HD: arbol;
	end;
	
	//SEGUNDO ARBOL
	
	datosAuto = record
		patente: integer;
		anoFabricacion: 2010..2018;
		modelo: string;
	end;	
	
	lista = ^nodoLista;
	
	nodoLista = record
		dato: datosAuto;
		sig: lista;
	end;	
	
	autoDos = record
		marca:string;
		listaAuto: lista;
	end;	
	
	arbolDos = ^nodoArbolDos;
	
	nodoArbolDos = record
		dato: autoDos;
		HI: arbolDos;
		HD: arbolDos;
	end;


procedure leerAuto(var au:auto);
begin
	writeln('ingrese la patente'); readln(au.patente);
	if(au.patente <> -1) then begin
		writeln('ingrese el ano de fabricacion'); readln(au.anoFabricacion);
		writeln('ingrese la marca'); readln(au.marca);
		writeln('ingrese el modelo'); readln(au.modelo);
	end;
end;		


procedure agregar(var a:arbol; au:auto);
begin
	if(a = nil) then begin
		new(a); a^.dato:= au; a^.HI:= nil; a^.HD := nil;
	end
	else begin
		//LA PATENTE NO DEBERIA REPETIRSE NUNCA
		if(au.patente > a^.dato.patente) then
			agregar(a^.HD, au)
		else begin
			if(au.patente < a^.dato.patente) then
				agregar(a^.HI, au);
		end;
	end;	

end;

procedure agregarDos(var a2:arbolDos; au:auto);
begin
	if(a2 = nil) then begin
		new(a2);
		a^.dato.marca := au.marca;
		agregarAdelante(a^.dato.listaAuto,au);
		a^.HI:= nil; a^.HD := nil;
	end
	else begin
		if(au.marca = a^.dato.marca) then
			agregarAdelante(a^.dato.listaAuto, au);
		else begin
			if(au.marca > a^.dato.marca) then
				agregarDos(a2^.HD, au)
			else
				agregarDos(a2^.HI, au)
		end;
	end;			
end;

procedure cargarArboles(var a:arbol; var a2:arbolDos);
var
	au: auto;
begin
	writeln('BIENVENIDO, INGRESE LOS AUTOS EN EL REGISTRO'); writeln('-------------');
	leerAuto(au);
	while(au.patente <> -1) do begin
		agregar(a,au);
		agregarDos(a2,au);
		leerAuto(au);
	end;	
end;	
	
var
	a: arbol; a2: arbolDos;
begin
	cargarArboles(a,a2);
	
	
	
	
end;	
	
		
