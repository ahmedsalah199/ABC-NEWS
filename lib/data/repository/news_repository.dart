import 'package:news_app/data/model/news_model.dart';

import '../web_services/web_services.dart';

class NewsRepository {
   Future<List<NewsModel>> getNews({required Map<String, dynamic> query, required String url}) async {
    try {
      var data = await WebServices().getData(query: query,url: url);
      return data.map((news) => NewsModel.fromJson(news)).toList();
    } catch (error) {
      throw Exception("Connection  Timeout Exception  Error is $error");
    }

  }
}