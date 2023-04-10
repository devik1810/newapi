
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newapi/contrry_scrren/model/country_model.dart';

class  CountryHelper{

  Future<CountryModel> CountryApi(String country) async {
    // print("========== $country");
    String countrylink ="https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=521cdb008c4c4eaeaeb9945d8d56fce9";
    Uri uri =  Uri.parse(countrylink);
    var resonse = await http.get(uri);
    var json = jsonDecode(resonse.body);
    // print("============== $json");
    CountryModel countryModel = CountryModel.fromJson(json);
    return countryModel;
  }

}