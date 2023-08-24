import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:moviapp/components/bus.dart';
import 'package:moviapp/components/bus_skeleton.dart';
import 'package:moviapp/http/api.dart';
import 'package:moviapp/models/bus_stop.dart';
import 'package:skeletons/skeletons.dart';

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
  List<BusStop>? stopData;
  String? stop;

  @override
  Widget build(BuildContext context) {
    Future<void> dialogBuilder(BuildContext context, dynamic error) {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(error),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Disable'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Enable'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    Future<void> fetchData() async {
      final api = PublicAPI();

      if (stop == null) return;

      try {
        final data = await api.getBusStopData(int.parse(stop ?? ""));

        await Future.delayed(const Duration(seconds: 2));

        print("toy");
        setState(() {
          stopData = data;
        });
        print("toy");
      } catch (e) {
        await dialogBuilder(context, e);
        print(e);
      }
    }

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
              onSubmitted: (value) => {
                    fetchData(),
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => Container(
                              constraints:
                                  const BoxConstraints(minHeight: 240.0),
                              width: double.infinity,
                              height: stopData != null
                                  ? 100.0 * stopData!.length
                                  : 0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Parada $stop",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  ...((stopData
                                          ?.map<Widget>((e) => Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Bus(
                                                busData: e,
                                              )))
                                          .toList()) ??
                                      [
                                        const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: BusSkeleton()),
                                        const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: BusSkeleton()),
                                      ])
                                ],
                              ),
                            )).whenComplete(
                        () => setState(() => stopData = null)),
                  }),
        ));
  }
}
