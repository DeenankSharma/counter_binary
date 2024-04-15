part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class Plusbuttonclickedevent extends HomeEvent{}

class Minusbuttonclickedevent extends HomeEvent{}

class Togglebuttonclickedevent extends HomeEvent{}

class TogglebuttonNavigateevent extends HomeEvent{}