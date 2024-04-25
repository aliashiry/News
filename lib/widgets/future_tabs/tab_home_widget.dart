import 'package:app_news/model/SourceResponse.dart';
import 'package:app_news/widgets/future_tabs/tab_item_design.dart';
import 'package:app_news/widgets/news/cubit/news_view_model.dart';
import 'package:app_news/widgets/news/news.dart';
import 'package:flutter/material.dart';

class TabHomeWidget extends StatefulWidget {
  List<Source> sourcesList;

  int selectedIndex = 0;

  TabHomeWidget({required this.sourcesList});

  @override
  State<TabHomeWidget> createState() => _TabHomeWidget();
}

class _TabHomeWidget extends State<TabHomeWidget> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
              onTap: (index) {
                setState(() {
                  widget.selectedIndex = index;
                });
              },
              isScrollable: true,
              indicatorColor: Colors.transparent,
              tabs: widget.sourcesList
                  .map((source) => TabItem(
                        source: source,
                        isSelected: widget.selectedIndex ==
                            widget.sourcesList.indexOf(source),
                      ))
                  .toList()),
          Expanded(
              child:
                  NewsWidget(source: widget.sourcesList[widget.selectedIndex])),
        ],
      ),
    );
  }
}
