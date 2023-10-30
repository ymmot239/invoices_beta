import 'package:flutter/material.dart';
import 'package:invoices_beta/views/helperViews/helper_views.dart';

import '../../customer_provider.dart';
import '../../models/customer.dart';
import 'pdf.dart';
import 'package:printing/printing.dart';

class IndividualCustomer extends StatelessWidget {
  final int index;
  const IndividualCustomer({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    ValueNotifier<List<Customer>> customerNotifier =
        CustomerProvider.of(context);
    Customer customdata = customerNotifier.value[index];
    return Scaffold(
        appBar: AppBar(
            title: Text(customdata.name),
            centerTitle: true,
            actions: const [LogoIcon()]),
        body: PdfPreview(build: (context) => Pdfs.makeInvoicePdf(customdata)));
  }
}
