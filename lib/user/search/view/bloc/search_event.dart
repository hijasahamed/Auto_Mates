part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class AddingCarForCompareSearchScreenRefreshEvent extends SearchEvent {}
