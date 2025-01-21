import 'package:flutter/material.dart.';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_styles.dart';

class AppTheme {

  static final ThemeData lightTheme=ThemeData(

    primaryColor: AppColors.white,
        textTheme:
        TextTheme(labelLarge: AppStyles.bold16Black,labelMedium: AppStyles.medium14Black,
            titleLarge:AppStyles.medium24Black ,
            headlineMedium: AppStyles.bold16Black,
            headlineSmall:AppStyles.medium14White,
            titleMedium:AppStyles.medium20Black ,



            headlineLarge: AppStyles.medium20Black),
        indicatorColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.white ,
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:AppColors.black)),
        focusedBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:AppColors.black)),
        disabledBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:AppColors.black)),

      ),

        appBarTheme: AppBarTheme(centerTitle: true,color:AppColors.white,
            iconTheme: IconThemeData(color: AppColors.black) )
  );
  static final ThemeData darkTheme=ThemeData(
      primaryColor: AppColors.black,
      indicatorColor: AppColors.white,

      textTheme: TextTheme(
          labelLarge: AppStyles.bold16White,
          titleLarge:AppStyles.medium24White ,
          headlineSmall:AppStyles.medium14Black ,
          labelMedium: AppStyles.medium14White,
          headlineMedium: AppStyles.bold16White,
          headlineLarge: AppStyles.medium20White,
        titleMedium:AppStyles.medium20White ,

      ),
inputDecorationTheme: InputDecorationTheme(
    enabledBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:AppColors.white)),
    focusedBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:AppColors.white)),
    disabledBorder:
    OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide: BorderSide(color:AppColors.white)),

),

      scaffoldBackgroundColor: AppColors.black ,

      appBarTheme: AppBarTheme(centerTitle: true,color:AppColors.black,
          iconTheme: IconThemeData(color: AppColors.white) ),

  );

}