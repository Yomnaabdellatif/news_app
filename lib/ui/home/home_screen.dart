import 'package:flutter/material.dart.';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home/show_drawer.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
   static const String routeName="homeScreen";

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;

    return Scaffold(appBar:
    AppBar(title: Text("Home",style: Theme.of(context).textTheme.headlineLarge,),actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width*(16/393)),
        child: Image.asset(AssetsManager.iconSearch,color: Theme.of(context).appBarTheme.iconTheme!.color,),
      )],),
      drawer:
      Drawer(child: ShowDrawer(),backgroundColor: AppColors.black,width:width*(269/393) ,) ,
      body: CategoryDetails(),);
  }
}
