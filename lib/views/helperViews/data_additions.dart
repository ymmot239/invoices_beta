import 'package:flutter/material.dart';

import '../../models/parts.dart';

class DataAdditions extends StatefulWidget {
  Parts data;

  DataAdditions({super.key, required this.data});

  @override
  State<DataAdditions> createState() => _DataAdditionsState();
}

class _DataAdditionsState extends State<DataAdditions> {
  @override
  Widget build(BuildContext context) {
    widget.data.toJson();
    List<String> fields = widget.data.fields;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: List<Widget>.generate(fields.length, (int index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
            ),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(fields[index],
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
                          //color: Theme.of(context).primaryColorDark,
                          border: Border(
                              left: BorderSide(color: Colors.grey, width: 2))),
                      child: TextFormField(
                          initialValue:
                              widget.data.holder[fields[index]].toString(),
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: Colors.black),
                          onFieldSubmitted: (String value) {
                            widget.data.holder[fields[index]] = value;
                            widget.data.update();
                            widget.data.toJson();
                            setState(() {});
                          }),
                    ))
              ],
            ),
          );
        }),
      ),
    );
  }
}
