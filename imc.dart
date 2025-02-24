import 'dart:io';

void main() {
  print(imc());
}

double imc() {
  print('Digite sua altura');
  String? heightString = stdin.readLineSync();
  double height = double.parse(heightString!);

  print('Digite seu peso');
  String? weightString = stdin.readLineSync();
  double weight = double.parse(weightString!);

  var imc = weight / (height * height);

  if (imc < 18) {
    print('Você está abaixo do seu peso ideal');
  } else if (imc > 18 && imc < 25) {
    print('Você está no peso ideal');
  } else {
    print('Você está acima do peso');
  }
  return imc;
}
