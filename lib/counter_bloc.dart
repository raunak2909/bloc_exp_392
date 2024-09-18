import 'package:bloc_exp_392/counter_event.dart';
import 'package:bloc_exp_392/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, int>{

  CounterBloc() : super(0){

    on<IncrementEvent>((event, emit){
      emit(state+1);
    });

    on<DecrementEvent>((event, emit){
      if(state>0) {
        emit(state - 1);
      }
    });

  }

}