import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../model/NewsResponse.dart';
import '../../../utilities/app_colors.dart';

class ShowArticleInBottomSheet extends StatelessWidget {
  List<News> articleList;
  int index;
   ShowArticleInBottomSheet({required this.articleList,required this.index});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Container(
      height: height*(680/852),
        margin:  EdgeInsets.symmetric(horizontal: width*(16/393),vertical: height*(16/852)),
        padding:  EdgeInsets.symmetric(horizontal: width*(8/393),vertical: height*(8/852)),
        decoration: BoxDecoration(color:Theme.of(context).indicatorColor,
          borderRadius: BorderRadius.circular(20),),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(

                height:height*(220/852) ,
                width: double.infinity,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(child: CircularProgressIndicator(color: AppColors.gray,),),
                imageUrl: articleList[index].urlToImage??"",
                errorWidget: (context, url, error) =>  Icon(Icons.error,color: Theme.of(context).indicatorColor,),
              ),
            ),
            SizedBox(height:height*(8/852) ,),
            Expanded(
              child: Text(articleList[index].content??"",style: Theme.of(context).textTheme.
              headlineSmall,),
            ),
            SizedBox(height:height*(8/852) ,),

            ElevatedButton(onPressed: (){
              _launchUrl(Uri.parse(articleList[index].url??""));
            }
            ,style: OutlinedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(vertical:height*(20/852) ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                child: Text(AppLocalizations.of(context)!.view_all_article,
                    style:Theme.of(context).textTheme.headlineMedium)
            ,)

          ],));
  }
  Future<void> _launchUrl(Uri url) async {
    try {
      await launchUrl(url);
    } catch (error) {
    }
  }




}
