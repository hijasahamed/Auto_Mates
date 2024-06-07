part of 'buy_screen_bloc.dart';

@immutable
abstract class BuyScreenEvent {}

class InterstButtonClickedRebuildUiEvent  extends BuyScreenEvent {}

class FavouriteButtonClickedRebuildUiEvent  extends BuyScreenEvent {}

class FilterButtonClickedEvent extends BuyScreenEvent {}