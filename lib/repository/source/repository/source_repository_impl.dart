import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository{
  SourceRemoteDataSource sourceRemote;
  SourceRepositoryImpl({required this.sourceRemote});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    // TODO: implement getSources
return sourceRemote.getSources(categoryId);
  }
  
}