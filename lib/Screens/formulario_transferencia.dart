import 'package:bytebank/Components/editor.dart';
import 'package:bytebank/Models/transferencia.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../main.dart';

class FormularioTransferencia extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia>{
  final TextEditingController _controladorCampoNumeroConta =
  TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Editor(controlador: _controladorCampoNumeroConta, rotulo: "Número da Conta", dica: "0000"),
                Editor(controlador: _controladorCampoValor, rotulo: "Valor", dica: "00.00", icone: Icons.monetization_on),
                RaisedButton(
                  child: Text('Confirmar'),
                  onPressed: () => _criaTransferencia(context),
                )
              ],
            )
        ));
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta =
    int.tryParse(_controladorCampoNumeroConta.text);
    final double valor =
    double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
