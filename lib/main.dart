import 'package:flutter/material.dart';

import './home.dart';
import './apresentacao.dart';
import './login.dart';
import './menu.dart';
import './cadastro.dart';
import './contato.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'ListView',
    initialRoute: '/Home',
    routes: {
      '/Home': (context) => Home(),
      '/Apresentacao': (context) => Apresentacao(),
      '/login': (context) => TelaLogin(),
      '/Menu': (context) => Menu(),
      '/Cadastro': (context) =>Cadastro(),
      '/Contato': (context) => Contato(),
    },
  ));
}
