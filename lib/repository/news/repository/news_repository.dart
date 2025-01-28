
import '../../../model/NewsResponse.dart';

abstract class NewsRepository{
  Future<NewsResponse?>getNews(String sourceId);
}