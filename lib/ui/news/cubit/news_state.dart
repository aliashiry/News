
import 'package:app_news/data/model/NewsResponse.dart';

abstract class NewsState {}

class InitialState {}

class NewsLoadingState extends NewsState {}

class NewsErrorState extends NewsState {
  String? message;

  NewsErrorState({required this.message});
}

class NewsSuccessState extends NewsState {
  List<News> newsList;

  NewsSuccessState({required this.newsList});
}

class ChangeSourceState extends NewsState {
  int selectedIndex;

  ChangeSourceState({required this.selectedIndex});
}
