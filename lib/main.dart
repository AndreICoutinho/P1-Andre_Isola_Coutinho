import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import './home.dart';
import './apresentacao.dart';
import './login.dart';
import './menu.dart';
import './cadastro.dart';
import './contato.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 

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

  // teste do firebase
var db = FirebaseFirestore.instance;
    db.collection("cadastros").add(
      {
        "Razao Social": "santana",
            "Nome Fantasia": "santana",
            "CNPJ": "santana",
            "Endereço": "santana",
            "Complemento": "santana",
            "Email": "santana",
            "Telefone": "santana",
            "Senha": "santana",
      }
    );
      db.collection("usuarios").add(
  {

   "login": "santana",
   "senha": "santana"

   }

    );

    print("Documento adicionado com sucesso!");
}
