import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';

import '../../../model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{

  List<Source>? sourceList;
  String? errorMassage;
  void getSources(String categoryId)async{
    sourceList=null;
    errorMassage=null;
    notifyListeners();
    try{
  var response= await ApiManger.getSources(categoryId);
  if(response!.status=="error"){
    errorMassage=response.message!;


  }else{
    sourceList=response.sources;
  }}
        catch(e){
      errorMassage=e.toString();

        }
        notifyListeners();


  }


}