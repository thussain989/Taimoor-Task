part of 'shopping_cubit.dart';

abstract class ShoppingState extends Equatable {
  const ShoppingState();
  @override
  List<Object> get props => [];
}

class ShoppingInitial extends ShoppingState {}

class FetchingMoreSuggestions extends ShoppingState {}

class SuggestionsFetched extends ShoppingState {
  final List<String> suggestionList;

  const SuggestionsFetched({required this.suggestionList});
}
