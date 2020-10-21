import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  //Declarar uma chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  //Declaração dos atributos que serão responsáveis por armazenar os
  //valores informados nos campos de texto
  var txtlogin = TextEditingController();
  var txtSenha = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(40),

        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              logo(),
              campoTexto('LOGIN:', txtlogin),
              campoTexto('SENHA:', txtSenha),
              dropDown(),
              botaoEntrar(),
              botaoCadastro(),
            ],
          ),
        ),

      ),
    );
  }

  Widget logo(){
    return Container(
      width: 100,
      height: 100,
      child: Image.asset('lib/assets/logo.jpeg'),
    );
  }

  Widget campoTexto(rotulo, controle){

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(

          keyboardType: TextInputType.text,
          //Habilitar campo para senha
          //obscureText: true,

          style: TextStyle(
              color:Theme.of(context).primaryColor,
              fontSize: 30
          ),
          decoration: InputDecoration(
            labelText: rotulo,
            labelStyle: TextStyle(color: Colors.black,
                fontSize: 18
            ),
          ),

          //Indicação do atributo que receberá o valor informado
          controller: controle,

          //Validação do valor fornecedido

          validator: (value){
            return (value.isEmpty) ? "Informe os dados de acesso" : null;
          },

        )
    );
  }

  String dropdownValue = 'Pessoa Física';

  Widget dropDown() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_downward),
        iconSize: 20,
        elevation: 16,
        style: TextStyle(
          color: Colors.black,
        ),
        underline: Container(
          height: 2,
          color: Theme.of(context).primaryColor,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Pessoa Física', 'Pessoa Jurídica']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 30,
                )
              ),
            );
          })
          .toList(),
      ),
    );
  }


  Widget botaoEntrar(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: RaisedButton(
        child: Text("Entrar",
          style:TextStyle(
              color:Colors.white,
              fontSize: 18
          ),
        ),
        color: Theme.of(context).primaryColor,

        //
        // Evento ocorrerá quando o usuário clicar no botão
        //
        onPressed: (){
          //validator.
          if (formKey.currentState.validate()){


            setState(() {
              if (txtlogin.text == 'andre' ){
                if(txtSenha.text == 'andre'){
                  Navigator.pushNamed(context, '/Menu');
                  caixaDialogo(
                      'Seja bem Vindo'
                  ); }
                else {
                  txtlogin.text = "";
                  txtSenha.text = "";
                  caixaDialogo(
                      'ERRO! Tente novamente'
                  );


                }} else {
                txtlogin.text = "";
                txtSenha.text = "";
                caixaDialogo(
                    'ERRO! Tente novamente'
                );


              }
            });
          }


        },

      ),
    );
  }

  Widget botaoCadastro(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: RaisedButton(
        child: Text("Cadastre-se",
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
          Navigator.pushNamed(context, '/Cadastro');
        },

      ),
    );
  }
  //
  // Caixa de Diálogo para exibição de mensagens
  //
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
}