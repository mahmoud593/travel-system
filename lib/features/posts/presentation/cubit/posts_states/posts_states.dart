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

class AddPostToFavoriteSuccessState extends PostsStates{}
class AddPostToFavoriteErrorState extends PostsStates{}

class DeletePostFromFavoriteSuccessState extends PostsStates{}
class DeletePostFromFavoriteErrorState extends PostsStates{}

class GetFavoriteLoadingState extends PostsStates{}
class GetFavoriteSuccessState extends PostsStates{}
class GetFavoriteErrorState extends PostsStates{}



class CheckIfIsFavorite extends PostsStates {}

class ChangeCountryColorState extends PostsStates{}

class ChangeIHaveLayoverState extends PostsStates{}
class ChangeIHaveRoundTripState extends PostsStates{}
class ChangeIWantRoundTripState extends PostsStates{}
class ChangeIWantLayoverState extends PostsStates{}

final class FetchIHaveLoadingState extends PostsStates {}
final class FetchIHaveSuccessState extends PostsStates {}

final class FetchIWantLoadingState extends PostsStates {}
final class FetchIWantSuccessState extends PostsStates {}

final class ChangeIsFilterState extends PostsStates {}
