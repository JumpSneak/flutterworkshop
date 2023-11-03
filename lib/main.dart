import 'dart:convert';

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
        colorScheme: ColorScheme.light(primary:const Color(0xffff8fab), secondary:const Color(0xffffb3c6)),
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
void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              NumberValue(
                  name: "Dezimal",
                  function: (a) {
                    return a.toString();
                  },
                  counter: _counter),
              Divider(color: Colors.black, thickness: 1),
              NumberValue(
                  name: "Hex",
                  function: (a) {
                    return a.toRadixString(16).toUpperCase();
                  },
                  counter: _counter),
              Divider(color: Colors.black, thickness: 1),
              NumberValue(
                  name: "Oct",
                  function: (a) {
                    return a.toRadixString(8);
                  },
                  counter: _counter),
              Divider(color: Colors.black, thickness: 1),
              NumberValue(
                  name: "Binary",
                  function: (a) {
                    return a.toRadixString(2);
                  },
                  counter: _counter),

            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: _decrementCounter,
                tooltip: 'Decrement',
                child: const Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: _resetCounter,
                tooltip: 'Reset',
                child: const Icon(Icons.replay),
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                child: const Icon(
                  Icons.add,
                ),
              )
            ],
          ),
        )

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NumberValue extends StatelessWidget {
  final String name;
  final Function function;
  final int counter;
  final IconData icons;
  const NumberValue(
      {super.key,
      required this.name,
      required this.function,
      required this.counter,
      this.icons = Icons.onetwothree
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.onetwothree,
            color: Colors.black,
            size: 60,
          ),

          Expanded(child: Text(name, style: Theme.of(context).textTheme.headlineMedium,), flex: 5),
          Text(function(counter), style: Theme.of(context).textTheme.headlineMedium,)
        ],
      ),
    );
  }
}

