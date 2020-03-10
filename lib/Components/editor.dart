import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  //Parametros opcionais nomeados não podem ser privados
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icone;

  //Construtor do meu widget de reuso
  Editor({TextEditingController this.controlador, String this.rotulo, String this.dica, IconData this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          //Permitindo que campos que não tem ícone possam ocupar o espaço disponível completamente
            icon: icone != null ? Icon(icone) : null,
            labelText: rotulo, hintText: dica),
        keyboardType: TextInputType.number,
      ),
    );
  }
}