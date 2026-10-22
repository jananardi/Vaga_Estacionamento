import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

import '../models/list_estacionamento_model.dart';

class EstacionamentoService {
  final String url = "https://parking-spot-pmfd.onrender.com/parking-spot";
  dynamic _response;

  EstacionamentoService() {
    _response = "";
  }

  Future<ListEstacionamentoModel> fetchListEstacionamentoModel() async {
    _response = await http.get(Uri.parse(url));
    if (_response.statusCode == 200) {
      final dynamic body = jsonDecode(_response.body);
      return ListEstacionamentoModel.fromJson({'listEstacionamento': body});
    } else {
      throw Exception('Falhou ao Carregar!!!');
    }
  }
}