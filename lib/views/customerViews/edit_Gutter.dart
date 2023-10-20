import 'package:flutter/material.dart';

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
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    Gutter gutterdata = customerNotifier.value[widget.houseIndex]
        .Houses[widget.index].Gutters[widget.gutterIndex];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [LogoIcon()],
        title: const Text("Edit Gutter Data"),
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * .05,
                horizontal: constraints.maxWidth * .05),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List<Widget>.generate(Gutter.fields.length + 1,
                    (int index) {
                  if (index < Gutter.fields.length - 1) {
                    return Flexible(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Row(
                          children: [
                            Flexible(
                              flex: 1,
                              child: Container(
                                  width: double.infinity,
                                  child: Text(Gutter.fields[index],
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
                                              color: Colors.black, width: 2))),
                                  child: TextFormField(
                                    initialValue: gutterdata
                                        .toJson()[Gutter.fields[index]]
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
                                          gutterdata.toJson();
                                      temp[Gutter.fields[index]] = value;
                                      customerNotifier
                                              .value[widget.houseIndex]
                                              .Houses[widget.index]
                                              .Gutters[widget.gutterIndex] =
                                          Gutter.fromJson(temp);
                                      setState(() {});
                                    },
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  } else if (index == Gutter.fields.length - 1) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                      ),
                      child: Text("Parts",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.black)),
                    );
                  }
                  return Flexible(
                      flex: 7,
                      child: LayoutBuilder(builder: (context, constraints) {
                        return Container(
                          padding: EdgeInsets.all(8.0),
                          width: double.infinity,
                          height: constraints.maxHeight,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 2),
                          ),
                          child:
                              // Flexible(
                              //   flex: 1,
                              //   child: Stack(
                              Scrollbar(
                                  thickness: 10,
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    //separatorBuilder: (context, index) =>const Divider(thickness: 1),
                                    itemCount: gutterdata.parts.length + 1,
                                    itemBuilder: (context, index) {
                                      if (index < gutterdata.parts.length) {
                                        return recusion(
                                            gutterdata.parts[index], 0);
                                      } else {
                                        return Container(
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: GestureDetector(
                                            onTap: () {
                                              gutterdata.parts =
                                                  List<Parts>.from(
                                                      gutterdata.parts)
                                                    ..add(Parts.createNew(
                                                        Section(
                                                            Name: "Name",
                                                            Sections: [])));
                                              print(gutterdata.parts);
                                              setState(() {});
                                            },
                                            child: SpecialText(
                                              insertext: "Add new Section",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium
                                                  ?.copyWith(
                                                      color: Colors.black),
                                              divider: true,
                                            ),
                                          ),
                                        );
                                      }
                                    },
                                  )
                                  //     List<Widget>.generate(
                                  //         gutterdata.parts.length, (int index) {
                                  //   return Container(
                                  //       child:
                                  //           recusion(gutterdata.parts[index], 0));
                                  // })
                                  ),
                          //),),
                          //   Container(
                          //     width: double.infinity,
                          //     child: GestureDetector(
                          //       onTap: () {
                          //         gutterdata.parts =
                          //             List<Parts>.from(gutterdata.parts)
                          //               ..add(Parts.createNew(Section(
                          //                   Name: "Name", Sections: [])));
                          //         print(gutterdata.parts);
                          //         setState(() {});
                          //       },
                          //       child: Text("Add new Section",
                          //           style: Theme.of(context)
                          //               .textTheme
                          //               .bodyMedium
                          //               ?.copyWith(color: Colors.black)),
                          //     ),
                          //   )
                          // ]));
                        );
                      }));
                })));
      }),
    );
  }

  // Widget listBuild(List<Parts> parts){

  // }

  Widget recusion(Parts parts, int tabs) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(
        width: double.infinity,
        child: ExpansionTile(
          title: SpecialText(
            insertext: /*"       " * tabs +*/ parts.Name,
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
              //const Divider(thickness: 1,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    parts.Sections = List<Parts>.from(parts.Sections)
                      ..insert(0, Pieces(Name: "Piece"));
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
                      insertext: "${parts.Name} Details",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.black),
                      divider: true),
                  controlAffinity: ListTileControlAffinity.leading,
                  shape: const Border(bottom: BorderSide.none),
                  childrenPadding: EdgeInsets.symmetric(horizontal: 40.0),
                  children: [DataAdditions(data: parts)]),
            ],
            for (Parts item in parts.Sections)
              Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                recusion(item, tabs + 1),
              ]),
            if (parts.Sections.isNotEmpty) addButton(parts),
          ],
        ),
        // SpecialText(
        //   insertext: "    " * tabs + parts.Name,
        //   style: Theme.of(context)
        //       .textTheme
        //       .bodyMedium
        //       ?.copyWith(color: Colors.black),
        //   leader: Icons.arrow_right,
        // )
        // Text("    " * tabs + parts.Name,
        //     textAlign: TextAlign.left,
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodyMedium
        //         ?.copyWith(color: Colors.black)),
      ),
      // if (parts.runtimeType == Section) ...[
      //   const Divider(
      //     thickness: 1,
      //   ),
      //   Container(
      //     width: double.infinity,
      //     padding: EdgeInsets.symmetric(vertical: 8.0),
      //     child: GestureDetector(
      //       onTap: () {
      //         parts.Sections = List<Parts>.from(parts.Sections)
      //           ..insert(0, Pieces(Name: "Piece"));
      //         setState(() {});
      //       },
      //       child: Text("       " * (tabs + 2) + "Add new Piece",
      //           style: Theme.of(context)
      //               .textTheme
      //               .bodyMedium
      //               ?.copyWith(color: Colors.black)),
      //     ),
      //   ),
      //   const Divider(thickness: 1),
      // ],
      // for (Parts item in parts.Sections)
      //   Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      //     recusion(item, tabs + 1),
      //   ]),
      // if (parts.Sections.isNotEmpty) ...{
      //   addButton(context: context, parts: parts),
      //   const Divider(thickness: 1),
      // }
    ]);
  }

  Widget addButton(Parts parts) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: () {
          parts.Sections = List<Parts>.from(parts.Sections)
            ..add(Parts.createNew(parts.Sections[parts.Sections.length - 1]));
          setState(() {});
        },
        child: SpecialText(
          /* "       " * (tabs + 2) +*/
          insertext:
              "Add New ${parts.Sections[parts.Sections.length - 1].Type}",
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