part of 'dictionary_cubit.dart';

@immutable
abstract class DictionaryState {}

class DictionaryInitial extends DictionaryState {}

class HomeState extends DictionaryState {
  // no words searched state the home screen
}

class SearchingState extends DictionaryState {
  // searching state
}

class SearchedState extends DictionaryState {
  final List<DictionaryResponse> words;
  SearchedState(this.words);
  // finished searching state
}

class ErrorState extends DictionaryState {
  // if there is an error
}
