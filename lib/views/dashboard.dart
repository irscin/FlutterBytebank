import 'package:bytebank/views/contacts_list.dart';
import 'package:flutter/material.dart';

class dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text("ByteBank")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/bytebank_logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Material(
                  color: Colors.green,
                  child: InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>contacts_list()));
                    },
                    child: Container(
                        height: 100,
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.people),
                              Text('Contatos',
                                  style: TextStyle(
                                      fontSize: 24.0
                                  ))
                            ],
                          ),
                        )
                    ),
                  ),
                ),
              )
            ],
          )
      );
  }
}