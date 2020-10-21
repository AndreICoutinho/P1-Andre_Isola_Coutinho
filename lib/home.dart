import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                Text('MOTOBOY EXPRESSO',
                  style: TextStyle(
                  fontSize: 36,
                )),
                Text('"Seriedade e Confiança"',
                  style: TextStyle(
                  fontSize: 30,
                )),
                botaoEntrar(),
              ],
            ),
          ),
        ),
    );
  }

  Widget logo(){
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Text('Bem vindo ao:',
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
      child: FloatingActionButton(
        child: (
          Icon(Icons.arrow_forward)
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/Apresentacao');
        },

      ),
    );
  }
}