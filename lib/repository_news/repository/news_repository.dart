import 'package:app_news/model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}
