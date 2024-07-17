abstract class PostsStates {}

class InitPostsState extends PostsStates {}

class GetPostsLoadingState extends PostsStates{}
class GetPostsSuccessState extends PostsStates{}
class GetPostsErrorState extends PostsStates{}

class SelectTimePickerValueState extends PostsStates{}
