part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final number = 0;
}

abstract class HomeActionState extends HomeState{}

class HomeInitialstate extends HomeState {
  final int number=0;
  List<Object> get props => [];
}

class buttonclickedstate extends HomeActionState{
  final int number;
  buttonclickedstate(this.number);
  List<Object?> get props => [number];
}

// class Minusbuttonclickedstate extends HomeActionState{}

// class Togglebuttonclickedstate extends HomeActionState{}

class TogglebuttonNavigatestate extends HomeActionState{}
