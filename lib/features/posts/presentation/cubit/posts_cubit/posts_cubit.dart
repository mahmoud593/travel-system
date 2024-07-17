import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/data/posts_repo_implement/posts_repo_implement.dart';
import '../posts_states/posts_states.dart';

class PostsCubit extends Cubit<PostsStates>{

  PostsCubit() : super(InitPostsState());

  static PostsCubit get(context) => BlocProvider.of(context);

  Set<PostModel> flights={};

  Future<void> getPosts() async {
    emit(GetPostsLoadingState());

    try {
      flights = await PostsRepoImplement().getPosts();
      emit(GetPostsSuccessState());
    } catch (error) {
      print('Error in get posts: ${error.toString()}');
      emit(GetPostsErrorState());
    }
  }

}