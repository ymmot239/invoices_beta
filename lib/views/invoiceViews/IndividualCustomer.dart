import 'package:flutter/material.dart';

import '../../customer_provider.dart';
import '../../models/customer.dart';

class IndividualCustomer extends StatelessWidget {
  int index;
  IndividualCustomer({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    Customer customdata = customerNotifier.value[index];
    return Text("");
  }
}
