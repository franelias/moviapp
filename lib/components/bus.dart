import 'package:flutter/material.dart';
import 'package:moviapp/models/bus_stop.dart';

class Bus extends StatelessWidget {
  const Bus({super.key, required this.busData});

  final BusStop busData;

  @override
  Widget build(BuildContext context) {
    return Flex(direction: Axis.vertical, children: [
      Text("El ${busData.linea.nombre} llega en:"),
    ]);
  }
}
