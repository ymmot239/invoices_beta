import 'package:flutter/material.dart';

import '../../customer_provider.dart';
import '../../models/data_layer.dart';

import '../helperViews/List_Additions.dart';
import '../helperViews/logo_icon.dart';

import 'edit_gutter.dart';

class EditHouse extends StatefulWidget {
  final int index;
  final int houseIndex;
  const EditHouse({super.key, required this.houseIndex, required this.index});
  @override
  State<EditHouse> createState() => _EditHouseState();
}

class _EditHouseState extends State<EditHouse> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    House housedata =
        customerNotifier.value[widget.houseIndex].houses[widget.index];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit House Data"),
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
                              child: SizedBox(
                                  width: double.infinity,
                                  child: Text(House.fields[index],
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
                                          ?.copyWith(color: Colors.black),
                                      onFieldSubmitted: (String value) {
                                        Map<String, dynamic> temp =
                                            housedata.toJson();
                                        temp[House.fields[index]] = value;
                                        customerNotifier
                                                .value[widget.houseIndex]
                                                .houses[widget.index] =
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
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(House.fields[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.black)),
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
                                    list: housedata.gutters,
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
        customerNotifier.value[widget.houseIndex].houses[widget.index];
    final custom = Gutter(
        name: "gutter ${housedata.gutters.length}",
        parts: [Parts.createNew(Section(name: "Name"))]);
    housedata.gutters = List<Gutter>.from(housedata.gutters)..add(custom);

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
