part of 'converter_bloc.dart';

@immutable
abstract class ConverterState {}
class ConverterActionState extends ConverterState{}

class ConverterInitialState extends ConverterActionState {}

class ToggleButtonBackState extends ConverterActionState{}

class ConvertButtonClickedState extends ConverterInitialState{
  final String decimal;
  ConvertButtonClickedState({required this.decimal});
}