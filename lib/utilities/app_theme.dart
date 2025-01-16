import 'package:flutter/material.dart.';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_styles.dart';

class AppTheme {

  static final ThemeData lightTheme=ThemeData(
    primaryColor: AppColors.white,
        textTheme: TextTheme(labelLarge: AppStyles.bold16Black,labelMedium: AppStyles.medium14Black,headlineLarge: AppStyles.medium20Black),
        indicatorColor: AppColors.black,

      scaffoldBackgroundColor: AppColors.white ,
        appBarTheme: AppBarTheme(centerTitle: true,color:AppColors.white,
            iconTheme: IconThemeData(color: AppColors.black) )
  );
  static final ThemeData darkTheme=ThemeData(
      primaryColor: AppColors.white,
      indicatorColor: AppColors.black,

      textTheme: TextTheme(labelLarge: AppStyles.bold16White,labelMedium: AppStyles.medium14White,headlineLarge: AppStyles.medium20Black),
      scaffoldBackgroundColor: AppColors.black ,

      appBarTheme: AppBarTheme(centerTitle: true,color:AppColors.black,
          iconTheme: IconThemeData(color: AppColors.white) )
  );

}