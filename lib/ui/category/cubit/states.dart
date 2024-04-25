
import 'package:app_news/data/model/SourceResponse.dart';

abstract class SourceState {}

class InitialState extends SourceState {}

class LoadingSourceState extends SourceState {}

class FailedSourceState extends SourceState {
  String? message;

  FailedSourceState({String? this.message});
}

class SuccessSourceState extends SourceState {
  List<Source> sourcesList;

  SuccessSourceState({required this.sourcesList});
}
