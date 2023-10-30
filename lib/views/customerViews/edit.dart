import 'package:flutter/material.dart';

import '../../customer_provider.dart';
import '../../models/data_layer.dart';

import '../helperViews/List_Additions.dart';
import '../helperViews/logo_icon.dart';

import 'edit_house.dart';

class Edit extends StatefulWidget {
  final int index;
  const Edit({super.key, required this.index});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    Customer customdata = customerNotifier.value[widget.index];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Customer Data"),
        centerTitle: true,
        actions: const [LogoIcon()],
      ),
      body: Scrollbar(
        child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * .05,
                horizontal: constraints.maxWidth * .05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:
                  List<Widget>.generate(Customer.fields.length, (int index) {
                if (index == Customer.fields.length - 1) {
                  return Flexible(
                    flex: 5,
                    child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(children: [
                          Flexible(
                            flex: 1,
                            child: SizedBox(
                                width: double.infinity,
                                child: Text(Customer.fields[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.black))),
                          ),
                          Flexible(
                              flex: 2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            color: Colors.black, width: 2))),
                                child: ListAdditions(
                                    list: customdata.houses,
                                    newItem: newItem,
                                    editItem: editItem),
                              ))
                        ])),
                  );
                } else {
                  return Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 2,
                        )),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                                flex: 1,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text(Customer.fields[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.black)),
                                )),
                            Flexible(
                                flex: 2,
                                child: Container(
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            left: BorderSide(
                                                color: Colors.black,
                                                width: 2))),
                                    child: TextFormField(
                                      initialValue: customdata
                                          .toJson()[Customer.fields[index]],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: Colors.black),
                                      onFieldSubmitted: (String value) {
                                        Map<String, dynamic> temp =
                                            customdata.toJson();
                                        temp[Customer.fields[index]] = value;
                                        customerNotifier.value[widget.index] =
                                            Customer.fromJson(temp);
                                        setState(() {});
                                      },
                                    )))
                          ],
                        ),
                      ));
                }
              }),
            ),
          );
        }),
      ),
    );
  }

  void newItem() {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);

    final custom = General.createNew(House(name: "")) as House;

    customerNotifier.value[widget.index].houses =
        List<House>.from(customerNotifier.value[widget.index].houses)
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
