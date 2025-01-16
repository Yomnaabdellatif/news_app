import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/source_name_item.dart';
import 'package:news_app/utilities/app_colors.dart';

import '../../../model/SourceResponse.dart';

class SourceTabWidget extends StatefulWidget {
List<Source> sourcesList;

SourceTabWidget({required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.sourcesList.length,
        child: TabBar(isScrollable: true,
          onTap: (index){
            selectedIndex=index;
            setState(() {

            });
          },

          tabAlignment: TabAlignment.start,
          indicatorColor: Theme.of(context).indicatorColor,
          dividerColor: AppColors.transparent,

          tabs: widget.sourcesList.map((source){
      return SourceNameItem(source: source, isSelected: selectedIndex==widget.sourcesList.indexOf(source));
    }).toList(),));
  }
}
