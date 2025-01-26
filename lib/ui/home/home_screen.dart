import 'package:flutter/material.dart.';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home/category/category_fragment.dart';
import 'package:news_app/ui/home/home_drawer.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/assets_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
   static const String routeName="homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearch=false;
  @override
  Widget build(BuildContext context) {

    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(appBar:
    AppBar(title: !isSearch?
    Text(
      selectedCategory==null?AppLocalizations.of(context)!.home:
    selectedCategory!.title,style: Theme.of(context).textTheme.headlineLarge,):
        Container(height: height*(62/852),
          width: width*(361/393),
          child:
          TextField(style: Theme.of(context).textTheme.titleMedium,
            decoration:
            InputDecoration(
              hintText: AppLocalizations.of(context)!.search,
              hintStyle:Theme.of(context).textTheme.titleMedium ,
              suffixIcon:IconButton(onPressed: (){
                isSearch=false;
                setState(() {
                });
              },icon: Icon(Icons.close,color: Theme.of(context).indicatorColor,),)
              ,prefixIcon:Image.asset(AssetsManager.iconSearch,color: Theme.of(context).indicatorColor,) ,
              disabledBorder:Theme.of(context).inputDecorationTheme.disabledBorder,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
              enabledBorder:Theme.of(context).inputDecorationTheme.enabledBorder ,)
            ,),
        )
      , 
      actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width*(16/393)),
        child:
        InkWell(
          onTap: (){
            isSearch=true;
            setState(() {

            });
          },
            child: Image.asset(AssetsManager.iconSearch,color: Theme.of(context).appBarTheme.iconTheme!.color,))
      )],scrolledUnderElevation: 0,),
      drawer:
      Drawer(child: HomeDrawer(onDrawerItem: onDrawerItem,),backgroundColor: AppColors.black,width:width*(269/393) ,) ,

      //
      body: selectedCategory==null?
      CategoryFragment(onViewAllClicked:onViewAllClicked ,)
          :CategoryDetails(category:selectedCategory! ,)

      ,);
  }

  CategoryModel? selectedCategory;

  void onViewAllClicked(CategoryModel newSelectedCategory){
    selectedCategory=newSelectedCategory;
    setState(() {

    });


  }
  void onDrawerItem(){
    selectedCategory=null;
    Navigator.pop(context);
    setState(() {

    });


  }
}
