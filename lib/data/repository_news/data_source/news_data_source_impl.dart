import 'package:app_news/data/api/api_manager.dart';
import 'package:app_news/data/model/NewsResponse.dart';
import 'package:app_news/data/repository_news/data_source/news_data_source.dart';


class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;

  NewsRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId: sourceId);
    return response;
  }
}
