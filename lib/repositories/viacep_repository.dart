import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trilhaapp/model/viacep_model.dart';

class ViaCEPRepository {
  Future<ViaCEPModel> consultarCep(String cep) async {
    var response =
        await http.get(Uri.parse("http://www.viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCEPModel.fromJson(json);
    }
    return ViaCEPModel();
  }
}
