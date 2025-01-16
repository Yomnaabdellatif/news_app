import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/ui/home/category/source_tab_widget.dart';
import 'package:news_app/utilities/app_colors.dart';

import '../../../model/SourceResponse.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName="category";

  const CategoryDetails({super.key});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManger.getSources(),
        builder: (context,snapshot){
          // LOADING..........
          if(snapshot.connectionState==ConnectionState.waiting){
            return  Center(child: CircularProgressIndicator(color: AppColors.gray,),);
          }else if (snapshot.hasError){
            return Center(
              child: Column(children: [
                Text("WRONG IN connection",style: Theme.of(context).textTheme.labelMedium),
                TextButton(onPressed: (){

                  ApiManger.getSources();
                  setState(() {

                  });

                },style:OutlinedButton.styleFrom(backgroundColor: AppColors.gray)
                    , child: Text("TRY AGAIN",style: Theme.of(context).textTheme.labelLarge))
              ],),
            );

          } if(snapshot.data!.status!="ok"){
            return Column(children: [
              Text(snapshot.data!.message!,style: Theme.of(context).textTheme.labelMedium,),
              TextButton(onPressed: (){

                ApiManger.getSources();
                setState(() {

                });
              },style:OutlinedButton.styleFrom(backgroundColor: AppColors.gray)
                  ,child: Text("TRY AGAIN",style: Theme.of(context).textTheme.labelLarge))
            ],);

          }
          var sourceList=snapshot.data!.sources!;
           return SourceTabWidget(sourcesList:sourceList);
        }

    );
  }
}
