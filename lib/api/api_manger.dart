import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:provider/provider.dart';

import '../providers/app_language_provider.dart';

class ApiManger{
//   authority= base url          unencodedPath = api name
// https://newsapi.org/v2/top-headlines/sources?apiKey=29164841475d49b2b7b0bb5af02f2ce2
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=29164841475d49b2b7b0bb5af02f2ce2
static Future<SourceResponse?>  getSources(String categoryId)async{
  Uri url =Uri.https(ApiConstants.baseUrl,EndPoints.sourceApi,{
    "apiKey":ApiConstants.apiKey,
    "category":categoryId,

  });
try{
  var response =await http.get(url);
//string ->> json --->>> object
  return SourceResponse.fromJson(jsonDecode(response.body));

}catch(e){
  throw e;
}

}
static Future<NewsResponse?> getNewsBySourceIdLocalization(String sourceId,BuildContext context)async{
  var languageProvider= Provider.of<AppLanguageProvider>(context);
  bool isEnglish=languageProvider.appLanguage=="en";
  //   authority= base url          unencodedPath = api name
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=29164841475d49b2b7b0bb5af02f2ce2
  Uri url=Uri.https(ApiConstants.baseUrl,EndPoints.newsApi,
      {"apiKey":ApiConstants.apiKey,
        "sources":sourceId,
        "language":isEnglish?"en":"ar"
      }
  );
  try{
  var response=await http.get(url);
  jsonDecode(response.body);
  return NewsResponse.fromJson(jsonDecode(response.body));}
      catch(e){
    throw e;
      }
}
// loading --- error from server -- error from client---response(error or data)  ===>>>>   use> ====FutureBuilder====
  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    // var languageProvider= Provider.of<AppLanguageProvider>(context);
    bool isEnglish=true;
    //   authority= base url          unencodedPath = api name
//https://newsapi.org/v2/everything?q=bitcoin&apiKey=29164841475d49b2b7b0bb5af02f2ce2
    Uri url=Uri.https(ApiConstants.baseUrl,EndPoints.newsApi,
        {"apiKey":ApiConstants.apiKey,
          "sources":sourceId,
          "language":isEnglish?"en":"ar"
        }
    );
    try{
      var response=await http.get(url);
      jsonDecode(response.body);
      return NewsResponse.fromJson(jsonDecode(response.body));}
    catch(e){
      throw e;
    }
  }


}
