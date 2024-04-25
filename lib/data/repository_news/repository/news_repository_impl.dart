import 'package:app_news/data/model/NewsResponse.dart';
import 'package:app_news/data/repository_news/data_source/news_data_source.dart';
import 'package:app_news/data/repository_news/repository/news_repository.dart';


class NewsRepositoryImpl implements NewsRepositoryContract {
  NewsRemoteDataSource newsRemoteDataSource;

  NewsRepositoryImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse> getNewsBySourceId(String sourceId) {
    return newsRemoteDataSource.getNewsBySourceId(sourceId);
  }
}
