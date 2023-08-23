import 'package:dio/dio.dart';
import 'package:moviapp/models/bus_stop.dart';

class BaseAPI {
  static String base = "https://ws.rosario.gob.ar/ubicaciones/public";

  dynamic client;

  BaseAPI() {
    client = Dio(BaseOptions(
      baseUrl: base,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      sendTimeout: const Duration(seconds: 5),
      followRedirects: false,
    ));
  }

  Future<Response> get(String url, {params}) async {
    return await client.get(url, queryParameters: params);
  }

  Future<Response> post(String url, {body}) async {
    return await client.post(url,
        data: body != null ? FormData.fromMap(body) : null);
  }
}

class PublicAPI extends BaseAPI {
  Future<List<BusStop>> getBusStopData(int numb) async {
    final response = await get("/cuandollega", params: {"parada": numb});

    return response.data
        .map<BusStop>((jsonObject) => BusStop.fromJson(jsonObject))
        .toList();
  }
}
