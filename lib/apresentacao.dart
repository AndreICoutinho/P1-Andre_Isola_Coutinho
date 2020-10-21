import 'package:flutter/material.dart';

class Apresentacao extends StatefulWidget {
  @override
  _ApresentacaoState createState() => _ApresentacaoState();
}

class _ApresentacaoState extends State<Apresentacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                logo(),
                new Align(
                  alignment: Alignment.center,
                  child: new Text('"Este aplicativo foi  projetado e desenvolvido por seu mentor o Sr. André Isola Coutinho com o objetivo de trazer soluções rápidas para o serviço de entrega de documentos e encomendas urgentes. Sua atuação abrange toda a área da cidade de Ribeirão Preto - SP e cidades adjacentes (com raio de até 80 KM de distância)."',
                    style: TextStyle(
                    fontSize: 18,  
                ))),
                botaoEntrar(),
              ],
            ),
          ),
        ),
    );
  }

  Widget logo(){
    return Container(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text('MOTOBOY EXPRESSO:',
          style: TextStyle(
          fontSize: 24,
        )),
        Image.asset('lib/assets/logo.jpeg'),
        ]
      ) 
    );
  }

  Widget botaoEntrar(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: (
              Icon(Icons.arrow_forward)
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },

          ),
          Container(
            width: 150,
            child: 
            Image.asset('lib/assets/me.jpeg')),
        ],
      ),
    );
  }
}