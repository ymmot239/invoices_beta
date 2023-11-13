import 'package:flutter/material.dart';
import 'package:invoices_beta/views/customerViews/table_view.dart';

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
    return TableView(title: "Edit House Data", listTitles: [
      for (String x in House.fields) ...[
        Text(x,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black))
      ]
    ], listContents: [
      for (int x = 0; x < House.fields.length - 1; x++) ...[
        TextFormField(
          initialValue: housedata.toJson()[House.fields[x]].toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black),
          onFieldSubmitted: (String value) {
            Map<String, dynamic> temp = housedata.toJson();
            temp[House.fields[x]] = value;
            customerNotifier.value[widget.index].houses[widget.houseIndex] =
                House.fromJson(temp);
            setState(() {});
          },
        )
      ],
      ListAdditions(
        list: housedata.gutters,
        newItem: newItem,
        editItem: editItem,
      )
    ], rowFlex: [
      for (int x = 0; x < House.fields.length - 1; x++) ...[1],
      5
    ], columnFlex: [
      for (int x = 0; x < House.fields.length; x++) ...[(1, 2)],
    ]);
  }

  void newItem() {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    House housedata =
        customerNotifier.value[widget.houseIndex].houses[widget.index];
    final custom = General.createNew(Gutter(name: "", parts: [])) as Gutter;
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
