import 'package:flutter/material.dart';

import '../../customer_provider.dart';
import '../../models/data_layer.dart';

import '../helperViews/List_Additions.dart';
import '../helperViews/logo_icon.dart';

import './edit_Gutter.dart';

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
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * .05,
                horizontal: constraints.maxWidth * .05),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List<Widget>.generate(
                  House.fields.length,
                  (int index) {
                    if (index != House.fields.length - 1) {
                      return Flexible(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child: Row(children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                  width: double.infinity,
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
                                    decoration: const BoxDecoration(
                                        //color: Theme.of(context).primaryColorDark,
                                        border: Border(
                                            left: BorderSide(
                                                color: Colors.black,
                                                width: 2))),
                                    child: TextFormField(
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
                                        Map<String, dynamic> temp =
                                            housedata.toJson();
                                        temp[House.fields[index]] = value;
                                        customerNotifier
                                                .value[widget.houseIndex]
                                                .Houses[widget.index] =
                                            House.fromJson(temp);
                                        setState(() {});
                                      },
                                    )))
                          ]),
                        ),
                      );
                    }
                    return Flexible(
                      flex: 5,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                width: double.infinity,
                                child: Text(House.fields[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: Colors
                                                .black) //Theme.of(context).primaryColor),
                                    ),
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        left: BorderSide(
                                            color: Colors.black, width: 2))),
                                child: ListAdditions(
                                    list: housedata.Gutters,
                                    newItem: newItem,
                                    editItem: editItem),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )),
          );
        }),
      ),
    );
  }

  void newItem() {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    House housedata =
        customerNotifier.value[widget.houseIndex].Houses[widget.index];
    final custom = Gutter(
        Name: "gutter ${housedata.Gutters.length}",
        parts: [Parts.createNew(Section(Name: "Name"))]);
    housedata.Gutters = List<Gutter>.from(housedata.Gutters)..add(custom);

    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  void editItem(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => EditGutter(
          gutterIndex: index,
          houseIndex: widget.houseIndex,
          index: widget.index,
        ),
      ),
    );
  }
}
