import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/bottom_sheets/show_article_in_bottom_sheet.dart';
import 'package:news_app/ui/home/news/news_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../api/api_manger.dart';
import '../../../utilities/app_colors.dart';

class NewsWidget extends StatefulWidget {
Source source;
NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}
class _NewsWidgetState extends State<NewsWidget> {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return FutureBuilder<NewsResponse?>(
        future: ApiManger.getNewsBySourceIdLocalization(widget.source.id!,context),
    builder: (context,snapshot){
    // LOADING..........
    if(snapshot.connectionState==ConnectionState.waiting){
    return  Center(child: CircularProgressIndicator(color: AppColors.gray,),);
    }else if (snapshot.hasError){
    return Center(
    child: Column(children: [
    Text("WRONG IN connection",style: Theme.of(context).textTheme.labelMedium),
    TextButton(onPressed: (){

    ApiManger.getNewsBySourceIdLocalization(widget.source.id!,context);
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

    ApiManger.getNewsBySourceIdLocalization(widget.source.id!,context);
    setState(() {

    });
    },style:OutlinedButton.styleFrom(backgroundColor: AppColors.gray)
    ,child: Text("TRY AGAIN",style: Theme.of(context).textTheme.labelLarge))
    ],);

    }
    var newsList=snapshot.data!.articles;
            return ListView.separated(itemBuilder:
                (context,index){


              return
                InkWell(onTap: (){
                showBottomSheet(context,
                    ShowArticleInBottomSheet(articleList: newsList, index: index));
              },
                  child: NewsItem(news: newsList[index]));
            },padding: EdgeInsets.only(top: height*(24/852)),
                separatorBuilder: (context,index){
              return SizedBox(height:height*(24/852) );
                }, itemCount: newsList!.length);
        }

        ,);
  }
  void showBottomSheet(BuildContext context,Widget widget) {
    showModalBottomSheet(backgroundColor: AppColors.transparent,
        context: context,
        builder: (context)=>widget);


  }

}
