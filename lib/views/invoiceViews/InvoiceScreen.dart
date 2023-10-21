import 'package:flutter/material.dart';

import 'package:invoices_beta/views/helperViews/List_Additions.dart';

import '../../customer_provider.dart';
import '../../models/data_layer.dart';
import '../helperViews/logo_icon.dart';
import 'IndividualCustomer.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceState();
}

class _InvoiceState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    List<Customer> customdata = customerNotifier.value;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Choose Customer"),
          centerTitle: true,
          actions: const [LogoIcon()],
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          return customdata.isNotEmpty
              ? ListAdditions(
                  list: customdata,
                  editItem: editItem,
                )
              : Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Icon(Icons.note, size: 100, color: Colors.grey),
                  Text('You do not have any customers yet.',
                      style: Theme.of(context).textTheme.headlineSmall)
                ]);
        }));
  }

  void editItem(int index) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => IndividualCustomer(
          index: index,
        ),
      ),
    );
  }
}
