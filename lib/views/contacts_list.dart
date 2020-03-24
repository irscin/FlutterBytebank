
import 'package:bytebank/views/form_editor.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/models/contact.dart';

class contacts_list extends StatefulWidget {
  final List<contact> _contact=List();
  @override
  _contacts_listState createState() => _contacts_listState();
}

class _contacts_listState extends State<contacts_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lista de Contatos")),
      body: ListView.builder(
        itemCount: widget._contact.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
                title: new Text(widget._contact[index].name),
                subtitle: new Text(widget._contact[index].getConta())
            )
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final Future<contact> future = Navigator.push(context, MaterialPageRoute(builder: (context){
            return form_editor();
          }));
          future.then((contact){
            if(contact!=null){
              setState(() {
                widget._contact.add(contact);
              });
            }
          });
        },
        child: Icon(Icons.add)
      ),
    );
  }
}
