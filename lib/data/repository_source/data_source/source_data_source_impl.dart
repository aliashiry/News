import 'package:app_news/data/api/api_manager.dart';
import 'package:app_news/data/model/SourceResponse.dart';
import 'package:app_news/data/repository_source/data_source/source_data_source.dart';


class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
