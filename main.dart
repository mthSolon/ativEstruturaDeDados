import 'dart:io';

void main() {
  print("Digite a expressão: ");
  String expr = stdin.readLineSync() ?? '';
  List<String> splitStr = expr.split(' ');
  List<String> pilha = [];

  for (int i = 0, len = splitStr.length; i < len; i++) {
    if (isNumeric(splitStr[i])) {
      pilha.add(splitStr[i]);
			print(splitStr);
      continue;
			
    }

    if (splitStr[i] == '+') {
      if (pilha.length > 1) {
        String elem1 = pilha[pilha.length - 2];
        String elem2 = pilha[pilha.length - 1];
        double resultado = double.tryParse(elem1)! + double.tryParse(elem2)!;
        pilha.remove(elem1);
        pilha.remove(elem2);
        pilha.add(resultado.toString());
      }
    }
    if (splitStr[i] == '-') {
      if (pilha.length > 1) {
        String elem1 = pilha[pilha.length - 2];
        String elem2 = pilha[pilha.length - 1];
        double resultado = double.tryParse(elem1)! - double.tryParse(elem2)!;
        pilha.remove(elem1);
        pilha.remove(elem2);
        pilha.add(resultado.toString());
      }
    }
    if (splitStr[i] == '*') {
      if (pilha.length > 1) {
        String elem1 = pilha[pilha.length - 2];
        String elem2 = pilha[pilha.length - 1];
        double resultado = double.tryParse(elem1)! * double.tryParse(elem2)!;
        pilha.remove(elem1);
        pilha.remove(elem2);
        pilha.add(resultado.toString());
      }
    }
    if (splitStr[i] == '/') {
      if (pilha.length > 1) {
        String elem1 = pilha[pilha.length - 2];
        String elem2 = pilha[pilha.length - 1];
        double resultado = double.tryParse(elem1)! / double.tryParse(elem2)!;
        pilha.remove(elem1);
        pilha.remove(elem2);
        pilha.add(resultado.toString());
      }
    }
  }
  if (pilha.length != 1) {
    print(
        "Algum erro aconteceu. Verifique se você separou os elementos com espaço.");
  } else {
    print(pilha);
  }
}

bool isNumeric(String s) {
  if (s.isEmpty) {
    return false;
  }

  final number = num.tryParse(s);
  if (number == null) {
    return false;
  }
  return true;
}
