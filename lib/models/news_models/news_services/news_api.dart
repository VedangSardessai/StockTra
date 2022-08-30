import 'dart:convert';

import 'package:for_x/models/news_models/article_model.dart';
import 'package:http/http.dart';

class APIServices {
  final endPointURL =
      "https://newsapi.org/v2/everything?q=nifty50&apiKey=97dc31d3a1d24e0eab8777c218537e41";

  Future<List<Article>> getArticle() async {
    Response response = await get(Uri.parse(endPointURL));

    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);

      List<dynamic> body = json['articles'];

      List<Article> articles =
          body.map((dynamic item) => Article.fromJson(item)).toList();

      return articles;
    } else {
      throw ('Cannot get articles');
    }
  }
}
