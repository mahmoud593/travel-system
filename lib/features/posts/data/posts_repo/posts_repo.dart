import 'package:travel_system/features/posts/data/models/post_model.dart';

abstract class PostsRepo{

  Future<Set<PostModel>> getPosts();

}