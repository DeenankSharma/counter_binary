part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class PlusButtonClickedEvent extends HomeEvent{
  final int number;
  PlusButtonClickedEvent(this.number);
  List<Object?> get props => [number];

}

class MinusButtonClickedEvent extends HomeEvent{
  final int number;
  MinusButtonClickedEvent(this.number);
  List<Object?> get props => [number];
}

class ToggleButtonNavigateEvent extends HomeEvent{}