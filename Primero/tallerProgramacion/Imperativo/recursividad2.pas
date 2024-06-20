program recursividad2;

type

	listaNumeros = ^nodo;
	
	nodo = record
		dato: integer;
		sig: listaNumeros;
	end;



procedure agregarAdelante(var l:listaNumeros; n:integer);
var
	aux: listaNumeros;
begin
	new(aux); aux^.dato:= n; aux^.sig:= l;
	l:= aux;
end;	

procedure cargarLista(var l: listaNumeros);
var
	n: integer;
begin
	writeln('Ingrese el numero'); readln(n);
	while(n <> 0) do begin
		agregarAdelante(l,n);
		writeln('Ingrese el numero'); readln(n);
	end;	
end;

procedure imprimirNumero(n: integer); //recursivo
var
	aux: integer;
begin
	if(n div 10 <> 0) then begin
		aux:= n div 10;
		imprimirNumero(aux);
		write(n mod 10);
	end
	else
		write(n);
end;

procedure imprimirLista(l: listaNumeros); 
begin
	if((l <> nil) and (l^.dato <> 0)) then begin
		imprimirNumero(l^.dato);
		writeln('---------');
		writeln();
		imprimirLista(l^.sig);
	end;	
end;
	
var
	l: listaNumeros;
begin
	l:= nil;
	writeln('BIENVENIDO, INGRESE LOS NUMEROS'); writeln('-----------------------');
	cargarLista(l);
	writeln('LOS NUMEROS SON:');
	imprimirLista(l);

end.	
