//import 'dart:js_interop';

//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:invoices_beta/customer_provider.dart';
import 'package:invoices_beta/views/List_Additions.dart';
import 'package:invoices_beta/views/edit_House.dart';

import 'logo_icon.dart';
import 'package:invoices_beta/models/data_layer.dart';

class Edit extends StatefulWidget {
  final int index;
  const Edit({super.key, required this.index});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
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
    Customer customdata = customerNotifier.value[widget.index];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Customer Data"),
        // TextFormField(
        //   textAlign: TextAlign.center,
        //   initialValue: customdata.name,
        //   style: Theme.of(context).textTheme.bodyLarge,
        //   onFieldSubmitted: (String value) {
        //     customdata.name = value;
        //     setState(() {});
        //   },
        // ),
        centerTitle: true,
        actions: const [LogoIcon()],
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Column(children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * .05,
                horizontal: constraints.maxWidth * .05),
            child: Wrap(
              children:
                  List<Widget>.generate(Customer.fields.length, (int index) {
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            height: (() {
                              if (index == Customer.fields.length - 1) {
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
                            child: Text(Customer.fields[index],
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
                            if (index == Customer.fields.length - 1) {
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
                            if (index != Customer.fields.length - 1) {
                              return TextFormField(
                                initialValue:
                                    customdata.toJson()[Customer.fields[index]],
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: Colors
                                            .black), //Theme.of(context).primaryColor),
                                onFieldSubmitted: (String value) {
                                  customdata.Name = value;
                                  setState(() {});
                                },
                              );
                            }
                            return ListAdditions(
                                list: customdata.Houses,
                                newItem: newItem,
                                editItem: editItem);
                          })(),
                        ),
                      ),
                    ]);
              }),
            ),
          )
        ]);
      }),
    );
  }

  void newItem() {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);

    final custom = House(
        Name: "untitled ${customerNotifier.value[widget.index].Houses.length}");

    customerNotifier.value[widget.index].Houses =
        List<House>.from(customerNotifier.value[widget.index].Houses)
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
