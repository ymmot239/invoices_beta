import 'package:flutter/material.dart';

import '../models/general.dart';

class ListAdditions extends StatelessWidget {
  List<General> list;
  void Function() newItem;
  void Function(int index) editItem;
  ListAdditions(
      {super.key,
      required this.list,
      required this.newItem,
      required this.editItem});

  @override
  Widget build(BuildContext context) {
    list = [General(Name: "Add New")] + list;
    return Scrollbar(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                list[index].Name,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Colors.black),
              ),
              onTap: () {
                if (index == 0) {
                  newItem();
                } else {
                  editItem(index - 1);
                }
              },
            );
          }),
    );
  }
}
