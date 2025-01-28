import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';

import 'news_remote_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource{
  ApiManger apiManger;
  NewsRemoteDataSourceImpl({required this.apiManger});

  @override
  Future<NewsResponse?> getNews(String sourceId) {
    return apiManger.getNewsBySourceId(sourceId);
  }

}