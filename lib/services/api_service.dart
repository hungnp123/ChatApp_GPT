import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:chat_gpt_app/constants/api_consts.dart';
import 'package:chat_gpt_app/models/models_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );
      Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        print("jsonResponse['error'] ${jsonResponse['error']["message"]}");
        throw HttpException(jsonResponse['error']["message"]);
      }
      List temp = [];
      for (var  in jsonResponse["data"]) {
        temp.add(value);
        log("temp $value")
      }
      print("jsonResponse $jsonResponse");
      return ModelsModel.modelsFromSnapshot(modelSnapshot);
    } catch (error) {
      print("errot $error");
    }
  }
}
