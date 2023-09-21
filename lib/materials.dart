//import 'dart:js_interop';

import 'package:flutter/material.dart';

import 'edit.dart';
import 'logo_icon.dart';

class Materials extends StatefulWidget {
  const Materials({super.key});

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  final List<dynamic> listSelection = [
    {
      'id': 0,
      'header': 'Tap to add customer',
      'icon': const Icon(Icons.add_circle_outlined),
      //'taps': _addNewUploadDoc(),
    },
  ];

  //int _selected = 0;
  int index = 0;
  int _count = 1;
  //late List<Widget> _upload = List.generate(_count, (int i) => Materials());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Material'),
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme,
          actions: [LogoIcon()],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ListView.separated(
                itemCount: _count,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(listSelection[index]['header']),
                        onTap: () {
                          if (index != _count - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Edit(customdata: listSelection[index]),
                              ),
                            );
                          } else {
                            _addNewCustomer();
                          }
                        },
                        leading: listSelection[index]['icon'],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
              ))
            ],
          ),
        ),
      );
    });
  }

  void _addNewCustomer() {
    setState(() {
      listSelection.insert(_count - 1, {
        'id': _count,
        'header': 'unnamed customer ' + (_count).toString(),
        //'icon': Icon(Icons.add_circle_outlined),
      });
      _count++;
    });
  }
}
