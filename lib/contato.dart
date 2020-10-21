import 'package:flutter/material.dart';

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {

  //Declarar uma chave que identifica unicamente o formulário
  var formKey = GlobalKey<FormState>();

  //Declaração dos atributos que serão responsáveis por armazenar os
  //valores informados nos campos de texto
  var txtAssunto = TextEditingController();
  var txtMensagem = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fale Conosco'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                logo(),
                assunto(),
                mensagem(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    botao('voltar', '/Menu'),
                    botao('enviar', '/Apresentacao'),
                ]),
                footer(),
              ],
            ),
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

  Widget assunto(){

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(

          keyboardType: TextInputType.text,

          style: TextStyle(
              color:Theme.of(context).primaryColor,
              fontSize: 30
          ),
          decoration: InputDecoration(
            labelText: 'Assunto:',
            labelStyle: TextStyle(color: Colors.black,
                fontSize: 18
            ),
            border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(0.0),
          ),
          borderSide: new BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
          ),

          //Indicação do atributo que receberá o valor informado
          controller: txtAssunto,

          //Validação do valor fornecedido

          validator: (value){
            return (value.isEmpty) ? "Informe os dados de acesso" : null;
          },

        )
    );
  }

  Widget mensagem(){

    return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        child: TextFormField(

          keyboardType: TextInputType.multiline,
          maxLines: null,

          style: TextStyle(
              color:Theme.of(context).primaryColor,
              fontSize: 30
          ),
          decoration: InputDecoration(
            labelText: "Mensagem:",
            labelStyle: TextStyle(color: Colors.black,
                fontSize: 18
            ),
            border: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(0.0),
          ),
          borderSide: new BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
          ),

          //Indicação do atributo que receberá o valor informado
          controller: txtMensagem,

          //Validação do valor fornecedido

          validator: (value){
            return (value.isEmpty) ? "Informe os dados de acesso" : null;
          },

        )
    );
  }
  
  Widget botao(texto, rota){
    return Container(
      padding: EdgeInsets.only(top:20),
      child: RaisedButton(
        child: Text(texto,
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
          Navigator.pushNamed(context, rota);
        },

      ),
    );
  }

  Widget footer() {
    return Container(
      padding: EdgeInsets.only(top:20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Fale conosco:', style: TextStyle(fontSize: 22)),
              Text(' ', style: TextStyle(fontSize: 22)),
              Text('Tel: (16)99999-9999', style: TextStyle(fontSize: 16)),
              Text('Emergências: 0800-080-1000', style: TextStyle(fontSize: 16)),
          ],),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('De Seg. à Sab', style: TextStyle(fontSize: 20)),
              Text('Das 08:00 às 20:00', style: TextStyle(fontSize: 18)),
          ],),
        ]
      ),

    );
  }
}