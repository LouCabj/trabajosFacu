{Parcial1.pas}
program untitled;
const
  FIN=0;
  
type
   
   subDia=1..31;
   
   subMes=1..12;
   
   
  compra=record
    codigo:integer;
    codigoCliente:integer;
    dia:subDia;
    mes:subMes;
   end;
   
  compraLista=record
    dia:subDia;
    mes:subMes;
    codigo:integer;
   end;
   
  lista=^nodoLista;
  
  nodoLista=record
    dato:compraLista;
    sig:lista;
   end;
  
  raiz=^nodoArbol;
  
  nodoArbol=record
    codigoCliente:integer;
    dato:lista;
    hd:raiz;
    hi:raiz;
   end;
  
  registroVector=record//hace falta mes ? por que despues de ordenar perderia el valor la analogia con el mes
    mes:subMes;// y la pos del vector
    cantidad:integer;
   end;
  
  vectorV=array [subMes] of registroVector;
  
  
procedure incisoB(a:raiz;cod:integer;var l:lista);
  begin
    if(a<>nil)then
      begin
        if(cod=a^.codigoCliente)then
          l:=a^.dato
        else
          if(cod>a^.codigoCliente)then
            incisoB(a^.hd,cod,l)
          else
            incisoB(a^.hi,cod,l);
      end;
  end;  

procedure sumarAlVector(var v:vectorV;mes:integer);
  begin
    v[mes].cantidad:=v[mes].cantidad+1;
  end;


procedure inicializarVector(var v:vectorV);
  var
    x:integer;
  begin
    for x:=1 to 12 do
      begin
        v[x].mes:=x;
        v[x].cantidad:=0;
      end;
  end;  
  
  
procedure leerCompra(var c:compra);
  begin
    c.codigoCliente:=random(100);
    if(c.codigoCliente<>FIN)then
      begin
        c.codigo:=random(1000)+1;
        c.dia:=random(31)+1;
        c.mes:=random(12)+1;
      end;
  end;


procedure conversion(c:compra;var c2:compraLista);
  begin
    c2.codigo:=c.codigo;
    c2.mes:=c.mes;
    c2.dia:=c.dia;
  end;


procedure agregarALista(var l:lista;c:compraLista);
  var
    nue:lista;
  begin
    new(nue);
    nue^.dato:=c;
    nue^.sig:=l;
    l:=nue;
  end;
  
  
procedure agregarAlArbol(var a:raiz;c:compra);
  var
    comp:compraLista;
  begin
    if(a=nil)then
      begin
        new(a);
        conversion(c,comp);
        a^.dato:=nil;
        agregarALista(a^.dato,comp);
        a^.codigoCliente:=c.codigoCliente;
        a^.hd:=nil;a^.hi:=nil;
      end
    else
      if(c.codigoCliente=a^.codigoCliente)then
        begin
          conversion(c,comp);
          agregarALista(a^.dato,comp);
        end
      else
        if(c.codigoCliente>a^.codigoCliente)then
          agregarAlArbol(a^.hd,c)
        else
          agregarAlArbol(a^.hi,c);
  end;  


procedure incisoA(var a:raiz;var v:vectorV);
  var
    comp:compra;
  begin
    leerCompra(comp);
    while(comp.codigoCliente<>FIN)do
      begin
        agregarAlArbol(a,comp);
        sumarAlVector(v,comp.mes);
        leerCompra(comp);
      end;
  end;


procedure incisoC(var v:vectorV);
  var
    i,j:integer;
    aux:registroVector;
  begin
    for i:=2 to 12 do
      begin
        aux:=v[i];
        j:=i-1;
        while(j>0)and(aux.cantidad<v[i].cantidad)do//de mayor a menor ?
          begin
            v[j+1]:=v[j];
            j:=j-1;
          end;
        v[j+1]:=aux;
      end;
  end;
     
   
var
  arbol:raiz;
  vector:vectorV;
  listaB:lista;
  cod:integer;
BEGIN
  arbol:=nil;listaB:=nil;
  writeln('Inciso A');
  incisoA(arbol,vector);
  writeln('Inciso B');
  write('Ingrese codigo para devolver todas sus compras: ');readln(cod);
  incisoB(arbol,cod,listaB);
  writeln('Inciso C');
  incisoC(vector);
END.

