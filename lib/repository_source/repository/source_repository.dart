import 'package:app_news/model/SourceResponse.dart';

abstract class SourceRepositoryContract {
  Future<SourceResponse?> getSources(categoryId);
}
