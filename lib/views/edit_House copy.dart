//import 'dart:js_interop';

//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:invoices_beta/customer_provider.dart';
import 'package:invoices_beta/views/List_Additions.dart';

import 'logo_icon.dart';
import 'package:invoices_beta/models/data_layer.dart';

class EditHouse extends StatefulWidget {
  final int index;
  final int houseIndex;
  const EditHouse({super.key, required this.houseIndex, required this.index});
  @override
  State<EditHouse> createState() => _EditHouseState();
}

class _EditHouseState extends State<EditHouse> {
  //late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    //_controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    House housedata =
        customerNotifier.value[widget.houseIndex].Houses[widget.index];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit House Data"),
        // TextFormField(
        //   textAlign: TextAlign.center,
        //   initialValue: housedata.name,
        //   style: Theme.of(context).textTheme.bodyLarge,
        //   onFieldSubmitted: (String value) {
        //     housedata.name = value;
        //     setState(() {});
        //   },
        // ),
        centerTitle: true,
        actions: const [LogoIcon()],
      ),
      body: Scrollbar(
        child: LayoutBuilder(builder: (context, constraints) {
          return Container(
            height: constraints.maxHeight * .9,
            child: Column(children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: constraints.maxHeight * .05,
                    horizontal: constraints.maxWidth * .05),
                child: Wrap(
                  children:
                      List<Widget>.generate(House.fields.length, (int index) {
                    return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: Container(
                                width: double.infinity,
                                alignment: Alignment.center,
                                height: (() {
                                  if (index == House.fields.length - 1) {
                                    return constraints.maxHeight * .6;
                                  }
                                  return constraints.maxHeight * .1;
                                })(),
                                decoration: BoxDecoration(
                                    //color: Theme.of(context).primaryColorDark,
                                    border: Border.all(
                                  color: Colors
                                      .black, //Theme.of(context).primaryColorLight,
                                  width: 2,
                                )),
                                padding: EdgeInsets.all(8.0), //BoxDecoration
                                child: Text(House.fields[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Colors
                                                .black) //Theme.of(context).primaryColor),
                                    )),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              //height: double.infinity,
                              height: (() {
                                if (index == House.fields.length - 1) {
                                  return constraints.maxHeight * .6;
                                }
                                return constraints.maxHeight * .1;
                              })(),
                              decoration: BoxDecoration(
                                  //borderRadius: BorderRadius.circular(10),
                                  //color: Colors.red,
                                  border: Border.all(
                                color: Colors
                                    .black, //Theme.of(context).primaryColorDark,
                                width: 2,
                              )),
                              padding: EdgeInsets.all(8.0),
                              child: (() {
                                if (index != House.fields.length - 1) {
                                  return TextFormField(
                                    initialValue: housedata
                                        .toJson()[House.fields[index]]
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Colors
                                                .black), //Theme.of(context).primaryColor),
                                    onFieldSubmitted: (String value) {
                                      housedata.Name = value;
                                      setState(() {});
                                    },
                                  );
                                }
                                return ListAdditions(
                                    list: housedata.Gutters,
                                    newItem: newItem,
                                    editItem: editItem);
                              })(),
                            ),
                          ),
                        ]);
                  }),
                ),
              )
            ]),
          );
        }),
      ),
    );
  }

  void newItem() {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);

    final custom = Gutter(
        Name:
            "gutter ${customerNotifier.value[widget.houseIndex].Houses[widget.index].Gutters.length}",
        parts: []);

    customerNotifier.value[widget.houseIndex].Houses[widget.index].Gutters =
        List<Gutter>.from(customerNotifier
            .value[widget.houseIndex].Houses[widget.index].Gutters)
          ..add(custom);
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  void editItem(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EditHouse(
          houseIndex: widget.index,
          index: index,
        ),
      ),
    );
  }
}
