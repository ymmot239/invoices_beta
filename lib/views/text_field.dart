import 'package:flutter/material.dart';

class TextField extends StatelessWidget {
  const TextField({super.key, this.init = ''});

  final String init;
  //final InputDecoration decor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: init,
      //decoration: decor,
    );
  }
}
