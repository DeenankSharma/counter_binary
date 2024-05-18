import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:counter_project/domain/conversion_repo.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<ToggleButtonNavigateEvent>(togglebuttonNavigateevent);
    on<PlusButtonClickedEvent>(plusbuttonclickedevent);
    on<MinusButtonClickedEvent>(minusbuttonclickedevent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) async {
  final currentState = state;
  if (currentState is ButtonClickedState) {
    emit(currentState); 
  } else {
    emit(ButtonClickedState(0, "0")); 
  }
}


  FutureOr<void> togglebuttonNavigateevent(ToggleButtonNavigateEvent event, Emitter<HomeState> emit) {
    print('toggle karo plz');
  emit(ToggleButtonNavigateState());
  }
  
  FutureOr<void> plusbuttonclickedevent(PlusButtonClickedEvent event, Emitter<HomeState> emit) async {
    print('sup');
    print(event.number);
    int n=(event.number+1);
    ConversionRepo conversionRepo = ConversionRepo();
    String binary = await conversionRepo.decimalToBinary(n);    print(binary);
    emit(ButtonClickedState(n,binary));
  }

  FutureOr<void> minusbuttonclickedevent(MinusButtonClickedEvent event, Emitter<HomeState> emit) async {
    print('what');
    int n = (event.number-1);
    print(event.number);
    ConversionRepo conversionRepo = ConversionRepo();
    String binary = await conversionRepo.decimalToBinary(n);    print(binary);
    emit(ButtonClickedState(n,binary));
  }
}
