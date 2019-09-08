import 'package:sky_is_the_limit_provider/domain/news.dart';

class ArticleMapper {
  static Article fromJsonData(Map<String, dynamic> data) => Article(
      title: data['title'],
      description: data['description'],
      content: data['content'],
      urlToImage: data['urlToImage']);
}
