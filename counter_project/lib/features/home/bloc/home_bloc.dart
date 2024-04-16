import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialstate()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<TogglebuttonNavigateevent>(togglebuttonNavigateevent);
    on<Plusbuttonclickedevent>(plusbuttonclickedevent);
    on<Minusbuttonclickedevent>(minusbuttonclickedevent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
  emit(buttonclickedstate(0));
  }

  FutureOr<void> togglebuttonNavigateevent(TogglebuttonNavigateevent event, Emitter<HomeState> emit) {
    print('toggle karo plz');
  emit(TogglebuttonNavigatestate());
  }
  
  FutureOr<void> plusbuttonclickedevent(Plusbuttonclickedevent event, Emitter<HomeState> emit) {
    print('sup');
  emit(buttonclickedstate(event.number+1));
  }

  FutureOr<void> minusbuttonclickedevent(Minusbuttonclickedevent event, Emitter<HomeState> emit) {
    print('what');
  emit(buttonclickedstate(event.number-1));
  }
}
