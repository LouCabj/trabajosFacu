{
   Ej1P5.pas
   
   1. El administrador de un edificio de oficinas, cuenta en papel, con la información del pago
de las expensas de dichas oficinas. Implementar un programa con:
* 
a) Un módulo que retorne un vector, sin orden, con a lo sumo las 300 oficinas que
administra. Se debe leer, para cada oficina, el código de identificación, DNI del
propietario y valor de la expensa. La lectura finaliza cuando llega el código de
identificación -1.
* 
b) Un módulo que reciba el vector retornado en a) y retorne dicho vector ordenado por
código de identificación de la oficina. Ordenar el vector aplicando uno de los métodos
vistos en la cursada.
* 
c) Un módulo que realice una búsqueda dicotómica. Este módulo debe recibir el vector
generado en b) y un código de identificación de oficina. En el caso de encontrarlo,
debe retornar la posición del vector donde se encuentra y en caso contrario debe
retornar 0. Luego el programa debe informar el DNI del propietario o un cartel
indicando que no se encontró la oficina.
* 
d) Un módulo recursivo que retorne el monto total de las expensas.
   
   
}
program untitled;
const
  DIMF=10;
  FIN=-1;
    
type
  
  subOficinas=1..DIMF;

  oficina=record
    codIdentificacion:integer;
    dniPropietario:integer;
    valorExpensa:real;
   end;
   
  vectorOficinas=array [subOficinas]of oficina;
  

procedure leerOficina(var o:oficina);
  begin
    o.codIdentificacion:=random(10)-1;
    if(o.codIdentificacion<>FIN)then 
      begin
        o.dniPropietario:=random(20)+1;
        o.valorExpensa:=random(1000)+1;
      end;
  end;

  
  
procedure incisoA(var v:vectorOficinas;var diml:integer);
  var
    ofi:oficina;
  begin
    leerOficina(ofi);
    while(ofi.codIdentificacion<>FIN)and(diml<DIMF)do
      begin
        diml:=diml+1;
        v[diml]:=ofi;
        leerOficina(ofi);
      end;
  end;
 
 
procedure incisoB(var v:vectorOficinas;var diml:integer);
  var
    j,i:integer;
    aux:oficina;
  begin
    for i:=2 to diml do
      begin
        aux:=v[i];
        j:=i-1;
        while((j>0)and(v[j].codIdentificacion>aux.codIdentificacion))do
          begin
            v[j+1]:=v[j];
            j:=j-1;
          end;
        v[j+1]:=aux;
      end;
  end;
  
  
procedure imprimir(v:vectorOficinas;diml:integer);
  var
    x:integer;
  begin
    for x:=1 to diml do
      writeln('|Cod:',v[x].codIdentificacion,'/Dni:',v[x].dniPropietario,'/Expensa:',v[x].valorExpensa:2:2,'|');
  end;  


function incisoC(v:vectorOficinas;diml:integer;codI:integer):integer;
  var
    ini,fin,mid,pos:integer; 
  begin
    ini:=1;fin:=diml;
    mid:=(ini+fin) div 2;
    pos:=0;
    while(v[mid].codIdentificacion<>codI)and(ini<=fin)do
      begin
        if(v[mid].codIdentificacion>codI)then
          fin:=mid-1
        else
          ini:=mid+1;
        mid:=(ini+fin) div 2;    
      end;
   if(v[mid].codIdentificacion=codI)and(ini<=fin)then
     pos:=mid;
   incisoC:=pos;
  end;
  
  
function incisoD(v:vectorOficinas;diml:integer):real;
  begin
    if(diml>0)then
      incisoD:=incisoD(v,diml-1)+v[diml].valorExpensa
    else
      incisoD:=0;
  end;
  
  
var 
  vector:vectorOficinas;
  diml,resC,codC:integer;
  
BEGIN
  diml:=0;
  Randomize;
  writeln('Inciso A');
  incisoA(vector,diml);
  imprimir(vector,diml);
  writeln('Inciso B');
  incisoB(vector,diml);
  imprimir(vector,diml);	
  writeln('Inciso C');
  write('Ingrese cod de ident a buscar: ');readln(codC);
  resC:=incisoC(vector,diml,codC);
  if(resC=0)then
    writeln('No se encontro la oficina con cod de Identificacion: ',codC)
  else
    writeln('Se encontro la oficina con cod de Identificacion: ',codC,' y su pos es: ',resC);
  writeln('Inciso D'); 
  writeln('La suma de todas las expensas del vector es de: ',incisoD(vector,diml):2:2);
END.

