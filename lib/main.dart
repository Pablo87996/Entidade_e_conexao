import 'package:flutter/material.dart';
import 'package:primeiro_app/app/injection.dart';

import 'app/my_app.dart';

void main() {
  setupinjection();
  runApp(MyApp());
}


/*void main() async{
  await buscarDados();
  print('Carrega a tela');
  print('Botões');
  print('Campos');
  print('Imagens');

}

Future buscarDados() {
  return Future.delayed(Duration(seconds: 5), () => print('Carregou os dados'));
}*/
