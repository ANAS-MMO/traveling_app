import 'package:bloc/bloc.dart';
import 'package:traveling_app/cubit/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits():super(InitialStates()){
    emit(WelcomeStates());
  }
  void getData(){
    try{
      emit(LoadingStates());
      emit(LoadedStates());
    // ignore: empty_catches
    }catch(e){

    }
  }

  void detailPage(){
    try{
      emit(DetailStates());
    // ignore: empty_catches
    }catch(e){

    }
  }
}