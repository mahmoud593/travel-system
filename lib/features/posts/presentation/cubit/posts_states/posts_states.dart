import 'package:travel_system/features/posts/data/models/post_model.dart';

abstract class PostsStates {}

class InitPostsState extends PostsStates {}

class GetPostsLoadingState extends PostsStates{}
class GetPostsSuccessState extends PostsStates{

  GetPostsSuccessState();

}
class GetPostsErrorState extends PostsStates{}

class HomeLayoutChangeBottomNavState extends PostsStates{}

class SelectTimePickerValueState extends PostsStates{}

class SetDropDownValueState extends PostsStates{}

class CreateNewPostsLoadingState extends PostsStates{}
class CreateNewPostsSuccessState extends PostsStates{}
class CreateNewPostsErrorState extends PostsStates{}

class ChangeCountryColorState extends PostsStates{}
