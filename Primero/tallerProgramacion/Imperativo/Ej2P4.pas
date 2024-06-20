{
   Ej2P4.pas
   
 3. Una biblioteca nos ha encargado procesar la información de los préstamos realizados
durante el año 2021. De cada préstamo se conoce el ISBN del libro, el número de socio,
día y mes del préstamo y cantidad de días prestados. Implementar un programa con:
a. Un módulo que lea préstamos y retorne 2 estructuras de datos con la información de
los préstamos. La lectura de los préstamos finaliza con ISBN -1. Las estructuras deben
ser eficientes para buscar por ISBN.
i. En una estructura cada préstamo debe estar en un nodo.
ii. En otra estructura, cada nodo debe contener todos los préstamos realizados al ISBN.
(prestar atención sobre los datos que se almacenan).
b. Un módulo recursivo que reciba la estructura generada en i. y retorne el ISBN más
grande.
c. Un módulo recursivo que reciba la estructura generada en ii. y retorne el ISBN más
pequeño.
d. Un módulo recursivo que reciba la estructura generada en i. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
e. Un módulo recursivo que reciba la estructura generada en ii. y un número de socio. El
módulo debe retornar la cantidad de préstamos realizados a dicho socio.
f. Un módulo que reciba la estructura generada en i. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
g. Un módulo que reciba la estructura generada en ii. y retorne una nueva estructura
ordenada ISBN, donde cada ISBN aparezca una vez junto a la cantidad total de veces
que se prestó.
h. Un módulo recursivo que reciba la estructura generada en h. y muestre su contenido.
i. Un módulo recursivo que reciba la estructura generada en i. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
j. Un módulo recursivo que reciba la estructura generada en ii. y dos valores de ISBN. El
módulo debe retornar la cantidad total de préstamos realizados a los ISBN
comprendidos entre los dos valores recibidos (incluidos).
   
}


program untitled;
const
  FIN=-1;
type
  subDia=1..31;

  subMes=1..12;
  
  prestamo=record//meter el isbn en prestamo y despues hacer un registro acotado para el otro arbol
    dia:subDia;
    mes:subMes;
    codSocio:integer;
    cantDiasPrestados:integer;
   end;
   
  lista=^nodoLista;
  nodoLista=record
    datoL:prestamo;
    sig:lista;
   end;
   
  raiz=^nodo;
  
  nodo=record
    dato:prestamo;
    isbn:integer;
    hi:raiz;
    hd:raiz;
   end;
   
  raiz2=^nodo2;
  
  nodo2=record
    isbn2:integer;
    listaP:lista;
    hi2:raiz2;
    hd2:raiz2;
   end;
   
  arbolIsbn=^nodoIsbn;
  infoIsbn=record
    codIsbn:integer;
    cantPrestadas:integer;
   end;
   
  nodoIsbn=record
    dato:infoIsbn;
    hiIsbn:arbolIsbn;
    hdIsbn:arbolIsbn;
   end;


procedure leerPrestamo(var p:prestamo);
  begin
    p.dia:=random(31)+1;
    p.mes:=random(12)+1;
    p.codSocio:=random(5)+1;
    //write('ingrese cod socio: ');readln(p.codSocio); 
    p.cantDiasPrestados:=random(90)+1;
    writeln('||dia:',p.dia,'/mes:',p.mes,'/codSocio:',p.codSocio,'/dias prestados:',p.cantDiasPrestados,'||');
  end;
  
  
procedure agregarALista(var l:lista;p:prestamo);
  var
    aux:lista;
  begin
    new(aux);
    aux^.datoL:=p;
    aux^.sig:=l;
    l:=aux;
  end;  


procedure agregarAlArbol(var a:raiz;p:prestamo;codIsbn:integer);
  begin
    if(a=nil)then
      begin
        new(a);
        a^.dato:=p;
        a^.isbn:=codIsbn;
        a^.hi:=nil;a^.hd:=nil;
      end
    else
      if(codIsbn>a^.isbn)then
        agregarAlArbol(a^.hd,p,codIsbn)
      else
        agregarAlArbol(a^.hi,p,codIsbn);
  end;  
  

procedure agregarAlArbol2(var a:raiz2;p:prestamo;codIsbn:integer);
  begin
    if(a=nil)then
      begin
        new(a);
        a^.listaP:=nil;
        a^.isbn2:=codIsbn;
        agregarALista(a^.listaP,p);
        a^.hd2:=nil;a^.hi2:=nil;
      end
    else
      if(codIsbn>a^.isbn2)then
        agregarAlArbol2(a^.hd2,p,codIsbn)
      else
        if(codIsbn<a^.isbn2)then
          agregarAlArbol2(a^.hi2,p,codIsbn)
        else
          agregarALista(a^.listaP,p);
  end;
  
  
procedure generarArboles(var a:raiz;var a2:raiz2);
  var
    prest:prestamo;
    isbn:integer;
  begin
    write('ingrese isbn: ');readln(isbn);
    while(isbn<>FIN)do
      begin
        write('<',isbn,'>');
        leerPrestamo(prest);
        agregarAlArbol(a,prest,isbn);
        agregarAlArbol2(a2,prest,isbn);
        write('ingrese isbn: ');readln(isbn);
      end;
  end;


procedure imprimirArbol(a:raiz);
  begin
    if(a<>nil)then
      begin
        imprimirArbol(a^.hi);
        writeln('isbn:',a^.isbn,'/dia:',a^.dato.dia,'/codSocio:',a^.dato.codSocio,'/mes:',a^.dato.mes,'/diasPrestados:',a^.dato.cantDiasPrestados);
        imprimirArbol(a^.hd);
      end;
  end; 
 
 
procedure imprimirLista(l:lista);
  begin
    while(l<>nil)do
      begin
        writeln('|dia:',l^.datoL.dia,'/codSocio:',l^.datoL.codSocio,'/mes:',l^.datoL.mes,'/diasPrestados:',l^.datoL.cantDiasPrestados,'|');
        l:=l^.sig;
      end;
  end; 
 
  
procedure imprimirArbol2(a:raiz2);
  begin
    if(a<>nil)then
      begin
        imprimirArbol2(a^.hi2);
        writeln('isbn: ',a^.isbn2);
        imprimirLista(a^.listaP);
        imprimirArbol2(a^.hd2);
      end;
  end; 


function incisoB(a:raiz):integer;
  begin
    if(a=nil)then
      incisoB:=-1
    else
      if(a^.hd=nil)then
        incisoB:=a^.isbn
      else
        incisoB:=incisoB(a^.hd);
  end;
  
  
function incisoC(a:raiz2):integer;
  begin
    if(a=nil)then
      incisoC:=999
    else
      if(a^.hi2=nil)then
        incisoC:=a^.isbn2
      else
        incisoC:=incisoC(a^.hi2);   
  end; 


procedure incisoD(a:raiz;cod:integer;var cant:integer);
  begin
    if(a<>nil)then
      begin
        incisoD(a^.hi,cod,cant);
        if(a^.dato.codSocio=cod)then
          begin
            cant:=cant+1;
          end;
        incisoD(a^.hd,cod,cant);
      end;
  end;


function sumaSocio(l:lista;cod:integer):integer;
  var
    cant:integer;
  begin
    cant:=0;
    while(l<>nil)do
      begin
        if(l^.datoL.codSocio=cod)then
          cant:=cant+1;
        l:=l^.sig;
      end;
    sumaSocio:=cant;
  end;
  
  
procedure incisoE(a:raiz2;cod:integer;var cant:integer);
  begin
    if(a<>nil)then
      begin
        incisoE(a^.hi2,cod,cant);
        cant:=cant+sumaSocio(a^.listaP,cod);
        incisoE(a^.hd2,cod,cant);
      end;
  end;


procedure agregarAlArbolIsbn(var a:arbolIsbn;info:infoIsbn);
  begin
    if(a=nil)then
      begin
        new(a);
        a^.dato:=info;
        a^.hiIsbn:=nil;a^.hdIsbn:=nil;
      end
    else
      if(info.codIsbn>a^.dato.codIsbn)then
        agregarAlArbolIsbn(a^.hdIsbn,info)
      else
        if(info.codIsbn<a^.dato.codIsbn)then
          agregarAlArbolIsbn(a^.hiIsbn,info)
        else
          a^.dato.cantPrestadas:=a^.dato.cantPrestadas+1;
  end;


procedure incisoF(a:raiz;var aIsbn:arbolIsbn);//paso la lista);//deberia ser una lista ,por que si es un arbol queda degenerado
  var
    aux:infoIsbn;
  begin
    if(a<>nil)then
      begin
        incisoF(a^.hi,aIsbn);
        aux.codIsbn:=a^.isbn;
        aux.cantPrestadas:=1;
        agregarAlArbolIsbn(aIsbn,aux);
        incisoF(a^.hd,aIsbn);
      end;
  end;  
 

procedure imprimirArbolIsbn(a:arbolIsbn);
  begin
    if(a<>nil)then
      begin
        imprimirArbolIsbn(a^.hiIsbn);
        writeln('|isbn:',a^.dato.codIsbn,'/cantPrestadas:',a^.dato.cantPrestadas,'|');
        imprimirArbolIsbn(a^.hdIsbn);
      end;
  end;


function contarPrestamos(l:lista):integer;
  begin
    if(l<>nil)then
      begin
        contarPrestamos:=contarPrestamos(l^.sig)+1;
      end
    else
      contarPrestamos:=0;
  end;


procedure agregarAlArbolIsbn2(var a:arbolIsbn;info:infoIsbn);
  begin
    if(a=nil)then
      begin
        new(a);
        a^.dato:=info;
        a^.hiIsbn:=nil;a^.hdIsbn:=nil;
      end
    else
      if(info.codIsbn>a^.dato.codIsbn)then
        agregarAlArbolIsbn2(a^.hdIsbn,info)
      else
        if(info.codIsbn<a^.dato.codIsbn)then
          agregarAlArbolIsbn2(a^.hiIsbn,info)
  end;


procedure incisoG(a:raiz2;var aIsbn2:arbolIsbn);//paso la lista);//deberia ser una lista ,por que si es un arbol queda degenerado
  var
    inf:infoIsbn;
  begin
    if(a<>nil)then
      begin
        incisoG(a^.hi2,aIsbn2);
        inf.codIsbn:=a^.isbn2;
        inf.cantPrestadas:=contarPrestamos(a^.listaP);
        agregarAlArbolIsbn2(aIsbn2,inf);
        incisoG(a^.hd2,aIsbn2);
      end;
  end;
 
 
procedure incisoI(a:raiz;inf:integer;sup:integer;var cant:integer);
  begin
    if(a<>nil)then
      begin
        if(a^.isbn>=inf)then
          if(a^.isbn<=sup)then
            begin
              incisoI(a^.hi,inf,sup,cant);
              cant:=cant+1;
              incisoI(a^.hd,inf,sup,cant);
            end
          else
            incisoI(a^.hi,inf,sup,cant)
        else
          incisoI(a^.hd,inf,sup,cant);
      end;
  end;
  
  
Procedure incisoJ(a:raiz2;inf:integer;sup:integer;var cant:integer);
  begin
    if(a<>nil)then
      begin
        if(a^.isbn2>=inf)then
          if(a^.isbn2<=sup)then
            begin
              incisoJ(a^.hi2,inf,sup,cant);
              cant:=cant+contarPrestamos(a^.listaP);
              incisoJ(a^.hd2,inf,sup,cant);
            end
          else
            incisoJ(a^.hd2,inf,sup,cant)
        else
          incisoJ(a^.hi2,inf,sup,cant);     
      end;
  end;
  
  
var
  arbol:raiz;
  arbol2:raiz2;
  arbol3,arbol4:arbolIsbn;
  codS,codS2,cantP,cantP2,isbnInf,isbnSup,cantIsbn:integer;
BEGIN
  Randomize;
  arbol:=nil;arbol2:=nil;cantP:=0;cantP2:=0;arbol3:=nil;arbol4:=nil;cantIsbn:=0;
  generarArboles(arbol,arbol2);
  writeln('Arbol 1');
  imprimirArbol(arbol);
  writeln('Arbol 2');
  imprimirArbol2(arbol2);
  writeln('Inciso B');
  writeln('el isbn mas grande del arbol es: ',incisoB(arbol));
  writeln('Inciso C');
  writeln('el isbn mas chico del arbol es: ',incisoC(arbol2));
  writeln('Inciso D');
  write('ingrese codigo para buscar los prestamos: ');readln(codS);
  incisoD(arbol,codS,cantP);
  writeln('la cant de prestamos para el codigo de socio: ',codS,' fue de: ',cantP);
  writeln('Inciso E');
  write('ingrese codigo para buscar los prestamos: ');readln(codS2);
  incisoE(arbol2,codS2,cantP2);
  writeln('la cant de prestamos para el codigo de socio: ',codS2,' fue de: ',cantP2);
  writeln('Inciso F');
  incisoF(arbol,arbol3);
  imprimirArbolIsbn(arbol3);// es la lista generada en el punto anterior a H no el arbol
  writeln('Inciso G');
  incisoG(arbol2,arbol4);
  imprimirArbolIsbn(arbol4);
  writeln('Inciso I');
  write('ingrese isbn menor: ');readln(isbnInf);
  write('ingrese isbn mayor: ');readln(isbnSup);
  incisoI(arbol,isbnInf,isbnSup,cantIsbn);
  writeln('la cant de prestamos entre: ',isbnInf,' y: ',isbnSup,' es de : ',cantIsbn);
  writeln('Inciso J');
  cantIsbn:=0;
  write('ingrese isbn menor: ');readln(isbnInf);
  write('ingrese isbn mayor: ');readln(isbnSup);
  incisoJ(arbol2,isbnInf,isbnSup,cantIsbn);
  writeln('la cant de prestamos entre: ',isbnInf,' y: ',isbnSup,' es de : ',cantIsbn);
END.

