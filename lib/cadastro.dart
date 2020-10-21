import 'package:flutter/material.dart';

enum TipoPessoa { fisica, juridica }

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
    var formKey = GlobalKey<FormState>();
  
  TipoPessoa _pessoa = TipoPessoa.fisica;
  
  var txtNomeRazaoSocial = TextEditingController();
  var txtNomeFantasia = TextEditingController();
  var txtCpfCnpj = TextEditingController();
  var txtEndereco = TextEditingController();
  var txtCEP = TextEditingController();
  var txtComplemento = TextEditingController();
  var txtEmail = TextEditingController();
  var txtTelefone = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro'),
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
                  children: <Widget>[
                    new Radio(
                      value: TipoPessoa.fisica,
                      groupValue: _pessoa,
                      onChanged: (
                        (TipoPessoa value) {
                        setState(() { _pessoa = value; });
                        }
                      ),
                    ),
                    new Text(
                      'Pessoa Física',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    new Radio(
                      value: TipoPessoa.juridica,
                      groupValue: _pessoa,
                      onChanged: (
                        (TipoPessoa value) {
                        setState(() { _pessoa = value; });
                        }
                      ),
                    ),
                    new Text(
                      'Pessoa Jurídica',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  logo()
                  ],
                ),
                new Divider(height: 5.0, color: Colors.black),
                new Align(
                  alignment: Alignment.center,
                  child: corpoCadastro(),  
                  ),
                  rodape(),
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

  Widget corpoCadastro(){
    return Container(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          campoTexto('Nome / Razão Social', txtNomeRazaoSocial),
          campoTexto('Nome Fantasia', txtNomeFantasia),
          campoTexto('CPF/CNPJ', txtCpfCnpj),
          campoTexto('Endereço', txtEndereco),
          campoTexto('Complemento', txtComplemento),
          campoTexto('Email', txtEmail),
          campoTexto('Telefone', txtTelefone),
          campoTexto('Senha', txtSenha),
        ],
      )
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
              fontSize: 16
          ),
          decoration: InputDecoration(
            labelText: rotulo,
            labelStyle: TextStyle(color: Colors.black,
                fontSize: 12
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

  Widget rodape(){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton(
            child: Row(
              children: [
                Text("Voltar",
                  style:TextStyle(
                  color:Colors.white,
                  fontSize: 18
          ),
        ),
              ],
            ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, '/login');
        }),
          RaisedButton(
            child: Row(
              children: [
                Text("Cadastrar",
                  style:TextStyle(
                  color:Colors.white,
                  fontSize: 18
          ),
        ),
              ],
            ),
        color: Theme.of(context).primaryColor,
        onPressed: () {
          caixaDialogo("Cadastrado com sucesso");
        }),
          
        ],
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
}