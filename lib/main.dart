import 'package:flutter/material.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/splash_screen.dart';
import 'package:news_app/utilities/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();

  final languageProvider = AppLanguageProvider();
  final themeProvider = AppThemeProvider();
   languageProvider.loadLanguage();
   themeProvider.loadTheme();
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context)=>languageProvider),
        ChangeNotifierProvider(create: (context)=>themeProvider),

      ],

          child: MyApp()));}


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var languageProvider= Provider.of<AppLanguageProvider>(context);
    var themeProvider= Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      locale:Locale(languageProvider.appLanguage) ,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.appTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute:SplashScreen.routeName,
      routes:
      {
        SplashScreen.routeName :(context)=> SplashScreen(),
        HomeScreen.routeName :(context)=> HomeScreen(),


      },

    );
  }



}