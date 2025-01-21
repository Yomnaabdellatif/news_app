import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../providers/app_theme_provider.dart';

class CategoryFragment extends StatelessWidget {
List<CategoryModel> categoriesList=[];
Function onViewAllClicked;
CategoryFragment({required this.onViewAllClicked});
  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemeProvider>(context);
    var categoriesList=CategoryModel.getCategoreisList( themeProvider.isDarkMode(),context);
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return  Container(
      margin: EdgeInsets.symmetric(horizontal: width*(15/393)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.welcome_message,style: Theme.of(context).textTheme.titleLarge,),
          Expanded(child: ListView.separated(itemBuilder: (context,index){
            return Stack(
              alignment:index%2==0?
              Alignment.bottomRight:Alignment.bottomLeft,
              children: [
              ClipRRect(borderRadius: BorderRadius.circular(24),
                  child: Image.asset(categoriesList[index].imagePath)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*(16/393),vertical: height*(16/852)),
              child: ToggleSwitch(

              customWidths: [width*(110/393),width*(45/393)],
              cornerRadius: 24,
              customWidgets:  [
                Text(AppLocalizations.of(context)!.view_all,
                  style:Theme.of(context).textTheme.headlineLarge),
              CircleAvatar(
                backgroundColor: Theme.of(context).primaryColor,
                child: Icon(Icons.arrow_forward_ios,color: Theme.of(context).indicatorColor,),)


              ],
                activeBgColor:[Theme.of(context).primaryColor,Theme.of(context).primaryColor],
            initialLabelIndex: 1,
                inactiveFgColor: AppColors.white,
                inactiveBgColor:  AppColors.gray,
                radiusStyle: true,
                totalSwitches: 2,
              onToggle: (index1) {
                onViewAllClicked(categoriesList[index]);
            },
              ),
            ),
            
            ],);
          },
            itemCount:categoriesList.length ,
            separatorBuilder:(context,index){
              return SizedBox(height: height*(16/852),);
            },))



      ],),


    );
  }
}
