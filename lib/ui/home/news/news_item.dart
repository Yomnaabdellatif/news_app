import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart.';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_styles.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/app_language_provider.dart';


class NewsItem extends StatefulWidget {
News news;
NewsItem({required this.news});

  @override
  State<NewsItem> createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    bool isEnglish=languageProvider.appLanguage=="en";

    return Container(

      margin:  EdgeInsets.symmetric(horizontal: width*(16/393)),
      padding:  EdgeInsets.symmetric(horizontal: width*(10/393),vertical: height*0.01),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),border:
      Border.all(color: Theme.of(context).indicatorColor)
        ,color: Theme.of(context).primaryColor
    ),
      child: Column(children: [
        ClipRRect(borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(

              height:height*(220/852) ,
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => new Center(child: CircularProgressIndicator(color: AppColors.gray,),),
              imageUrl: widget.news.urlToImage??"",

              errorWidget: (context, url, error) =>  Icon(Icons.error,color: Theme.of(context).indicatorColor,),
            ),),
        Text(widget.news.title??"",style: Theme.of(context).textTheme.labelLarge,maxLines: 2,),
        Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

    Expanded(child: Text("${AppLocalizations.of(context)!.by} : ${widget.news.author??""}",style: AppStyles.medium12Gray,)),
          Text(getTimeAgo(widget.news.publishedAt!,isEnglish?"en":"ar"),style: AppStyles.medium12Gray,)

        ],)

      ],),);
  }
  String getTimeAgo(String time,[String? locale]){
    final publishedDate =DateTime.parse(time);
    var difference = DateTime.now().difference(publishedDate);
    var timeAgo = DateTime.now().subtract(difference);
     timeago.setLocaleMessages('ar', timeago.ArMessages());
    var timeAgoUsed= timeago.format(timeAgo,locale: locale);

    return timeAgoUsed;
  }
}
