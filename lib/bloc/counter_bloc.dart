import 'package:bloc_task/bloc/counter_event.dart';
import 'package:bloc_task/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents, CounterStates> {
  int counter = 0;
  
  CounterBloc() : super(InitialState()) {
    on<NumberIncreamentEvent>(onNumberIncrease);
    on<NumberDecreamentEvent>(onNumberDecrease);
  }
  //async
  void onNumberIncrease(
      NumberIncreamentEvent event, Emitter<CounterStates> emit) {
    counter = counter + 1;
    emit(UpdateStates(counter));
  }
// async 
  void onNumberDecrease(
      NumberDecreamentEvent event, Emitter<CounterStates> emit) {
    counter = counter - 1;
    emit(UpdateStates(counter));
  }
  
}
