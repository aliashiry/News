import 'package:app_news/api/api_manager.dart';
import 'package:app_news/repository_news/data_source/news_data_source.dart';
import 'package:app_news/repository_news/data_source/news_data_source_impl.dart';
import 'package:app_news/repository_news/repository/news_repository.dart';
import 'package:app_news/repository_news/repository/news_repository_impl.dart';


NewsRepositoryContract injectNewsRepositoryContract(){
  return NewsRepositoryImpl(newsRemoteDataSource: injectNewsRemoteDataSource());
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: injectApiManager());
}
ApiManager injectApiManager(){
  return ApiManager();
}