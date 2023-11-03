import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffffe5ec)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Scientific Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String t = "0";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decrementCounter(){
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumberValue(name: "Dezimal", function: (a) {return a.toString();}, counter: _counter),
              NumberValue(name: "Hex", function: (a) {return a.toRadixString(16).toUpperCase();}, counter: _counter),
              NumberValue(name: "Oct", function: (a) {return a.toRadixString(8);}, counter: _counter),
              NumberValue(name: "Binary", function: (a) {return a.toRadixString(2);}, counter: _counter),
              const Text(
                'Decimal',
              ),
              Text(
                '$_counter',
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
              const Text(
                'Binary',
              ),
              Text(
                _counter.toRadixString(2),
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
              const Text(
                'Hexadecimal',
              ),
              Text(
                _counter.toRadixString(16).toUpperCase(),
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
              const Text(
                'Octal',
              ),
              Text(
                _counter.toRadixString(8).toUpperCase(),
                style: Theme
                    .of(context)
                    .textTheme
                    .headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),

            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],

        )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NumberValue extends StatelessWidget {
  final String name;
  final Function function;
  final int counter;
  const NumberValue({super.key, required this.name, required this.function, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
            Icons.onetwothree,
          color: Colors.black,
        ),
        Text(name),
        Text(function(counter))
      ],
    );
  }
}

