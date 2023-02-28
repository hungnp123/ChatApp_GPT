import 'dart:convert';

import 'package:chat_gpt_app/constants/api_consts.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<void> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$BASE_URL/models"),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );
      Map jsonResponse = jsonDecode(response.body);
      print("jsonResponse $jsonResponse");
    } catch (error) {
      print("errot $error");
    }
  }
}
