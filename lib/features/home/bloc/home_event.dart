part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomePageChange extends HomeEvent {
  final int index;

  HomePageChange(this.index);
}

class HomeInitialPage extends HomeEvent {}
