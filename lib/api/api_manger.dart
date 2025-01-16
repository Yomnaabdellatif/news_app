import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManger{
//   authority base url          unencodedPath= api name
// https://newsapi.org/v2/top-headlines/sources?apiKey=29164841475d49b2b7b0bb5af02f2ce2
static Future<SourceResponse?>  getSources()async{
  Uri url =Uri.https(ApiConstants.baseUrl,EndPoints.sourceApi,{"apiKey":ApiConstants.apiKey});
try{
  var response =await http.get(url);
//string ->> json --->>> object
  return SourceResponse.fromJson(jsonDecode(response.body));

}catch(e){
  throw e;
}

}

}