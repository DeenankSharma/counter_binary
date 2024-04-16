import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
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

  FutureOr<void> convertbuttonclickedevent(Convertbuttonclickedevent event, Emitter<ConverterState> emit) {
    emit(Convertbuttonclickedstate());
  }
}
