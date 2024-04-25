



import 'package:app_news/data/api/api_manager.dart';
import 'package:app_news/data/repository_source/data_source/source_data_source.dart';
import 'package:app_news/data/repository_source/data_source/source_data_source_impl.dart';
import 'package:app_news/data/repository_source/repository/source_repository.dart';
import 'package:app_news/data/repository_source/repository/source_repository_impl.dart';

SourceRepositoryContract injectSourceRepositoryContract(){
return SourceRepositoryImpl(sourceRemoteDataSource: injectSourceRemoteDataSource());
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: injectApiManager());
}
ApiManager injectApiManager(){
  return ApiManager();
}