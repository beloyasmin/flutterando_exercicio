import 'dart:io';

void main() {
  Cpf mycpf = Cpf('000000');
  mycpf.validate();
}

class Cpf {
  final String cpf;
  Cpf(this.cpf);

  dynamic validate() {
    print("Digite o seu cpf");
    String? newcpf = stdin.readLineSync();
    var cpfnew = newcpf!.replaceAll(RegExp(r'[\.\-]'), '');

    //validando a entrada do usuário
    if (cpfnew == null || !RegExp(r'^\d{11}$').hasMatch(cpfnew)) {
      print("Digite o CPF corretamente");
    }
    //Transformando em uma lista de inteiros
    List<int> cpflist = cpfnew.split('').map(int.parse).toList();

    //Dividindo o digito verificador (primeiro e segundo)

    var firstdigit = calculator(cpflist.sublist(0, 9));
    var twodigit = calculator(cpflist.sublist(0, 9)..add(firstdigit));

    if (firstdigit == cpflist[9] && twodigit == cpflist[10]) {
      print('O CPF ESTÁ CORRETO');
    } else {
      print('CPF ESTÁ INVÁLIDO');
    }
    return;
  }

  dynamic calculator(List<int> cpf) {
    List<int> fatores =
        List.generate(cpf.length, (i) => i + 2).reversed.toList();
    int soma = List.generate(cpf.length, (i) => cpf[i] * fatores[i])
        .reduce((a, b) => a + b);

    int resto = soma % 11;
    return resto < 2 ? 0 : 11 - resto;
  }
}
