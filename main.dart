import 'dart:io';

void main() {
  print("Digite a expressão: ");
  String expr = stdin.readLineSync() ?? '';
  List<String> splitStr = expr.split(' ');
  Lista pilha = Lista();

  for (int i = 0, len = splitStr.length; i < len; i++) {
    if (!isNumeric(splitStr[i]) &&
        splitStr[i] != "+" &&
        splitStr[i] != "-" &&
        splitStr[i] != "*" &&
        splitStr[i] != "/") {
      print("ERRO: Caractere inválido!");
      exit(0);
    }
  }

  for (int i = 0, len = splitStr.length; i < len; i++) {
    if (isNumeric(splitStr[i])) {
      pilha.push(double.tryParse(splitStr[i]));
      continue;
    }

    if (splitStr[i] == '+') {
      if (pilha.lista.length > 1 ) {
        double elem1 = pilha.pop();
        double elem2 = pilha.pop();
        double resultado = elem1 + elem2;
        pilha.push(resultado);
      } else{
				print("ERRO: Talvez você tenha colocado muitas operações");
				exit(0);
			}
    }
    if (splitStr[i] == '-') {
      if (pilha.lista.length > 1) {
        double elem1 = pilha.pop();
        double elem2 = pilha.pop();
        double resultado = elem1 - elem2;
        pilha.push(resultado);
      }else{
				print("ERRO: Talvez você tenha colocado muitas operações");
				exit(0);
			}
    }
    if (splitStr[i] == '*') {
      if (pilha.lista.length > 1) {
        double elem1 = pilha.pop();
        double elem2 = pilha.pop();
        double resultado = elem1 * elem2;
        pilha.push(resultado);
      }else{
				print("ERRO: Talvez você tenha colocado muitas operações");
				exit(0);
			}
    }
    if (splitStr[i] == '/') {
      if (pilha.lista.length > 1) {
        double elem1 = pilha.pop();
        double elem2 = pilha.pop();
        double resultado = elem1 / elem2;
        pilha.push(resultado);
      }else{
				print("ERRO: Talvez você tenha colocado muitas operações");
				exit(0);
			}
    }
  }

  if (pilha.lista.length != 1) {
    print("Erro: Talvez você tenha colocado muitos números");
	}else {
    print(pilha.lista);
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

class Lista {
  var lista = [];

  Lista() {
    this.lista = [];
  }
  //funçao push
  void push(var add) {
    this.lista = this.lista + [add];
  }

  //função pop
  pop() {
    var temp = this.lista;
    var retorno = this.lista[lista.length - 1];
    this.lista = [];
    for (int i = 0; i < temp.length - 1; i++) {
      this.lista = this.lista + [temp[i]];
    }
    return retorno;
  }
}