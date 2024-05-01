part of 'appbottombar_bloc.dart';

@immutable
abstract class AppbottombarState {}

abstract class AppbottombarActionState extends AppbottombarState {}

class AppbottombarInitial extends AppbottombarState {}

class OntapIndexChangeState extends AppbottombarActionState {}
