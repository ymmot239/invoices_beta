//import 'dart:js_interop';

import 'package:flutter/material.dart';

import 'logo_icon.dart';

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          actions: const [LogoIcon()],
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            FittedBox(
                fit: BoxFit.cover,
                child: Text("Welcome",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ))),
            SizedBox(height: constraints.maxHeight * .08),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/prices');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    constraints.maxWidth - (constraints.maxWidth * .2),
                    constraints.maxHeight * .08),
              ),
              child: Text('Prices',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ),
            SizedBox(height: constraints.maxHeight * .08),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/invoice');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    constraints.maxWidth - (constraints.maxWidth * .2),
                    constraints.maxHeight * .08),
              ),
              child: Text('Invoices',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ),
            SizedBox(height: constraints.maxHeight * .08),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/customers');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    constraints.maxWidth - (constraints.maxWidth * .2),
                    constraints.maxHeight * .08),
              ),
              child: Text('Customers',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ),
          ]),
        ),
      );
    });
  }
}
