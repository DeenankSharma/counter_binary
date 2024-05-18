part of 'home_bloc.dart';

@immutable
abstract class HomeState {
  final int number = 0;
}

abstract class HomeActionState extends HomeState{}

class HomeInitialState extends HomeState {
  final int number=0;
  List<Object> get props => [];
}

class ButtonClickedState extends HomeActionState{
  @override
  final int number;
  final String binary;
  ButtonClickedState(this.number,this.binary);
}


class ToggleButtonNavigateState extends HomeActionState{}
