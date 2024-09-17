import 'dart:io';


void main(){
stdout.write('Selamat datang di Aplikasi Konversi suhu');
stdout.write('Masukan Suhu fahrenheit sekarang : ');
int fahrenheit = int.parse(stdin.readLineSync()!);
int celcius = (fahrenheit -32)* 5 ~/9 ;

print('Suhu dalam Fahrenheit sekarang adalah $fahrenheit  ');
print('Suhu dalam Celcius sekarang adalah $celcius  ');

}