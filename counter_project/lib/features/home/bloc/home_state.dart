part of 'home_bloc.dart';

@immutable
abstract class HomeState {}
abstract class HomeActionState extends HomeState{}
class HomeInitialstate extends HomeState {}

class Plusbuttonclickedstate extends HomeActionState{}

class Minusbuttonclickedstate extends HomeActionState{}

class Togglebuttonclickedstate extends HomeActionState{}

class TogglebuttonNavigatestate extends HomeActionState{}


// class 
