program tubes;
uses crt,sysutils;
type
 temp = record
        n,ter : integer;
        end;
 user = record
        nama : string;
        nonor : real;
        orga : real;
        nik : longint;
        end;
 tabel = array[1..999] of user;
var
 i,j,pil:integer;
 x:longint;
 a:tabel;
 n:temp;
 pils:char;
 minx:real;
 f:file of user;
 g:file of temp;

procedure saveToFile(var A: tabel; var B:temp);
{IS. Terdefinisi data pelanggan dalam array
 FS. Mengosongkan file, menyimpan array data pelanggan dalam sebuah file .dat, dan menutup file-nya}
var
  i: integer;
  tempuser: user;
  temptemp: temp;
begin
  rewrite(f);
  rewrite(g);

    temptemp := B;
    write(g,temptemp);

    for i:=1 to length(A) do

    begin
        tempuser := A[i];
        write(f, tempuser);
    end;

    close(f);
    close(g);
end;

procedure readFromFile(var A: tabel; var B:temp);
{IS. -
 FS. Membuka file .dat yang sudah ada, atau membuat file .dat jika belum ada dan menyimpan datanya ke dalam array pelanggan}
var
  i: integer;
  tempuser: user;
  temptemp: temp;
begin
    if not(fileExists('data.dat')) then
    fileCreate('data.dat');

    assign(f,'data.dat');

    reset(f);

    if not(fileExists('temp.dat')) then
    fileCreate('temp.dat');

    assign(g,'temp.dat');

    reset(g);

    i:=1;
    while not eof(f) do
    begin
        read(f, tempuser);
        A[i]:= tempuser;
        i:=i+1;
    end;

    while not eof(g) do
    begin
        read(g, temptemp);
        B:=temptemp;
    end;
end;

 procedure daftar;
 begin
        clrscr;
        n.n:=n.n+1;
        writeln('----------------MENU DAFTAR ANGGOTA BARU---------------------');
        writeln;
        write('Masukan nama pengguna ');readln(a[n.n].nama);
        write('Masukan nik pengguna ');readln(a[n.n].nik);
        writeln();
        writeln('DATA BERHASIL DIBUAT!!!');
        writeln;
 end;

 procedure tambah;
 var
  temp : integer;
  temp1,temp2:real;
 begin
    clrscr;
    temp:=0;
    writeln('---------------MENU TAMBAH SAMPAH----------------------------');
    write('Masukan NIK : ');readln(x);
    for i:=1 to n.n do
     begin
      if a[i].nik = x then
       temp := i;
     end;
    if temp=0 then
     begin
     writeln('DATA TIDAK DITEMUKAN');
     end
    else
     begin
     write('Masukan jumlah sampah organik : ');readln(temp1);
     a[temp].orga:=a[temp].orga + temp1;
     write('Masukan jumlah sampah non organik : ');readln(temp2);
     a[temp].nonor:=a[temp].nonor + temp2;
     writeln('Data atas nama ',a[temp].nama,' berhasil ditambahkan!');
     writeln('Total sampah organik ',a[temp].orga:0:2,' kg');
     writeln('Total sampah non organik ',a[temp].nonor:0:2,' kg');

     end;
  end;

 procedure cari;
 var pil,temp:integer;
      temp1:string;
      temp2:longint;
 begin
    clrscr;
    temp:=0;
    writeln('----------------------MENU CARI-----------------------');
    writeln('1. Cari berdasarkan nama ');
    writeln('2. Cari berdasarkan NIK ');
    writeln('Masukan pilihan anda ');readln(pil);
    if pil=1 then
    begin
      write('Masukan nama yang ingin dicari ');readln(temp1);
        for i:=1 to n.n do
     begin
      if a[i].nama = temp1 then
       temp := i;
     end;
      if temp=0 then
        begin
        writeln('DATA TIDAK DITEMUKAN');
        end
     else
        begin
        writeln('DATA DITEMUKAN!');
        writeln('Nama : ', a[temp].nama);
        writeln('NIK : ',a[temp].nik);
        writeln('Jumlah sampah organik : ',a[temp].orga:0:2);
        writeln('Jumlah sampah non organik :',a[temp].nonor:0:2);
        end;
    end;

    if pil=2 then
    begin
      write('Masukan NIK yang ingin dicari ');readln(temp2);
      for i:=1 to n.n do
        begin
          if a[i].nik = temp2 then
          temp := i;
        end;
        if temp=0 then
          begin
            writeln('DATA TIDAK DITEMUKAN');
          end
     else
        begin
        writeln('DATA DITEMUKAN!');
        writeln('Nama : ', a[temp].nama);
        writeln('NIK : ',a[temp].nik);
        writeln('Jumlah sampah organik : ',a[temp].orga:0:2);
        writeln('Jumlah sampah non organik :',a[temp].nonor:0:2);
        end;
    end;
  end;


 procedure hapus;
 var  x:longint;
      temp:integer;
 begin
  clrscr;
  temp:=0;
  writeln('------------------MENU HAPUS DATA----------------------');
  writeln;
  write('Masukan NIK yang ingin dihapus : ');readln(x);
    for i:=1 to n.n do
     begin
      if a[i].nik = x then
       temp := i;
     end;
    if temp=0 then
     begin
     writeln('DATA TIDAK DITEMUKAN');
     end
    else
     begin
     writeln('Data atas nama ',a[temp].nama,' berhasil dihapus');
     for i:=temp to n.n do
        begin
        a[i].nama:=a[i+1].nama;
        a[i].nik:=a[i+1].nik;
        a[i].orga:=a[i+1].orga;
        a[i].nonor:=a[i+1].nonor;
        end;
     end;
     n.n:=n.n-1;

  end;


 procedure lihat;
 var pil,min:integer;
      pilc:char;
      temp1:string;
      temp2:longint;
      temp3,temp4:real;
      temp5:tabel;
      ix:integer;
 begin
  clrscr;
  writeln('----------------------------MENU LIHAT DATA--------------------------------');
  writeln('1.Urutkan data berdasarkan nama');
  writeln('2.Urutkan data berdasarkan NIK');
  writeln('3.Urutkan data berdasarkan sampah non organik');
  write('Masukan pilihan anda ');readln(pil);
  if pil=1 then
    begin
    for i:=n.n downto 2 do
      begin
      for j:=2 to i do
       begin
       if (a[j-1].nama[1] > a[j].nama[1]) then
          begin
          temp1:=a[j-1].nama;
          a[j-1].nama:=a[j].nama;
          a[j].nama:=temp1;

          temp2:=a[j-1].nik;
          a[j-1].nik:=a[j].nik;
          a[j].nik:=temp2;

          temp3:=a[j-1].orga;
          a[j-1].orga:=a[j].orga;
          a[j].orga:=temp3;

          temp4:=a[j-1].nonor;
          a[j-1].nonor:=a[j].nonor;
          a[j].nonor:=temp4;
          end;
       end;
      end;
    end;

  if pil=2 then
    begin
      for i:=1 to n.n-1 do
      begin
        min:=i;
        for j:=i+1 to n.n do
        begin
          if(a[j].nik < a[min].nik)then
            begin
            min:=j;
            end;
        end;
          temp2 := a[min].nik;
          a[min].nik := a[i].nik;
          a[i].nik := temp2;

          temp1:=a[min].nama;
          a[min].nama:=a[i].nama;
          a[i].nama:=temp1;

          temp3:=a[min].orga;
          a[min].orga:=a[i].orga;
          a[i].orga:=temp3;

          temp4:=a[min].nonor;
          a[min].nonor:=a[i].nonor;
          a[i].nonor:=temp4;

      end;
    end;
 if pil=3 then
 begin
  for i:= 2 to n.n do
     Begin
            temp5[i] := a[i];
            j:=i-1;
            while ((j>=1) and (a[j].nonor > temp5[i].nonor)) do
            Begin
             a[j+1]:=a[j];
             j:=j-1;
            end;
             a[j+1]:=temp5[i];
     end;
 end;

  for i:=1 to n.n do
  begin
    writeln(i,'.Nama : ',a[i].nama);
    writeln('  Nik : ',a[i].nik);
    writeln('  Sampah organik : ' ,a[i].orga:0:2);
    writeln('  Sampah non organik : ',a[i].nonor:0:2);
    writeln;
  end;

  write('Apakah anda ingin merubah data (y/n) ? ');readln(pilc);
  if ((pilc='y') or (pilc='Y')) then
   begin
      write('Masukan indeks yang ingin diubah : ');readln(ix);
      write('Masukan nama baru : ');readln(a[ix].nama);
      write('Masukan NIK baru : ');readln(a[ix].nik);
   end;

 end;

 procedure wargaterbaik;
 begin
    clrscr;
    writeln('--------------------------WARGA TERBAIK ADALAH-------------------------');
    writeln('------------------------------ENG ING ENG------------------------------');
    writeln();
    minx:=999;
    for i:=1 to n.n do
    begin
     if ((a[i].orga+a[i].nonor) < minx) then
        begin
        minx:=a[i].nonor+a[i].orga;
        n.ter:=i;
        end;
    end;

    writeln('Selamat kepada ', a[n.ter].nama,' Dengan NIK ',a[n.ter].nik);
 end;

 procedure tukarsampah;
 var
  x:longint;
  temp:integer;
  uang:real;
 begin
    clrscr;
    temp:=0;
    writeln('---------------------------MENU TUKER SAMPAH---------------------------');
    write('Masukan NIK : ');readln(x);
    for i:=1 to n.n do
     begin
      if a[i].nik = x then
       temp := i;
     end;
    if temp=0 then
     begin
     writeln('DATA TIDAK DITEMUKAN');
     end
    else
     begin
     if (a[i].nik <> a[n.ter].nik) then
     begin
         write('Data atas nama ',a[temp].nama,' berhak mendapatkan ');
         uang:=(a[temp].orga * 2500)+(a[temp].nonor * 4000);
         writeln('Rp.',uang:0:2);
         writeln('Data jumlah sampah pengguna sebelumnya akan dihapus');
         a[temp].nonor:=0;
         a[temp].orga:=0;
     end
     else
     begin
         write('Data atas nama ',a[temp].nama,' adalah warga terbaik!!, berhak mendapatkan ');
         uang:=((a[temp].orga * 2500)+(a[temp].nonor * 4000))*(105/100);
         writeln('Rp.',uang:0:2);
         writeln('Data jumlah sampah pengguna sebelumnya akan dihapus');
         a[temp].nonor:=0;
         a[temp].orga:=0;
     end;
    end;

 end;


 procedure menu;
 begin
        minx:=999;
        for i:=1 to n.n do
        begin
         if ((a[i].orga+a[i].nonor) < minx) then
            begin
            minx:=a[i].nonor+a[i].orga;
            n.ter:=i;
            end;
        end;
        clrscr;
        writeln('-----------------------------------------------------------');
        writeln('----------------PROGRAM PENGOLAH SAMPAH--------------------');
        writeln('-----------------------------------------------------------');
        writeln();
        writeln('1. Daftarkan pengguna baru');
        writeln('2. Input sampah pengguna');
        writeln('3. Cari data pengguna');
        writeln('4. Hapus data pengguna');
        writeln('5. Tampilkan semua data pengguna');
        writeln('6. Tampilkan warga terbaik');
        writeln('7. Tukarkan sampah');
        writeln('8. Exit');
        writeln();
        write('Masukan pilihan anda ');readln(pil);

        case pil of
                1:begin
                    daftar;
                  end;
                2:begin
                    tambah;
                  end;
                3:begin
                    cari;
                  end;
                4:begin
                    hapus;
                  end;
                5:begin
                    lihat;
                  end;
                6:begin
                    wargaterbaik;
                  end;
                7:begin
                    tukarsampah;
                  end;
                8:begin
                  end;
        end;
        writeln('Ingin tetap di program? (y/n) ');readln(pils);
        if (pils='y') then
         menu;
 end;


begin
clrscr;
readFromFile(a,n);
menu;


readln;
saveToFile(a,n);
end.




