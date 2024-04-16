part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class Plusbuttonclickedevent extends HomeEvent{
  final int number;
  Plusbuttonclickedevent(this.number);
  List<Object?> get props => [number];

}

class Minusbuttonclickedevent extends HomeEvent{
  final int number;
  Minusbuttonclickedevent(this.number);
  List<Object?> get props => [number];
}

// class Togglebuttonclickedevent extends HomeEvent{}

class TogglebuttonNavigateevent extends HomeEvent{}