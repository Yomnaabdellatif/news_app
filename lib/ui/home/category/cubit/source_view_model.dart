import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source.dart';
import 'package:news_app/repository/source/dataSource/source_remote_data_source_impl.dart';
import 'package:news_app/repository/source/repository/source_repository.dart';
import 'package:news_app/repository/source/repository/source_repository_impl.dart';
import 'package:news_app/ui/home/category/cubit/source_states.dart';

import '../../../../model/SourceResponse.dart';

class SourceViewModel extends Cubit<SourceStates>{
   SourceRepository sourceRepository;
  // late SourceRemoteDataSource sourceRemote;
  // late ApiManger apiManger;
   //

   SourceViewModel({required this.sourceRepository}):super(SourceLoadingState());
  // {
  //   apiManger= ApiManger();
  //   sourceRemote=SourceRemoteDataSourceImpl(apiManger: apiManger);
  //   sourceRepository=SourceRepositoryImpl(sourceRemote: sourceRemote);
  // }
int selected=0;

  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());

   var response= await sourceRepository.getSources(categoryId);
   if(response?.status=="error"){
     emit(SourceErrorState(errorMessage: response!.message!));
return;
   }
   if(response?.status=="ok"){
     emit(SourceSuccessState(sourceList: response!.sources!));
     return;

   }
  }catch(e){
      emit(SourceErrorState(errorMessage: e.toString()));

    }

}

  int changeIndex(int index) {
    selected = index;
    emit(ChangeSelectedSource(selectedSource: selected));
    return selected;
  }

  }
