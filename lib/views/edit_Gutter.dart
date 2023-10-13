import 'package:flutter/material.dart';
import 'package:invoices_beta/customer_provider.dart';
import 'package:invoices_beta/models/customer.dart';
import 'package:invoices_beta/models/gutter.dart';
import 'package:invoices_beta/views/logo_icon.dart';

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
        .Houses[widget.index].Gutters[widget.gutterIndex];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: const [LogoIcon()],
        title: const Text("Edit Gutter Data"),
      ),
      body: Scrollbar(child: LayoutBuilder(builder: (context, constraints) {
        return Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * .05,
                horizontal: constraints.maxWidth * .05),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                    List<Widget>.generate(Gutter.fields.length, (int index) {
                  return Text(Gutter.fields[index]);
                })));
      })),
    );
  }
}
