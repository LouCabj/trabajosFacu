program ordenacion2;

const
	dimF = 300;

type
	oficina = record
		codigoIdentificacion: integer;
		dniPropietario: longInt;
		valorExpensa: real;
	end;
	
	vOficinas = array [1..dimF] of oficina;

procedure leerOficina(var o:oficina);

begin
	writeln('Ingrese el codigo de identifiacion'); readln(o.codigoIdentificacion);
	if(o.codigoIdentificacion <> -1) then begin
		writeln('Ingrese el dni del propietario'); readln(o.dniPropietario);
		writeln('Ingrese el valor de la expensa'); readln(o.valorExpensa);
		writeln('OFICINA LEIDA'); writeln('-------------------');
	end;	

end;
	
procedure cargarVector(var v:vOficinas; var dimL: integer);
var
	o:oficina;
begin
	writeln('INFORMACION DE PAGO DE EXPENSAS DE LAS OFICINAS'); writeln('---------------------');
	leerOficina(o);
	while(o.codigoIdentificacion <> -1) and (dimL < dimF)do begin
		dimL:= dimL + 1;
		v[dimL]:= o;
		leerOficina(o);
	end;	

end;	
	
procedure imprimirVector(v:vOficinas;dimL:integer);
var
	i:integer;
begin
	writeln('OFICINAS'); writeln('-------------');
	for i:= 1 to dimL do begin
		writeln('OFICINA ', i);
		writeln('CODIGO IDENTIFICACION ', v[i].codigoIdentificacion);
		writeln('DNI DEL PROPIETARIO ', v[i].dniPropietario);
		writeln('VALOR DE LAS EXPENSAS ', v[i].valorExpensa);
		writeln('OFICINA ', i, ' IMPRESA');
	end;
	
	writeln('TODAS LAS OFICINAS HAN SIDO MOSTRADAS');	

end;	
	
	
procedure ordenarInsercion(var v:vOficinas; dimL: integer);
var
	i,j,actual: integer;
begin
	for i:= 2 to dimL do begin
		actual:= v[i].codigoIdentificacion;
		j:= i - 1;
		while(j > 0) and (v[j].codigoidentificacion > actual) do begin
			v[j+1].codigoIdentificacion := v[j].codigoIdentificacion;
			j:= j - 1;
		end;
		v[j + 1].codigoIdentificacion:= actual;
	end;
end;				


procedure ordenarSeleccion(var v:vOficinas; dimL: integer);
var
	i, j,pos,item: integer;
begin
	for i:= 1 to (dimL-1) do begin
		pos:= i;
		for j:= i+1 to dimL do begin
			if(v[j].codigoIdentificacion < v[pos].codigoIdentificacion) then
				pos:= j;
			item:= v[pos].codigoIdentificacion;
			v[pos].codigoIdentificacion:= v[i].codigoIdentificacion;
			v[i].codigoIdentificacion:= item;	
		end;
	end;	
end;					
	
var	
	v: vOficinas; dimL:integer;
begin
	cargarVector(v,dimL);
	imprimirVector(v,dimL);
	ordenarInsercion(v,dimL);
	ordenarSeleccion(v,dimL)
end.		
