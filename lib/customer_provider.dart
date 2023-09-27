import 'package:flutter/material.dart';

import '../models/data_layer.dart';

class CustomerProvider
    extends InheritedNotifier<ValueNotifier<List<Customer>>> {
  const CustomerProvider(
      {super.key,
      required Widget child,
      required ValueNotifier<List<Customer>> notifier})
      : super(child: child, notifier: notifier);

  static ValueNotifier<List<Customer>> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CustomerProvider>()!
        .notifier!;
  }
}
