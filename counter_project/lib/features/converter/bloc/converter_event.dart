part of 'converter_bloc.dart';

@immutable
abstract class ConverterEvent {}
class ConverterInitialEvent extends ConverterEvent{}

class ToggleButtonBackEvent extends ConverterEvent{}

class ConvertButtonClickedEvent extends ConverterEvent{
  final String binary;
  ConvertButtonClickedEvent({required this.binary});
  
}