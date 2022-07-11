import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:news_app/models/news_model.dart';

String baseUrl = "https://ktmwebscraper.herokuapp.com/";

getNews(String newstype) async {
  var response = await http.get(Uri.parse(baseUrl + newstype));

  if (response.statusCode == 200) {
    var jsondata = jsonDecode(response.body);

    List<News> mynews = [];

    for (var news in jsondata) {
      News singlenews = News(
          title: news["title"],
          imageUrl: news["image"],
          description: news["description"],
          author: news["author"],
          link: news["link"]);
          
    mynews.add(singlenews);

    }
    debugPrint(mynews[0].toString());
    return mynews;
  }
  else{
    throw Exception("Unable to load data");
  }
}















 //