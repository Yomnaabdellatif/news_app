import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/bottom_sheets/show_article_in_bottom_sheet.dart';
import 'package:news_app/ui/home/news/cubit/news_states.dart';
import 'package:news_app/ui/home/news/cubit/news_view_model.dart';
import 'package:news_app/ui/home/news/news_item.dart';
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
  var viewModel=NewsViewModel(newsRepository: injectNewsRepository());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNews(widget.source.id??"");
  }
  @override
  void didUpdateWidget(covariant NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.source.id != widget.source.id) {
      viewModel.getNews(widget.source.id ?? "");
    }
  }
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context)=>viewModel,
      child: BlocBuilder<NewsViewModel,NewsStates>(
        builder:(context,state){
          if(state is NewsErrorState){
                    return Center(
                      child: Column(children: [
                        Text(state.errorMessage,style: Theme.of(context).textTheme.labelMedium),
                        TextButton(onPressed: (){
                          viewModel.getNews(widget.source.id!);

                        },style:OutlinedButton.styleFrom(backgroundColor: AppColors.gray)
                            , child: Text("TRY AGAIN",style: Theme.of(context).textTheme.labelLarge))
                      ],),
                    );
          }
          else if (state is NewsSuccessState){

          return
            ListView.separated(itemBuilder:
                          (context,index){
                        return InkWell(onTap: (){
                          showBottomSheet(context,
                              ShowArticleInBottomSheet(articleList: state.newsList, index: index));
                        },
                            child: NewsItem(news: state.newsList[index]));
                      },padding: EdgeInsets.only(top: height*(24/852)),
                          separatorBuilder: (context,index){
                        return SizedBox(height:height*(24/852) );
                          }, itemCount: state.newsList.length);
          }
          else if (state is NewsLoadingState){
            return  const Center(child: CircularProgressIndicator(color: AppColors.gray,),);

          }
          return Container();
        },
      )
    );
  }
  void showBottomSheet(BuildContext context,Widget widget) {
    showModalBottomSheet(backgroundColor: AppColors.transparent,
        context: context,
        builder: (context)=>widget);


  }

}
