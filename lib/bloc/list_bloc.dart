import 'package:bloc_exp_392/bloc/list_event.dart';
import 'package:bloc_exp_392/bloc/list_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBloc extends Bloc<ListEvent, ListState>{

  ListBloc() : super(ListState(mData: [])){
    
    on<AddMapEvent>((event, emit){
      List<Map<String, dynamic>> currentData = state.mData;
      currentData.add(event.newData);
      emit(ListState(mData: currentData));
    });

    on<UpdateMapEvent>((event, emit){
      List<Map<String, dynamic>> currentData = state.mData;
      currentData[event.index] = event.updatedData;
      emit(ListState(mData: currentData));
    });

    on<DeleteMapEvent>((event, emit){
      List<Map<String, dynamic>> currentData = state.mData;
      currentData.removeAt(event.index);
      emit(ListState(mData: currentData));
    });
    
  }
  
}