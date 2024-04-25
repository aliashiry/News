import 'package:app_news/api/api_manager.dart';
import 'package:app_news/repository_news/data_source/news_data_source.dart';
import 'package:app_news/repository_news/data_source/news_data_source_impl.dart';
import 'package:app_news/repository_news/repository/news_repository.dart';
import 'package:app_news/repository_news/repository/news_repository_impl.dart';
import 'package:app_news/widgets/news/cubit/news_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsViewModel extends Cubit<NewsState> {
  NewsRepositoryContract newsRepositoryContract;
  NewsViewModel({ required this.newsRepositoryContract}) : super(NewsLoadingState());

  int selectedIndex = 0;

  void changeSourceState(int newSourceState) {
    emit(NewsLoadingState());
    if (selectedIndex == newSourceState) {
      return;
    }
    selectedIndex = newSourceState;
    emit(ChangeSourceState(selectedIndex: selectedIndex));
  }

  void getNewsBySourceId(String sourceId) async {
    try {
      var response = await newsRepositoryContract.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        emit(NewsErrorState(message: response.message));
      } else {
        emit(NewsSuccessState(newsList: response.articles!));
      }
    } catch (e) {
      rethrow;
    }
  }
}
