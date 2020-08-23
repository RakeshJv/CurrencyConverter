
import 'dart:convert';

import 'package:http/http.dart';
import 'package:money_transfer/models/country.dart';
import 'package:money_transfer/util/app_string.dart';

class CountryAPI {


  Future<List<Country>> makeRequest(String query) async {
    List<Country> images = [];
    print("makeRequest");

    final response = await get(query);
    print(response.body);

    final List results = json.decode(response.body);
    print(results.length);


   // final List results = parsedResponse['results'];

    results.forEach((result) => images.add(Country.fromJson(result)));

    return images;
  }
}