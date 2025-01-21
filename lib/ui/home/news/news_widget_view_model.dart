import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';

import '../../../model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier{
  List<News>? newsList;
  String? errorMassage;
  void getNews(String sourceId)async{
    newsList=null;
    errorMassage=null;
    notifyListeners();
    try
    {
   var response=await ApiManger.getNewsBySourceId(sourceId);
   if(response!.status=="error"){
     errorMassage=response.message;

   }else {
     newsList=response.articles;
   }}catch(e){
      errorMassage=e.toString();
    }
    notifyListeners();
  }
}