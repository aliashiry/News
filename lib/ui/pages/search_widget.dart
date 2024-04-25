import 'package:app_news/data/api/api_manager.dart';
import 'package:app_news/data/model/NewsResponse.dart';
import 'package:app_news/ui/news/news_item.dart';
import 'package:flutter/material.dart';

class NewsSearch extends SearchDelegate {
  static const String routeName = "newsSearch";
  late Future<NewsResponse?> getNewsDataModel;
  late ApiManager apiManager;

  NewsSearch() {
    apiManager = ApiManager();
    getNewsDataModel = apiManager.getNewsBySourceId(searchWords: "");
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          showResults(context);
        },
        icon: const Icon(Icons.search),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.clear,
        size: 32,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //  ApiManager.getNewsBySourceId(searchKeyword:query);
    return FutureBuilder(
      future: apiManager.getNewsBySourceId(searchWords: query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("something went wrong"));
        }
        var articls = snapshot.data?.articles ?? [];
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItem(news: articls[index]);
          },
          itemCount: articls.length,
        );
      },
    );
  }

  //NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('Search'),
    );
  }
}
