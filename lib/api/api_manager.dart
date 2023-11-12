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

  static Future<String> getCountryFact({String country = 'Egypt'}) async {
    final apiUrl = 'https://api.api-ninjas.com/v1/country?name=$country';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'X-Api-Key': 'nbQrxkmRsnLSoL8Sb5KNXA==2A7yEtq2UOWxUWe1'},
    );
    debugPrint('her');
    debugPrint(response.body);

    return response.body;
  }

  static Future<String> getCarFact({String car = 'carmy'}) async {
    final apiUrl = 'https://api.api-ninjas.com/v1/cars?model=$car';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'X-Api-Key': 'nbQrxkmRsnLSoL8Sb5KNXA==2A7yEtq2UOWxUWe1'},
    );
    debugPrint('her');
    debugPrint(response.body);

    return response.body;
  }

  static Future<String> getPlanetFact({String planet = 'Neptune'}) async {
    final apiUrl = 'https://api.api-ninjas.com/v1/planets?name=$planet';

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {'X-Api-Key': 'nbQrxkmRsnLSoL8Sb5KNXA==2A7yEtq2UOWxUWe1'},
    );
    debugPrint('her');
    debugPrint(response.body);

    return response.body;
  }
}
