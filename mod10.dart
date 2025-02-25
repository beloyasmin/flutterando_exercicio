import 'dart:io';

void main() {
  Mod mod1 = Mod('00000');
  mod1.validate(mod: '5419 8250 0346 1210');
}

class Mod {
  String mod;
  Mod(this.mod);

  dynamic validate({required String mod}) {
    var sum = 0;
    var rest = 0;

    //Retirando os espaços entre as Strings
    var numbers = mod.replaceAll(RegExp(" "), '');

    //Transformando numa lista de inteiros
    List<int> numberlist = numbers.split('').map(int.parse).toList();

    //Retirando o último digito
    var lastdigit = numberlist.last;

    List<int> newnumbers = numberlist.sublist(0, numberlist.length - 1);

    for (int i = 0; i < numberlist.length; i++) {
      var result = (i % 2 == 0) ? 2 : 1;
      var multiplication = numberlist[i] * result;
      if (multiplication > 9) {
        sum += (multiplication % 10) + (multiplication ~/ 10);
      } else {
        sum += multiplication;
      }
    }
    rest += sum % 10;

    if (rest == lastdigit) {
      print("CARTÃO VALIDO");
    } else {
      print("CARTÃO INVALIDO");
    }
    return;
  }
}
