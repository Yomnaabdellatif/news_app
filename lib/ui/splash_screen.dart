import 'package:flutter/material.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/utilities/assets_manager.dart';
import 'package:provider/provider.dart';

import '../providers/app_theme_provider.dart';
import '../utilities/app_theme.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var themeProvider= Provider.of<AppThemeProvider>(context);
    bool isLight= themeProvider.appTheme==ThemeMode.light;
    return Scaffold(

      body: Image.asset(isLight?
        AssetsManager.splashLight : AssetsManager.splashDark

        ,
        fit: BoxFit.fill,
        width: double.infinity,height: double.infinity,),
    );
  }
}