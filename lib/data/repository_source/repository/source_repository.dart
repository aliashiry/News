import 'package:app_news/data/model/SourceResponse.dart';

abstract class SourceRepositoryContract {
  Future<SourceResponse?> getSources(categoryId);
}
