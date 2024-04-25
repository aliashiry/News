import 'package:app_news/data/model/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}

abstract class NewsLocalDataSource {}
