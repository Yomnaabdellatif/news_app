import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category/category_details_view_model.dart';
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

  var viewModel=CategoryDetailsViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getSources(widget.category.id);
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child: Consumer<CategoryDetailsViewModel>(builder: (context,viewModel,child){
        if(viewModel.errorMassage!=null){
          return Center(
            child: Column(children: [
                        Text(viewModel.errorMassage!,style: Theme.of(context).textTheme.labelMedium),
                        TextButton(onPressed: (){

                          viewModel.getSources(widget.category.id);

                        },style:OutlinedButton.styleFrom(backgroundColor: AppColors.gray)
                            , child: Text("TRY AGAIN",style: Theme.of(context).textTheme.labelLarge))
                      ],),
          );

        }
        else if(viewModel.sourceList==null){
          return  const Center(child: CircularProgressIndicator(color: AppColors.gray,),);
        }
        else{
          return SourceTabWidget(sourcesList:viewModel.sourceList!);
        }

      },)

    );
  }
}
