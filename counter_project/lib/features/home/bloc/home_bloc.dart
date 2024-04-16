import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:counter_project/data/d2b_api.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DecimalPost decimalPost = DecimalPost();
  HomeBloc() : super(HomeInitialstate()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<TogglebuttonNavigateevent>(togglebuttonNavigateevent);
    on<Plusbuttonclickedevent>(plusbuttonclickedevent);
    on<Minusbuttonclickedevent>(minusbuttonclickedevent);
  }

  FutureOr<void> homeInitialEvent(HomeInitialEvent event, Emitter<HomeState> emit) {
  emit(buttonclickedstate(0,"0"));
  }

  FutureOr<void> togglebuttonNavigateevent(TogglebuttonNavigateevent event, Emitter<HomeState> emit) {
    print('toggle karo plz');
  emit(TogglebuttonNavigatestate());
  }
  
  FutureOr<void> plusbuttonclickedevent(Plusbuttonclickedevent event, Emitter<HomeState> emit) async {
    print('sup');
    String binary = await decimalPost.d2b((event.number+1));
    emit(buttonclickedstate((event.number+1),binary));
  }

  FutureOr<void> minusbuttonclickedevent(Minusbuttonclickedevent event, Emitter<HomeState> emit) async {
    print('what');
    String binary = await decimalPost.d2b((event.number-1));
    emit(buttonclickedstate((event.number-1),binary));
  }
}
