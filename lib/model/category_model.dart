import 'package:flutter/cupertino.dart';
import 'package:news_app/utilities/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryModel{
  String id;
  String title;
  String imagePath;
  CategoryModel({required this.id,required this.title,required this.imagePath});
  static List<CategoryModel> getCategoriesList(bool isDark,BuildContext context){
    return [
      CategoryModel(id: "general", title: AppLocalizations.of(context)!.general,
          imagePath: isDark? AssetsManager.generalLight:AssetsManager.generalDark),
      CategoryModel(id: "business", title: AppLocalizations.of(context)!.business,
          imagePath: isDark? AssetsManager.businessLight:AssetsManager.businessDark),
      CategoryModel(id: "sports", title: AppLocalizations.of(context)!.sports,
          imagePath: isDark? AssetsManager.sportsLight:AssetsManager.sportsDark),
      CategoryModel(id: "technology", title: AppLocalizations.of(context)!.technology,
          imagePath: isDark? AssetsManager.technologyLight:AssetsManager.technologyDark),
      CategoryModel(id: "science", title: AppLocalizations.of(context)!.science,
          imagePath: isDark? AssetsManager.scienceLight:AssetsManager.scienceDark),
      CategoryModel(id: "health", title: AppLocalizations.of(context)!.health,
          imagePath: isDark? AssetsManager.healthLight:AssetsManager.healthDark),
      CategoryModel(id: "entertainment", title: AppLocalizations.of(context)!.entertainment,
          imagePath: isDark? AssetsManager.entertainmentLight:AssetsManager.entertainmentDark),





      
    ];
  }


}