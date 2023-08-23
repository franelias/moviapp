class Arrival {
  final num arriboEnMinutos;
  final String tipo;
  final String horaArribo;
  final String vehiculo;
  final num latitud;
  final num longitud;
  final String desvioHorario;
  final String ultimaFechaHoraGPS;

  Arrival(
      {required this.arriboEnMinutos,
      required this.tipo,
      required this.horaArribo,
      required this.vehiculo,
      required this.latitud,
      required this.longitud,
      required this.desvioHorario,
      required this.ultimaFechaHoraGPS});

  factory Arrival.fromJson(Map<String, dynamic> json) {
    return Arrival(
        arriboEnMinutos: json["arriboEnMinutos"],
        tipo: json["tipo"],
        horaArribo: json["horaArribo"],
        vehiculo: json["vehiculo"],
        latitud: json["latitud"],
        longitud: json["longitud"],
        desvioHorario: json["desvioHorario"],
        ultimaFechaHoraGPS: json["ultimaFechaHoraGPS"]);
  }
}
