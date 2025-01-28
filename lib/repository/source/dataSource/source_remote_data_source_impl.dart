import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource{
  ApiManger apiManger;
  SourceRemoteDataSourceImpl({required this.apiManger});
  @override
  Future<SourceResponse?> getSources(String categoryId)async {
    // TODO: implement getSources
    var response=await apiManger.getSources(categoryId);
    return response;

  }
}