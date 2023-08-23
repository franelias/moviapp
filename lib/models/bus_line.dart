class BusLine {
  final String id;
  final String idEmpresa;
  final String nombreEmpresa;
  final String nombre;
  final String nombreCorto;
  final String codigoEMR;
  final String color;

  BusLine(
      {required this.id,
      required this.idEmpresa,
      required this.nombreEmpresa,
      required this.nombre,
      required this.nombreCorto,
      required this.codigoEMR,
      required this.color});

  factory BusLine.fromJson(Map<String, dynamic> json) {
    return BusLine(
      id: json["id"],
      idEmpresa: json["idEmpresa"],
      nombreEmpresa: json["nombreEmpresa"],
      nombre: json["nombre"],
      nombreCorto: json["nombreCorto"],
      codigoEMR: json["codigoEMR"],
      color: json["color"],
    );
  }
}
