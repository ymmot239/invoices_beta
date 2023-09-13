import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:collapsible_sidebar/collapsible_sidebar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const appTitle = 'Blue Ribon Gutters';
  static const mainColor = Colors.blue;
  static const textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: appTitle,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: mainColor),
            canvasColor: mainColor,
            //scaffoldBackgroundColor: mainColor,
            textTheme: TextTheme(
                bodyLarge: TextStyle(
                  color: textColor,
                  fontSize: 40,
                ),
                bodySmall: TextStyle(
                  color: textColor,
                  fontSize: 20,
                )),
            primaryIconTheme: IconThemeData(color: textColor)),
        home: MyHomePage(title: appTitle),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Placeholder(),
    Placeholder(),
    Placeholder(),
  ];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          iconTheme: Theme.of(context).primaryIconTheme,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Center(
          child: _widgetOptions[_selectedIndex],
        ),
      );
    });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var appState = context.watch<MyAppState>();

    return LayoutBuilder(builder: (context, constraints) {
      return Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FittedBox(
              fit: BoxFit.cover, child: Text("Welcome", style: MainText.title)),
          SizedBox(height: constraints.maxHeight * .1),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                  constraints.maxWidth - (constraints.maxWidth * .2),
                  constraints.maxHeight * .08),
            ),
            onPressed: () {},
            child: Text('Prices', style: MainText.buttons),
          ),
          SizedBox(height: constraints.maxHeight * .08),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                  constraints.maxWidth - (constraints.maxWidth * .2),
                  constraints.maxHeight * .08),
            ),
            onPressed: () {},
            child: Text('Invoice', style: MainText.buttons),
          ),
          SizedBox(height: constraints.maxHeight * .08),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(
                  constraints.maxWidth - (constraints.maxWidth * .2),
                  constraints.maxHeight * .08),
            ),
            onPressed: () {},
            child: Text('Material', style: MainText.buttons),
          ),
        ]),
      );
    });
  }
}

class MainText {
  static const TextStyle buttons = TextStyle(
    fontSize: 24,
    color: Color.fromARGB(255, 0, 0, 0),
    //zfontWeight: FontWeight.bold,
  );
  static const TextStyle title = TextStyle(
    fontSize: 40,
    color: Color.fromARGB(255, 0, 0, 0),
    //zfontWeight: FontWeight.bold,
  );
}
