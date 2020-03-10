import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTransferencias(),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Criando Transferência'),
        ),
        body: Column(
          children: <Widget>[
            Editor(controlador: _controladorCampoNumeroConta, rotulo: "Número da Conta", dica: "0000"),
            Editor(controlador: _controladorCampoValor, rotulo: "Valor", dica: "00.00", icone: Icons.monetization_on),
            RaisedButton(
              child: Text('Confirmar'),
              onPressed: () => _criaTransferencia(context),
            )
          ],
        ));
  }

  void _criaTransferencia(BuildContext context) {
     final int numeroConta =
        int.tryParse(_controladorCampoNumeroConta.text);
    final double valor =
        double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      debugPrint('$transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

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


class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias=List();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
          debugPrint('$transferenciaRecebida');
          //Verificação feita para o caso do usuário clicar em voltar sem preencher a transferência
          if(transferenciaRecebida != null){
            widget._transferencias.add(transferenciaRecebida);
          }

        });
      },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }


}
