import 'dart:async';
// import 'dart:js_util';

import 'package:bloc/bloc.dart';
import 'package:counter_project/data/b2d_api.dart';
import 'package:counter_project/data/d2b_api.dart';
import 'package:meta/meta.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  final BinaryPost binaryPost = BinaryPost();
  ConverterBloc() : super(ConverterInitialState()) {
    on<ConverterInitialEvent>(converterInitialEvent);
    on<ToggleButtonBackEvent>(toggleButtonBackEvent);
    on<Convertbuttonclickedevent>(convertbuttonclickedevent);
  }

  FutureOr<void> toggleButtonBackEvent(ToggleButtonBackEvent event, Emitter<ConverterState> emit) {
    emit(ToggleButtonBackState());
  }

  FutureOr<void> converterInitialEvent(ConverterInitialEvent event, Emitter<ConverterState> emit) {
   emit(ConverterInitialState());
  }

FutureOr<void> convertbuttonclickedevent(Convertbuttonclickedevent event, Emitter<ConverterState> emit) async {
  try {
    String binary = event.binary;
    // print(event.binary);
    // String decimal = " ";
    String decimal = int.parse(binary, radix: 2).toRadixString(10);
    print(decimal);
    emit(Convertbuttonclickedstate(decimal: decimal));
  } catch (error) {
    // Handle the exception (e.g., show an error message to the user)
    print('Error parsing binary: $error');
  }
}
}
