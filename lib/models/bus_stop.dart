import 'package:moviapp/models/arrival.dart';
import 'package:moviapp/models/bus_line.dart';

class BusStop {
  final BusLine linea;
  final List<Arrival> arribos;

  BusStop({required this.linea, required this.arribos});

  factory BusStop.fromJson(Map<String, dynamic> json) {
    return BusStop(
        linea: BusLine.fromJson(json["linea"]),
        arribos: json["arribos"]
            .map<Arrival>((jsonObject) => Arrival.fromJson(jsonObject))
            .toList());
  }
}
