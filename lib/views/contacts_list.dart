import 'package:flutter/material.dart';

class contacts_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Contatos")),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text("Vovolixo"),
              subtitle: Text("nweonfiouwenfiu")
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add)
      ),
    );
  }
}
