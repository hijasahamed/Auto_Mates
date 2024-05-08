part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

abstract class SplashActionState extends SplashState {}

class SplashInitial extends SplashState {}

class RefreshButtonClickedActionState extends SplashActionState{}
