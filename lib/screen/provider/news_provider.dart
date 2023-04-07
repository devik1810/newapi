import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';


import '../model/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<dynamic> NewsList = [];

  Future<void> NewsApiCall() async {
    String newslink =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-03-05&sortBy=publishedAt&apiKey=421bf1b94b28421cbaeb97808a515ae8";

    Uri uri = Uri.parse(newslink);
    var resonse = await http.get(uri);
    var json = jsonDecode(resonse.body);

    NewsModel newsModel = NewsModel().newsFromJson(json);

    NewsList = newsModel.articleList!;
    notifyListeners();
  }
}
