import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Principal'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Bem Vindo!', style: TextStyle(fontSize: 16)),
                    Text('André I. Coutinho!', style: TextStyle(fontSize: 26)),
                    logo()
                  ],
                ),
                new Divider(height: 5.0, color: Theme.of(context).primaryColor),
                new Column(
                  children: [
                    Text('Menu', style: TextStyle(fontSize: 36),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(children: [corpoMenu()]),
                        Column(children: [ultimaFatura()]),
                    ],)
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }

  Widget logo(){
    return Container(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
        Image.asset('lib/assets/logo.jpeg'),
        ]
      ) 
    );
  }

  Widget corpoMenu(){
    return Container(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          botaoCadastro("Alterar cadastro"),
          botaoCadastro("Solicitar serviço"),
          botaoCadastro("Verificar fatura"),
          botaoCadastro("Serviços realizados"),
          botaoContato(),
        ],
      )
    );
  }

  Widget botaoCadastro(titulo){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: RaisedButton(
        child: Text(titulo,
          style:TextStyle(
              color:Colors.white,
              fontSize: 18
          ),
        ),
        color: Theme.of(context).primaryColor,

        //
        // Evento ocorrerá quando o usuário clicar no botão
        //
        onPressed: () {
          caixaDialogo('Confirma: ' + titulo + " ?");
        },

      ),
    );
  }

  Widget botaoContato(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: RaisedButton(
        child: Text("Fale conosco",
          style:TextStyle(
              color:Colors.white,
              fontSize: 18
          ),
        ),
        color: Theme.of(context).primaryColor,

        //
        // Evento ocorrerá quando o usuário clicar no botão
        //
        onPressed: () {
          Navigator.pushNamed(context, '/Contato');
        },

      ),
    );
  }

  caixaDialogo(msg){
    return showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Mensagem',style:TextStyle(fontSize: 12)),
            content: Text(msg, style:TextStyle(fontSize: 24)),
            actions: [
              FlatButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: Text('fechar')
              )
            ],
          );
        }
    );
  }

  Widget ultimaFatura(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('Última Fatura:', style: TextStyle(fontSize: 24)),
          Text(' ', style: TextStyle(fontSize: 24)),
          Text('Valor:', style: TextStyle(fontSize: 18)),
          Text(' 236,49', style: TextStyle(fontSize: 20)),
          Text(' ', style: TextStyle(fontSize: 14)),
          Text('Vencimento:', style: TextStyle(fontSize: 18)),
          Text(' 08/10/2020', style: TextStyle(fontSize: 20)),
        ],
      )
    );
  }
}

