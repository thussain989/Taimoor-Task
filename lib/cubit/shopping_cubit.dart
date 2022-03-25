import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shopping_state.dart';

class ShoppingCubit extends Cubit<ShoppingState> {
  List<String> suggestionList = [];
  ShoppingCubit() : super(ShoppingInitial());

  void fillInitialList(List<String> suggestions) {
    emit(FetchingMoreSuggestions());
    suggestionList.clear();
    suggestionList = suggestions;
    emit(SuggestionsFetched(suggestionList: suggestionList));
  }

  Future<void> fetchMoreSuggestion() async {
    emit(FetchingMoreSuggestions());
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < 10; i++) {
      suggestionList
          .add(suggestionList[Random().nextInt(suggestionList.length - 1)]);
    }
    emit(SuggestionsFetched(suggestionList: suggestionList));
  }
}
