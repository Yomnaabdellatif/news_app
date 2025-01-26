import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/ui/home/category/cubit/source_states.dart';

class SourceViewModel extends Cubit<SourceStates>{
  SourceViewModel():super(SourceLoadingState());
int selected=0;

  void getSources(String categoryId)async{
    try{
      emit(SourceLoadingState());
   var response= await ApiManger.getSources(categoryId);
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

  void changeIndex(int index) {
    selected = index;
    emit(ChangeSelectedSource(selectedSource: selected));
  }
}