import 'package:app_news/model/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}

abstract class NewsLocalDataSource {}
