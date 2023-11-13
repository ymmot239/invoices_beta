import 'package:flutter/material.dart';

import '../helperViews/helper_views.dart';

class TableView extends StatefulWidget {
  final String title;

  final List<Widget> listTitles;
  final List<Widget> listContents;

  final List<int> rowFlex;
  final List<(int, int)> columnFlex;

  const TableView(
      {super.key,
      required this.title,
      required this.listTitles,
      required this.listContents,
      required this.rowFlex,
      required this.columnFlex});

  @override
  State<TableView> createState() => _EditTableViewState();
}

class _EditTableViewState extends State<TableView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: const [LogoIcon()],
        ),
        body: Scrollbar(child: LayoutBuilder(builder: (context, constraints) {
          return Padding(
              padding: EdgeInsets.symmetric(
                  vertical: constraints.maxHeight * .05,
                  horizontal: constraints.maxWidth * .05),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List<Widget>.generate(widget.listTitles.length,
                      (int index) {
                    return Flexible(
                        flex: widget.rowFlex[index],
                        child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                            ),
                            child: Row(children: [
                              Flexible(
                                  flex: widget.columnFlex[index].$1,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: widget.listTitles[index],
                                  )),
                              Flexible(
                                  flex: widget.columnFlex[index].$2,
                                  child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                                  color: Colors.black,
                                                  width: 2))),
                                      child: widget.listContents[index]))
                            ])));
                  })));
        })));
  }
}
