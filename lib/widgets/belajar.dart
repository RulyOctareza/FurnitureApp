import 'dart:io';

void main(){
stdout.write('Masukan nama Kamu : ');
String name = stdin.readLineSync()!;
stdout.write('Usia: ');
int age = int.parse(stdin.readLineSync()!);

print('Halo $name, usia anda $age tahun');

}