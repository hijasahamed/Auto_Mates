part of 'buy_screen_bloc.dart';

@immutable
sealed class BuyScreenState {}

final class BuyScreenInitial extends BuyScreenState {}

class InterstButtonClickedRebuildUiState extends BuyScreenState {}

class FavouriteButtonClickedRebuildUiState extends BuyScreenState {}

class FilterButtonClickedState extends BuyScreenState {}