// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/ui/home/category/cubit/source_states.dart';
// import 'package:news_app/ui/home/category/cubit/source_view_model.dart';
// import 'package:news_app/ui/home/category/source_name_item.dart';
// import 'package:news_app/ui/home/news/news_widget.dart';
// import 'package:news_app/utilities/app_colors.dart';
//
// import '../../../model/SourceResponse.dart';
//
// class SourceTabWidget extends StatefulWidget {
//   List<Source> sourcesList;
//
// SourceTabWidget({required this.sourcesList});
//
//   @override
//   State<SourceTabWidget> createState() => _SourceTabWidgetState();
// }
//
// class _SourceTabWidgetState extends State<SourceTabWidget> {
// var viewModel=SourceViewModel();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context)=>SourceViewModel(),
//       child:
//       BlocBuilder<SourceViewModel,SourceStates>(
//         builder : (context,state){
//           {
//
//           return DefaultTabController(
//               length: widget.sourcesList.length,
//             child: Column(
//               children: [
//                 TabBar(isScrollable: true,
//                   onTap: (index){
//                      viewModel.changeIndex(index);
//                   },
//
//                   tabAlignment: TabAlignment.start,
//                   indicatorColor: Theme.of(context).indicatorColor,
//                   dividerColor: AppColors.transparent,
//
//                   tabs:
//                   widget.sourcesList.map((source){
//                     print(viewModel.selected);
//                       return
//                         SourceNameItem(source: source,
//                           isSelected: viewModel.selected== widget.sourcesList.indexOf(source));
//                     }).toList(),),
//                 Expanded(child: NewsWidget(source:widget.sourcesList[viewModel.selected]))
//               ],
//             ));
//           }
//
//           },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/source_name_item.dart';
import 'package:news_app/ui/home/news/news_widget.dart';
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
        child: Column(
          children: [
            TabBar(isScrollable: true,
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
              }).toList(),),
            Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex]))
          ],
        ));
  }
}