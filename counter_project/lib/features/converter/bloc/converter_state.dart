part of 'converter_bloc.dart';

@immutable
abstract class ConverterState {}
class ConverterActionState extends ConverterState{}

class ConverterInitialState extends ConverterActionState {}

class ToggleButtonBackState extends ConverterActionState{}

class Convertbuttonclickedstate extends ConverterActionState{}