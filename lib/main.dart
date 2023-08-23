import 'package:flutter/material.dart';
import 'package:moviapp/components/bus.dart';
import 'package:moviapp/http/api.dart';
import 'package:moviapp/models/bus_stop.dart';

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

  Future<void> fetchData() async {
    final api = PublicAPI();

    final data = await api.getBusStopData(int.parse(stop ?? ""));

    print(data[0].linea.id);

    setState(() {
      stopData = data;
    });
  }

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
              onTapOutside: (event) => setState(() {
                    stopData = null;
                  }),
              onSubmitted: (value) => {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => SizedBox(
                              width: double.infinity,
                              height: double.infinity,
                              child: Flex(
                                direction: Axis.vertical,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: stopData
                                        ?.map((e) => Padding(
                                              padding: const EdgeInsets.all(1),
                                              child: Flex(
                                                direction: Axis.vertical,
                                                children: [
                                                  Bus(
                                                    busData: e,
                                                  )
                                                ],
                                              ),
                                            ))
                                        .toList() ??
                                    [const CircularProgressIndicator()],
                              ),
                            )),
                    fetchData(),
                  }),
        ));
  }
}
