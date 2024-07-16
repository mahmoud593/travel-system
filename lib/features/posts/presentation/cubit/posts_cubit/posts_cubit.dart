import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/data/posts_repo_implement/posts_repo_implement.dart';
import '../posts_states/posts_states.dart';

class PostsCubit extends Cubit<PostsStates>{

  PostsCubit() : super(InitPostsState());

  static PostsCubit get(context) => BlocProvider.of(context);

  List<PostModel> flights=[];

  Future<void> getPosts()async {

    flights = [];
     emit(GetPostsLoadingState());
     await PostsRepoImplement().getPosts().then((value){
      flights=value;
      print('Posts : ${flights.length}');
      emit(GetPostsSuccessState());
     }).catchError((error){
      print('Error in get posts : ${error.toString()}');
      emit(GetPostsSuccessState());
     });

  }

}