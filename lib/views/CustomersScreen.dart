//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:invoices_beta/customer_provider.dart';
import 'package:invoices_beta/models/data_layer.dart';

import 'edit.dart';
import 'logo_icon.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersState();
}

class _CustomersState extends State<CustomersScreen> {
  List<dynamic> listSelection = [];
  int index = 0;
  late List<Customer> customers;
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Customers'),
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme,
          actions: [LogoIcon()],
        ),
        floatingActionButton: _buildAddCustomerButton(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child: _buildCustomerList())],
          ),
        ),
      );
    });
  }

  Widget _buildCustomerList() {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    List<Customer> customers = customerNotifier.value;
    if (customers.isEmpty) {
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.note, size: 100, color: Colors.grey),
            Text('You do not have any plans yet.',
                style: Theme.of(context).textTheme.headlineSmall)
          ]);
    } else {
      return Scrollbar(
        child: ListView.separated(
          controller: scrollController,
          itemCount: customers.length,
          separatorBuilder: (context, index) => const Divider(thickness: 1),
          itemBuilder: (context, index) {
            final customer = customers[index];
            return ListTile(
              title: Text(customer.Name),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => Edit(index: index),
                  ),
                );
              },
              //leading: listSelection[index]['icon'],
            );
          },
        ),
      );
    }
  }

  Widget _buildAddCustomerButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        _addNewCustomer();
      },
    );
  }

  void _addNewCustomer() {
    // setState(() {
    //   listSelection.insert(_count, {
    //     'id': _count,
    //     'header': 'unnamed customer ' + (_count).toString(),
    //     //'icon': Icon(Icons.add_circle_outlined),
    //   });
    //   _count++;
    // });

    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);

    final custom = Customer(Name: "untitled ${customerNotifier.value.length}");

    customerNotifier.value = List<Customer>.from(customerNotifier.value)
      ..add(custom);
    FocusScope.of(context).requestFocus(FocusNode());
    setState(() {});
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
