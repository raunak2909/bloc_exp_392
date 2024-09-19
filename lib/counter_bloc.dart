import 'package:bloc_exp_392/counter_event.dart';
import 'package:bloc_exp_392/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{

  CounterBloc() : super(CounterState(counter: 0)){

    on<IncrementEvent>((event, emit){
      emit(CounterState(counter: state.counter+1));
    });

    on<DecrementEvent>((event, emit){
      if(state.counter>0) {
        emit(CounterState(counter: state.counter-1));
      }
    });

  }

}