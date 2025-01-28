import '../../../model/NewsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse?>getNews(String sourceId);

}