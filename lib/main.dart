import 'package:flutter/material.dart';
import 'package:times_tables_triumph/fact.dart';
import 'package:times_tables_triumph/flashcard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Times Tables Triumph',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 85, 199, 199),
        ),
        useMaterial3: true,
        cardTheme: const CardTheme(
          surfaceTintColor: Color.fromARGB(255, 85, 199, 199),
          elevation: 4,
          margin: EdgeInsets.all(16),
        ),
      ),
      home: const MyHomePage(title: 'Times Tables Triumph'),
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

  
  final fact = FactGenerator().generate(maxTable: 12);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlashCardWidget(fact: fact),
          ]

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
  
}
