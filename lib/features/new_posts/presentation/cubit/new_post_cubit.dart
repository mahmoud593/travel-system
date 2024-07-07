import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/new_posts/presentation/cubit/new_post_states.dart';

class NewPostCubit extends Cubit<NewPostStates>{

  NewPostCubit() : super(InitialState());

  static NewPostCubit get(context)=>BlocProvider.of(context);

  var hourController= TextEditingController();
  var minutesController= TextEditingController();

}