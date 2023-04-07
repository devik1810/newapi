import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapi/contrry_scrren/model/country_model.dart';
import 'package:newapi/utils/contrry_helper.dart';

class CountryProvider extends ChangeNotifier {

  CountryModel? countryModeldata;
  String SelectedCountry = 'in';

  void changeConrty(String country){
    SelectedCountry = country;
    notifyListeners();
  }
  CountryHelper countryHelper = CountryHelper();
  Future<CountryModel> getNews(String country) async {

    CountryModel countryModelr = await countryHelper.CountryApi(country);
    countryModeldata = countryModelr;
    return countryModelr;
  }
}