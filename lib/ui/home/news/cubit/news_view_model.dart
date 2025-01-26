import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';

class NewsViewModel extends Cubit<NewsStates>{
  NewsViewModel():super(NewsLoadingState());
  void getNews(String sourceId)async{
    try {
      emit(NewsLoadingState());
      var response = await ApiManger.getNewsBySourceId(sourceId);
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