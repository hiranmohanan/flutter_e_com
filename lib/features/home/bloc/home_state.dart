part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomePageState extends HomeState {
  final int index;

  HomePageState(this.index);
}