import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 93, 136, 255)),
        useMaterial3: true,
      ),
      home: const SearchBusStop(),
    );
  }
}

class SearchBusStop extends StatefulWidget {
  const SearchBusStop({super.key});

  @override
  State<SearchBusStop> createState() => _SearchBusStopState();
}

class _SearchBusStopState extends State<SearchBusStop> {
  String? stop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Ingresa el numero de parada"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            autocorrect: false,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Ej. 1640',
            ),
            onChanged: (value) => setState(() {
              stop = value;
            }),
          ),
        ));
  }
}
