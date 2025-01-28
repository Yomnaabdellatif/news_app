
  import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source.dart';

import '../../../api/api_manger.dart';
import 'news_repository.dart';
class NewsRepositoryImpl implements NewsRepository{
NewsRemoteDataSource newsRemoteDataSource;
  NewsRepositoryImpl({required this.newsRemoteDataSource});
  @override
  Future<NewsResponse?> getNews(String sourceId) {
   return newsRemoteDataSource.getNews(sourceId);
  }

  
}