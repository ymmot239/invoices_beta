//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

import 'edit.dart';
import 'logo_icon.dart';

class Materials extends StatefulWidget {
  const Materials({super.key});

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  List<dynamic> listSelection = [];
  int index = 0;
  int _count = 1;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    listSelection = [
      {
        'id': 0,
        'header': 'Tap to add customer',
        'icon': const Icon(Icons.add_circle_outlined),
        //'taps': _addNewUploadDoc(),
      },
    ];
  }

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
                  child: Scrollbar(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: _count,
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
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
                ),
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

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
