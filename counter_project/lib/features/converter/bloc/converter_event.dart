part of 'converter_bloc.dart';

@immutable
abstract class ConverterEvent {}
class ConverterInitialEvent extends ConverterEvent{}

class ToggleButtonBackEvent extends ConverterEvent{}

class Convertbuttonclickedevent extends ConverterEvent{}