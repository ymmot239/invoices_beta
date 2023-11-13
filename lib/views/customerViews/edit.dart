import 'package:flutter/material.dart';

import '../../customer_provider.dart';
import '../../models/data_layer.dart';

import '../helperViews/List_Additions.dart';
import '../helperViews/logo_icon.dart';

import 'edit_house.dart';
import 'table_view.dart';

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
    return TableView(title: "Edit Customer Data", listTitles: [
      for (String x in Customer.fields) ...[
        Text(x,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black))
      ]
    ], listContents: [
      for (int x = 0; x < Customer.fields.length - 1; x++) ...[
        TextFormField(
          initialValue: customdata.toJson()[Customer.fields[x]],
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black),
          onFieldSubmitted: (String value) {
            Map<String, dynamic> temp = customdata.toJson();
            temp[Customer.fields[x]] = value;
            customerNotifier.value[widget.index] = Customer.fromJson(temp);
            setState(() {});
          },
        )
      ],
      ListAdditions(
          list: customdata.houses, newItem: newItem, editItem: editItem)
    ], rowFlex: [
      for (int x = 0; x < Customer.fields.length - 1; x++) ...[1],
      5
    ], columnFlex: [
      for (int x = 0; x < Customer.fields.length; x++) ...[(1, 2)],
    ]);
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
