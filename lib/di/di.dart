//viewM ==> R
//R ==>DS
//DS==>APIM

import 'package:news_app/api/api_manger.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import '../repository/news/repository/news_repository.dart';

SourceRepository injectSourceRepository(){
  return SourceRepositoryImpl(sourceRemote:injectSourceRemoteDataSource() );

}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManger: injectApiManger());

}
ApiManger injectApiManger(){
  return ApiManger();
}

NewsRepository injectNewsRepository(){
  return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource());

}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManger: injectApiManger());
}
