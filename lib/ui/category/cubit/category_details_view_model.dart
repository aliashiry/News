import 'package:app_news/data/repository_source/repository/source_repository.dart';
import 'package:app_news/ui/category/cubit/states.dart';
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
