import 'dart:async';
// import 'dart:js_util';

import 'package:bloc/bloc.dart';
// import 'package:counter_project/data/b2d_api.dart';
// import 'package:counter_project/data/d2b_api.dart';
import 'package:counter_project/domain/conversion_repo.dart';
import 'package:meta/meta.dart';

part 'converter_event.dart';
part 'converter_state.dart';

class ConverterBloc extends Bloc<ConverterEvent, ConverterState> {
  // final BinaryPost binaryPost = BinaryPost();
  ConverterBloc() : super(ConverterInitialState()) {
    on<ConverterInitialEvent>(converterInitialEvent);
    on<ToggleButtonBackEvent>(toggleButtonBackEvent);
    on<ConvertButtonClickedEvent>(convertbuttonclickedevent);
  }

  FutureOr<void> toggleButtonBackEvent(ToggleButtonBackEvent event, Emitter<ConverterState> emit) {
    emit(ToggleButtonBackState());
  }

  FutureOr<void> converterInitialEvent(ConverterInitialEvent event, Emitter<ConverterState> emit) {
   emit(ConverterInitialState());
  }

FutureOr<void> convertbuttonclickedevent(ConvertButtonClickedEvent event, Emitter<ConverterState> emit) async {
  try {
    ConversionRepo conversionRepo = ConversionRepo();
    String binary = event.binary;
    print('hello');
    String decimal = await conversionRepo.binaryToDecimal(binary);
    print(decimal);
    emit(ConvertButtonClickedState(decimal: decimal));
  } catch (error) {
    print('Error parsing binary: $error');
  }
}
}
