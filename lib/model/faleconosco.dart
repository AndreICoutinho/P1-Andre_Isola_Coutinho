// ignore: camel_case_types
class faleconosco {
String id;
String assunto;
String mensagem;

faleconosco(this.id,this.assunto,this.mensagem);

faleconosco.fromMap(Map<String,dynamic> map, String id){

  this.id = id;
  this.assunto = map ['assunto'];
  this.mensagem = map ['mensagem'];
}
}