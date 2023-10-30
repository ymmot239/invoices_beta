import 'package:flutter/material.dart';

import '../../models/general.dart';

class ListAdditions extends StatelessWidget {
  final List<General> list;
  final void Function()? newItem;
  final void Function(int index)? editItem;
  final TextStyle? style;
  const ListAdditions(
      {super.key, required this.list, this.newItem, this.editItem, this.style});

  @override
  Widget build(BuildContext context) {
    List<General> list = this.list;
    list = newItem != null ? [General(name: "Add New")] + list : list;
    return Scrollbar(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(
                list[index].name,
                style: style ??
                    Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.black),
              ),
              onTap: () {
                if (newItem != null && index == 0) {
                  newItem!();
                } else if (editItem != null) {
                  editItem!(index - 1);
                }
              },
            );
          }),
    );
  }
}
