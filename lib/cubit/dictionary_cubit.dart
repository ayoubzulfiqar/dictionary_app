import 'package:bloc/bloc.dart';
import 'package:dictionary/model/dictionary_response.dart';
import 'package:dictionary/repository/dictionary_repository.dart';
import 'package:flutter/cupertino.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final DictionaryRepository _repository;
  DictionaryCubit(this._repository) : super(HomeState());
  final queryController = TextEditingController();

  Future getWordsFromDictionary() async {
    emit(SearchingState());

    try {
      final words =
          await _repository.getWordsFromDictionary(queryController.text);
      if (words == null) {
        // print(words.toString());
        emit(ErrorState());
      } else {
        // print(words.toString());
        emit(SearchedState(words));
      }
    } on Exception catch (e) {
      // print(e);
      emit(ErrorState());
    }
  }
}
