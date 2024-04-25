import 'package:app_news/api/api_manager.dart';
import 'package:app_news/repository_source/data_source/source_data_source.dart';
import 'package:app_news/repository_source/data_source/source_data_source_impl.dart';
import 'package:app_news/repository_source/repository/source_repository.dart';
import 'package:app_news/repository_source/repository/source_repository_impl.dart';
import 'package:app_news/widgets/category/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailsViewModel extends Cubit<SourceState> {
   SourceRepositoryContract sourceRepositoryContract;
  CategoryDetailsViewModel({required this.sourceRepositoryContract}) : super(LoadingSourceState());

  void getDetails(String categoryId) async {
    try {
      var response = await sourceRepositoryContract.getSources(categoryId);
      if (response!.status == 'error') {
        emit(FailedSourceState(message: response.message));
      } else {
        emit(SuccessSourceState(sourcesList: response.sources!));
      }
    } catch (e) {
      rethrow;
    }
  }
}
