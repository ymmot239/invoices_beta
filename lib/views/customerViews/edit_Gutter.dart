import 'package:flutter/material.dart';
import 'package:invoices_beta/views/customerViews/table_view.dart';

import '../../customer_provider.dart';
import '../../models/data_layer.dart';

import '../helperViews/helper_views.dart';

class EditGutter extends StatefulWidget {
  final int index;
  final int houseIndex;
  final int gutterIndex;
  const EditGutter(
      {super.key,
      required this.gutterIndex,
      required this.houseIndex,
      required this.index});
  @override
  State<EditGutter> createState() => _EditGutterState();
}

class _EditGutterState extends State<EditGutter> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    Gutter gutterdata = customerNotifier.value[widget.houseIndex]
        .houses[widget.index].gutters[widget.gutterIndex];
    return TableView(title: "Edit Gutter", listTitles: [
      for (String x in Gutter.fields) ...[
        Text(x,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black))
      ],
    ], listContents: [
      for (int x = 0; x < Gutter.fields.length - 1; x++) ...[
        TextFormField(
          initialValue: gutterdata.toJson()[Gutter.fields[x]].toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black),
          onFieldSubmitted: (String value) {
            Map<String, dynamic> temp = gutterdata.toJson();
            temp[Gutter.fields[x]] = value;
            customerNotifier.value[widget.houseIndex].houses[widget.index]
                .gutters[widget.gutterIndex] = Gutter.fromJson(temp);
            setState(() {});
          },
        )
      ],
      Scrollbar(
          thickness: 10,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: gutterdata.parts.length + 1,
            itemBuilder: (context, index) {
              if (index < gutterdata.parts.length) {
                return recusion(gutterdata.parts[index], 0);
              } else {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      gutterdata.parts = List<Parts>.from(gutterdata.parts)
                        ..add(Parts.createNew(
                            Section(name: "Name", sections: [])));
                      setState(() {});
                    },
                    child: SpecialText(
                      insertext: "Add new Section",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                      divider: true,
                    ),
                  ),
                );
              }
            },
          )),
    ], rowFlex: [
      for (int x = 0; x < House.fields.length - 2; x++) ...[1],
      7,
    ], columnFlex: [
      for (int x = 0; x < House.fields.length - 1; x++) ...[(1, 2)],
    ]);
  }

  Widget recusion(Parts parts, int tabs) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        width: double.infinity,
        child: ExpansionTile(
          title: SpecialText(
            insertext: parts.name,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black),
            divider: true,
          ),
          childrenPadding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
          shape: const Border(bottom: BorderSide.none),
          controlAffinity: ListTileControlAffinity.leading,
          children: [
            if (parts.runtimeType == Section) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    parts.sections = List<Parts>.from(parts.sections)
                      ..insert(0, Pieces(name: "Piece"));
                    setState(() {});
                  },
                  child: SpecialText(
                    insertext: "Add new Piece",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black),
                    divider: true,
                  ),
                ),
              ),
            ],
            if (parts.runtimeType == Pieces) ...[
              DataAdditions(data: parts)
            ] else ...[
              ExpansionTile(
                  title: SpecialText(
                      insertext: "${parts.name} Details",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                      divider: true),
                  controlAffinity: ListTileControlAffinity.leading,
                  shape: const Border(bottom: BorderSide.none),
                  childrenPadding: const EdgeInsets.symmetric(horizontal: 40.0),
                  children: [DataAdditions(data: parts)]),
            ],
            for (Parts item in parts.sections)
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                recusion(item, tabs + 1),
              ]),
            if (parts.sections.isNotEmpty) addButton(parts),
          ],
        ),
      ),
    ]);
  }

  Widget addButton(Parts parts) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          parts.sections = List<Parts>.from(parts.sections)
            ..add(Parts.createNew(parts.sections[parts.sections.length - 1]));
          setState(() {});
        },
        child: SpecialText(
          insertext:
              "Add New ${parts.sections[parts.sections.length - 1].type}",
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black),
          divider: true,
        ),
      ),
    );
  }
}
