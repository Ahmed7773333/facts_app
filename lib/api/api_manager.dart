import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static String extractFact(String jsonString) {
    try {
      final Map<String, dynamic> data = jsonDecode(jsonString);
      final String fact = data['fact'];
      return fact;
    } catch (e) {
      return 'Error decoding JSON';
    }
  }

  static Future<String> getFact({var limit = 2}) async {
    final apiUrl = 'https://api.api-ninjas.com/v1/facts?limit=$limit';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'X-Api-Key': 'nbQrxkmRsnLSoL8Sb5KNXA==2A7yEtq2UOWxUWe1'},
    );
    debugPrint('her');
    debugPrint(response.body);

    return '${extractFact(response.body)}\n';
  }

  static Future<String> getNumberFact({String number = '7'}) async {
    Uri url = Uri.http('numbersapi.p.rapidapi.com', '/$number/math', {
      "X-RapidAPI-Key": "api_f0f84e55-6c94-45ef-a6b8-9c1203531b88",
    });
    http.Response response = await http.get(url);
    String data = response.body;
    return data;
  }

  static Future<String> getDateFact({String date = '6/21'}) async {
    Uri url = Uri.http('numbersapi.p.rapidapi.com', '/$date/date', {
      "X-RapidAPI-Key": "api_f0f84e55-6c94-45ef-a6b8-9c1203531b88",
    });
    http.Response response = await http.get(url);
    String data = response.body;
    return data;
  }
}
