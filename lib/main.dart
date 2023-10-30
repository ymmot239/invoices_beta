//import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:invoices_beta/customer_provider.dart';
import 'package:invoices_beta/models/customer.dart';
import 'package:invoices_beta/views/invoiceViews/invoice_screen.dart';

//import 'views/edit.dart';
import 'views/home.dart';
import 'views/customerViews/customers_screen.dart';

void main() {
  runApp(
    const InvoicesApp(),
  );
}

class InvoicesApp extends StatelessWidget {
  const InvoicesApp({super.key});

  @override
  Widget build(BuildContext context) {
    const mainColor = Colors.blue;
    const textColor = Colors.white;
    var colorscheme = ColorScheme.fromSeed(seedColor: mainColor);
    return CustomerProvider(
      notifier: ValueNotifier<List<Customer>>(const []),
      child: MaterialApp(
        title: "Invoice Management",
        // Start the app with the "/" named route. In this case, the app starts
        // on the FirstScreen widget.
        initialRoute: '/',
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const Home(title: 'Blue Ribbon Gutters'),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/prices': (context) => const Placeholder(),
          '/invoice': (context) => const InvoiceScreen(),
          '/customers': (context) => const CustomersScreen(),
        },
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: colorscheme,
            primaryColor: mainColor,
            //scaffoldBackgroundColor: mainColor,
            appBarTheme: AppBarTheme(
                elevation: 10,
                titleTextStyle: const TextTheme(
                  titleLarge: TextStyle(fontSize: 40, color: textColor),
                ).titleLarge,
                backgroundColor: colorscheme.primary,
                iconTheme: const IconThemeData(color: textColor)),
            textTheme: const TextTheme(
              bodyLarge: TextStyle(
                color: textColor,
                fontSize: 40,
              ),
              bodyMedium: TextStyle(
                color: textColor,
                fontSize: 30,
              ),
            ),
            iconTheme: const IconThemeData(color: textColor)),
      ),
    );
  }
}
