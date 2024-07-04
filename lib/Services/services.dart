import 'package:flutter_volei_sco/modelos/new_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsApi {
  List<NewsModel> dataStore = [];
  Future<void> getNews () async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c3a96becea134d628993ea808971687b");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == 'ok'){
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"] != null && 
        element ["description"] != null && 
        element ["author"] != null && 
        element ["content"] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],
            urlToImage: element["urlToImage"],
            description: element["description"],
            author: element["author"],
            content: element["content"],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}

class CategoryNews {
  List<NewsModel> dataStore = [];
  Future<void> getNews (String category) async {
    Uri url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=c3a96becea134d628993ea808971687b");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    if(jsonData["status"] == 'ok'){
      jsonData["articles"].forEach((element) {
        if(element["urlToImage"] != null && 
        element ["description"] != null && 
        element ["author"] != null && 
        element ["content"] != null) {
          NewsModel newsModel = NewsModel(
            title: element['title'],
            urlToImage: element["urlToImage"],
            description: element["description"],
            author: element["author"],
            content: element["content"],
          );
          dataStore.add(newsModel);
        }
      });
    }
  }
}