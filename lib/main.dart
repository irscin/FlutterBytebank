import 'package:bytebank/views/contacts_list.dart';
import 'package:bytebank/views/dashboard.dart';
import 'package:flutter/material.dart';

import 'views/form_editor.dart';

void main() => runApp(ByteBank());

class ByteBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: dashboard(),
    );
  }
}