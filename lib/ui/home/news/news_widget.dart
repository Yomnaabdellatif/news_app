import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/bottom_sheets/show_article_in_bottom_sheet.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:news_app/ui/home/news/news_widget_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../utilities/app_colors.dart';

class NewsWidget extends StatefulWidget {
Source source;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}
class _NewsWidgetState extends State<NewsWidget> {
  var viewModel=NewsWidgetViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id??"");
  }
  @override
  Widget build(BuildContext context) {
    viewModel.getNews(widget.source.id??"");
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
      create: (context)=>viewModel,
      child:Consumer<NewsWidgetViewModel>(builder:(context,viewModel,child){
        if(viewModel.errorMassage!=null){
              return Center(
                child: Column(children: [
                  Text(viewModel.errorMassage!,style: Theme.of(context).textTheme.labelMedium),
                  TextButton(onPressed: (){
                    viewModel.getNews(widget.source.id!);

                  },style:OutlinedButton.styleFrom(backgroundColor: AppColors.gray)
                      , child: Text("TRY AGAIN",style: Theme.of(context).textTheme.labelLarge))
                ],),
              );
        }else if(viewModel.newsList==null){
          return  const Center(child: CircularProgressIndicator(color: AppColors.gray,),);

        }
        else{
            return ListView.separated(itemBuilder:
                (context,index){


              return InkWell(onTap: (){
                showBottomSheet(context,
                    ShowArticleInBottomSheet(articleList: viewModel.newsList!, index: index));
              },
                  child: NewsItem(news: viewModel.newsList![index]));
            },padding: EdgeInsets.only(top: height*(24/852)),
                separatorBuilder: (context,index){
              return SizedBox(height:height*(24/852) );
                }, itemCount: viewModel.newsList!.length);
        }


      } ,)

    );
  }
  void showBottomSheet(BuildContext context,Widget widget) {
    showModalBottomSheet(backgroundColor: AppColors.transparent,
        context: context,
        builder: (context)=>widget);


  }

}
