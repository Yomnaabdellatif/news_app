import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category/cubit/source_states.dart';
import 'package:news_app/ui/home/category/cubit/source_view_model.dart';
import 'package:news_app/ui/home/category/source_tab_widget.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
CategoryModel category;
CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {

  var viewModel=SourceViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context)=>viewModel,
      child: BlocBuilder<SourceViewModel,SourceStates>(builder:(context,state){

         if(state is SourceErrorState){
                return Center(
                  child: Column(children: [
                              Text(state.errorMessage,style: Theme.of(context).textTheme.labelMedium),
                              TextButton(onPressed: (){

                                viewModel.getSources(widget.category.id);

                              },style:OutlinedButton.styleFrom(backgroundColor: AppColors.gray)
                                  , child: Text("TRY AGAIN",style: Theme.of(context).textTheme.labelLarge))
                            ],),
                );

        }
        else if (state is SourceSuccessState){
          return SourceTabWidget(sourcesList:state.sourceList);

        }
         else{
       return  const Center(child: CircularProgressIndicator(color: AppColors.gray,),);
         }


        }
      ),
    );
  }
}
