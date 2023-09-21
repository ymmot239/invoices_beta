//import 'dart:js_interop';

import 'package:flutter/material.dart';

import 'logo_icon.dart';

class Edit extends StatefulWidget {
  final dynamic customdata;
  const Edit({super.key, required this.customdata});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          TextButton(
            child: Text(
                widget.customdata.toString().substring(
                    widget.customdata.toString().indexOf("header") + 8,
                    widget.customdata.toString().indexOf("}")),
                style: Theme.of(context).appBarTheme.titleTextStyle),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              //Navigator.pop(context);
            },
            child: const Icon(Icons.edit),
          )
        ]),
        //backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        actions: [LogoIcon()],
        //iconTheme: Theme.of(context).iconTheme,
      ),
      body: const Center(
        child: Placeholder(),
      ),
    );
  }
}
