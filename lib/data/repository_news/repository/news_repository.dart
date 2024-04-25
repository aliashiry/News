
import 'package:app_news/data/model/NewsResponse.dart';

abstract class NewsRepositoryContract {
  Future<NewsResponse> getNewsBySourceId(String sourceId);
}
