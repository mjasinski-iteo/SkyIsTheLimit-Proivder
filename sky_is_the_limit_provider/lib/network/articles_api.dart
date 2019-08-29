import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:sky_is_the_limit_provider/domain/news.dart';
import 'package:sky_is_the_limit_provider/network/article_mapper.dart';
import 'package:sky_is_the_limit_provider/network/consts.dart';

class ArticlesApi {
  Future<List<Article>> getArticles() async {
    final response = await http.get(
        'https://newsapi.org/v2/top-headlines?sources=google-news&apiKey=${Consts.API_KEY}');

    if (response.statusCode != 200) {
      throw Exception('An error occured');
    }

    var parsedJson = json.decode(response.body);
    Iterable articles = parsedJson['articles'];

    return articles.map((item) => ArticleMapper.fromJsonData(item)).toList();
  }
}
