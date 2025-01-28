import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source.dart';
import 'package:news_app/repository/news/dataSource/news_remote_data_source_impl.dart';
import 'package:news_app/repository/news/repository/news_repository.dart';
import 'package:news_app/repository/news/repository/news_repository_impl.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates>{
   NewsRepository newsRepository;
  // late NewsRemoteDataSource newsRemoteDataSource;
  // late ApiManger apiManger;
  NewsViewModel({required this.newsRepository }):super(NewsLoadingState());
    // apiManger =ApiManger();
    // newsRemoteDataSource=NewsRemoteDataSourceImpl(apiManger: apiManger);
    // newsRepository=NewsRepositoryImpl(newsRemoteDataSource: newsRemoteDataSource);


  void getNews(String sourceId)async{
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNews(sourceId);
      if(response?.status=="error"){
        emit(NewsErrorState(errorMessage: response!.message!));
      }
      if(response?.status=="ok"){
        emit(NewsSuccessState(newsList: response!.articles!));

      }
    }
    catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));

    }

  }


}