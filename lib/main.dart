//import 'dart:js_interop';

import 'package:flutter/material.dart';

void main() {
  const mainColor = Colors.blue;
  const textColor = Colors.white;
  runApp(
    MaterialApp(
      title: "Invoice Management",
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Home(title: 'Blue Ribbon Gutters'),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/prices': (context) => const Placeholder(),
        '/invoice': (context) => const Placeholder(),
        '/materials': (context) => const Materials(),
        '/materials/edit': (context) => const Edit(customdata: ''),
      },
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
          canvasColor: mainColor,
          //scaffoldBackgroundColor: mainColor,
          textTheme: const TextTheme(
              titleLarge: TextStyle(
                color: textColor,
                fontSize: 40,
              ),
              bodyLarge: TextStyle(
                color: textColor,
                fontSize: 40,
              ),
              displayMedium: TextStyle(
                color: textColor,
                fontSize: 20,
              )),
          iconTheme: IconThemeData(color: textColor)),
    ),
  );
}

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
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
              child: Text('Invoice',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      )),
            ),
            SizedBox(height: constraints.maxHeight * .08),
            ElevatedButton(
              // Within the `FirstScreen` widget
              onPressed: () {
                // Navigate to the second screen using a named route.
                Navigator.pushNamed(context, '/materials');
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                    constraints.maxWidth - (constraints.maxWidth * .2),
                    constraints.maxHeight * .08),
              ),
              child: Text('Material',
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

class Materials extends StatefulWidget {
  const Materials({super.key});

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {
  final List<dynamic> listSelection = [
    {
      'id': 0,
      'header': 'Tap to add customer',
      'icon': Icon(Icons.add_circle_outlined),
      //'taps': _addNewUploadDoc(),
    },
  ];

  //int _selected = 0;
  int index = 0;
  int _count = 1;
  //late List<Widget> _upload = List.generate(_count, (int i) => Materials());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Material',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: ListView.separated(
                itemCount: _count,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(listSelection[index]['header']),
                        onTap: () {
                          if (index != _count - 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Edit(customdata: listSelection[index]),
                              ),
                            );
                          } else {
                            _addNewCustomer();
                          }
                        },
                        leading: listSelection[index]['icon'],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
              ))
            ],
          ),
        ),
      );
    });
  }

  void _addNewCustomer() {
    setState(() {
      listSelection.insert(_count - 1, {
        'id': _count,
        'header': 'unnamed customer ' + (_count).toString(),
        //'icon': Icon(Icons.add_circle_outlined),
      });
      _count++;
    });
  }
}

class Edit extends StatefulWidget {
  final dynamic customdata;
  const Edit({super.key, required this.customdata});
  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisSize: MainAxisSize.min, children: [
          Text(
            widget.customdata.toString().substring(
                widget.customdata.toString().indexOf("header") + 8,
                widget.customdata.toString().indexOf("}")),
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              //Navigator.pop(context);
            },
            child: Icon(Icons.edit),
          )
        ]),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Center(
        child: Placeholder(),
      ),
    );
  }
}

class TableExample extends StatelessWidget {
  const TableExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: const <int, TableColumnWidth>{
        0: FlexColumnWidth(),
        1: FlexColumnWidth(),
        2: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: <Widget>[
            Container(
              height: 32,
              color: Colors.green,
            ),
            TableCell(
              verticalAlignment: TableCellVerticalAlignment.top,
              child: Container(
                height: 32,
                width: 32,
                color: Colors.red,
              ),
            ),
            Container(
              height: 64,
              color: Colors.blue,
            ),
          ],
        ),
        TableRow(
          decoration: const BoxDecoration(
            color: Colors.grey,
          ),
          children: <Widget>[
            Container(
              height: 64,
              width: 128,
              color: Colors.purple,
            ),
            Container(
              height: 32,
              color: Colors.yellow,
            ),
            Center(
              child: Container(
                height: 32,
                width: 32,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
