import 'package:app_news/model/SourceResponse.dart';

abstract class SourceRemoteDataSource {
  Future<SourceResponse?> getSources(categoryId);
}

abstract class SourceLocalDataSource {}
