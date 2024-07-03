import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{

  HomeLayoutCubit():super(InitialState());

  static HomeLayoutCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  void switchBottomNav(int index){
    currentIndex=index;
    print(currentIndex);
    emit(HomeLayoutChangeBottomNavState());
  }

}

