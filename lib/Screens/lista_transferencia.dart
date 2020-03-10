
import 'package:bytebank/Components/item_transferencia.dart';
import 'package:bytebank/Models/transferencia.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'formulario_transferencia.dart';

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias=List();

  @override
  State<StatefulWidget> createState() {

    return ListaTransferenciasState();
  }
}

//State vai ser executado sempre que o Stateful Widget que o usa for interagido
class ListaTransferenciasState extends State<ListaTransferencias>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferências'),
      ),
      //ListViewBuilder é necessário para situações diânmicas. ListView comum para situações estáticas.
      body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, indice){
            return ItemTransferencia(widget._transferencias[indice]);
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add), onPressed: (){
        //MaterialPageRoute cria a rota para troca de tela já com todos os artefatos aderentes ao material design
        //Criar um future é útil para receber valores de volta uma vez que tivermos terminado com a tela
        final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context){
          return FormularioTransferencia();
        }));
        future.then((transferenciaRecebida){
          //Verificação feita para o caso do usuário clicar em voltar sem preencher a transferência
          if(transferenciaRecebida != null){
            setState(() {
              widget._transferencias.add(transferenciaRecebida);
            });

          }

        });
      },
      ),
    );
  }
}
