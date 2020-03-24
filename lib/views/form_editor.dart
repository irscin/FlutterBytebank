import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';

class form_editor extends StatelessWidget {
  final String name;
  final int numConta;
  final TextEditingController textEditControllerName = TextEditingController();
  final TextEditingController textEditingControllerConta = TextEditingController();

  //Contrutor
  form_editor({String this.name, int this.numConta});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adicionar Contato")),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: textEditControllerName,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                      labelText: "Nome do Contato",
                      hintText: "João da Silva"
                  ),
                  keyboardType: TextInputType.text,
                ),
                TextField(
                  controller: textEditingControllerConta,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(
                      labelText: "Número da Conta",
                      hintText: "12345"
                  ),
                  keyboardType: TextInputType.number,
                ),
                RaisedButton(
                  disabledColor: Colors.blue,
                  child: Text("Confirmar", style: TextStyle(color: Colors.white)),
                  onPressed: ()=>_criarContato(context),
                )
              ],
            ),
          ),

        ),
    );
  }

  void _criarContato(BuildContext context) {
    var numConta = int.tryParse(textEditingControllerConta.text);
    final String name = textEditControllerName.text;

    if(numConta != null && name != null){
      final contato = new contact(name, numConta);
      Navigator.pop(context, contato);
    }
  }
}
