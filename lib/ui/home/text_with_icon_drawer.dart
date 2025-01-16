import 'package:flutter/material.dart';
import 'package:news_app/utilities/app_colors.dart';
import 'package:news_app/utilities/app_styles.dart';

class TextWithIconDrawer extends StatelessWidget {
  String icon;
  String text;
  TextWithIconDrawer({required this.icon,required this.text});



  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width*(16/393),vertical:height*(10/852) ),
      child: Row(children: [
        ImageIcon(AssetImage(icon,),color: AppColors.white,),
        SizedBox(width:width*(10/393) ),
        Text(text,style: AppStyles.bold20White,)
      ],),
    );
  }
}
