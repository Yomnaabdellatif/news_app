import 'package:flutter/material.dart';
import 'package:news_app/ui/home/text_with_icon_drawer.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_styles.dart';
import 'package:news_app/utilities/assets_manager.dart';
import 'package:provider/provider.dart';
import '../../providers/app_language_provider.dart';
import '../../providers/app_theme_provider.dart';
import 'bottom_sheets/language_bottom_sheet.dart';
import 'bottom_sheets/theme_bottom_sheet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowDrawer extends StatelessWidget {
  const ShowDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    var themeProvider= Provider.of<AppThemeProvider>(context);
    bool isEnglish=languageProvider.appLanguage=="en";
    // bool isLight=!themeProvider.isDarkMode();

    return Column(
      children:
      [
        Container(alignment: Alignment.center,
          color:AppColors.white,height: height*(188/852),width: double.infinity,
          child: Text( AppLocalizations.of(context)!.news_app,style: AppStyles.bold24Black,),),
        InkWell(onTap: (){
          //todo function
        },
            child: TextWithIconDrawer(text: AppLocalizations.of(context)!.go_to_home ,icon: AssetsManager.iconHome,)),
        Divider(color: AppColors.white,indent: width*(16/393),endIndent:  width*(16/393),),
        TextWithIconDrawer(text: AppLocalizations.of(context)!.theme,icon: AssetsManager.iconRoller,),
        Container(height: height*(56/852),
          margin:  EdgeInsets.symmetric(horizontal: width*(16/393)),
          padding:  EdgeInsets.symmetric(horizontal: width*(16/393)),
          decoration: BoxDecoration(border: Border.all(color: AppColors.white),borderRadius: BorderRadius.circular(16)),

          child:
          InkWell(onTap: (){

            showBottomSheet(context,ThemeBottomSheet());
          },
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(
                themeProvider.isDarkMode()?
                AppLocalizations.of(context)!.dark
                    :
                AppLocalizations.of(context)!.light
                ,style: AppStyles.medium20White,),
                const Icon(Icons.arrow_drop_down,color: AppColors.white,)],),
          ),),
        SizedBox(height: height*(24/852) ),

        Divider(color: AppColors.white,indent: width*(16/393),endIndent:  width*(16/393),),

        TextWithIconDrawer(text:
        AppLocalizations.of(context)!.language
          ,icon: AssetsManager.iconGlobal,),
        Container(height: height*(56/852),
          margin:  EdgeInsets.symmetric(horizontal: width*(16/393)),
          padding:  EdgeInsets.symmetric(horizontal: width*(16/393)),
          decoration: BoxDecoration(border: Border.all(color: AppColors.white),borderRadius: BorderRadius.circular(16)),
          child:
          InkWell(
            onTap: (){

              showBottomSheet(context,LanguageBottomSheet());

            },
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(isEnglish?
                AppLocalizations.of(context)!.english:
              AppLocalizations.of(context)!.arabic
          ,style: AppStyles.medium20White,),
                const Icon(Icons.arrow_drop_down,color: AppColors.white,)],),
          ),),


      ],
    );
  }
  void showBottomSheet(BuildContext context,Widget widget) {
    showModalBottomSheet(context: context,
        builder: (context)=>widget);


  }
}
