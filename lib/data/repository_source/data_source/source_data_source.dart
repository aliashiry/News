import 'package:app_news/data/model/SourceResponse.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSources(categoryId);
}

abstract class SourceLocalDataSource {}
