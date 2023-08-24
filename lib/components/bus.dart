import 'package:flutter/material.dart';
import 'package:moviapp/models/bus_stop.dart';

class Bus extends StatelessWidget {
  const Bus({super.key, required this.busData});

  final BusStop busData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1, // 25% width
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue, // you can change this color
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      busData.linea.nombreCorto,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 3, // 75% width
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: busData.arribos
                    .map<Widget>(
                        (e) => Text("Arribo en ${e.arriboEnMinutos} minutos"))
                    .toList()),
          ),
        ],
      ),
    );
  }
}
