import 'package:app_news/data/api/api_manager.dart';
import 'package:app_news/data/dependency_injection/dependency_injection_news.dart';
import 'package:app_news/data/model/SourceResponse.dart';
import 'package:app_news/ui/news/cubit/news_state.dart';
import 'package:app_news/ui/news/cubit/news_view_model.dart';
import 'package:app_news/ui/news/news_item.dart';
import 'package:app_news/ui/theme/my_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsWidget extends StatefulWidget {
  Source source;
  ApiManager? apiManager;

  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

NewsViewModel viewModel = NewsViewModel(newsRepositoryContract: injectNewsRepositoryContract());

class _NewsWidgetState extends State<NewsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    viewModel.getNewsBySourceId(widget.source.id ?? '');
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        if (state is NewsLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: MyTheme.primaryLightColor,
            ),
          );
        } else if (state is NewsErrorState) {
          return Column(
            children: [
              Text('Something went wrong '),
              ElevatedButton(
                  onPressed: () {
                    viewModel.getNewsBySourceId(
                      widget.source.id ?? '',
                    );
                    setState(() {});
                  },
                  child: Text('Try Again'))
            ],
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItem(news: state.newsList[index]);
            },
            itemCount: state.newsList.length,
          );
        }
        return Container();
      },
    );
  }
}
