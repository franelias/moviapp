import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:moviapp/http/api.dart';
import 'package:flutter/foundation.dart';
import 'package:moviapp/models/bus_stop.dart';

class BusStopProvider with ChangeNotifier {
  List<BusStop>? buses;

  Future<void> getBusStopData(int parada) async {
    final api = PublicAPI();

    final data = await api.getBusStopData(parada);

    buses = data;
    notifyListeners();
  }
}

final busStopProvider =
    ChangeNotifierProvider<BusStopProvider>((ref) => BusStopProvider());
