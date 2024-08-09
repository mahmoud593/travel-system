import 'package:travel_system/features/posts/data/models/post_model.dart';

abstract class PostsRepo{


  Future<void> uploadNewPosts({
    required String iHaveFlight,
    required String uid,
    required String startTime,
    required String endTime,
    required List<String> willToFly,
    required String rank,
    required String planeType,
    required String iWantFlight,
    required String userName,
    required String phoneNumber,
    required String iHaveLav,
    required String iWantLav,
    required String visa,
    required String iWantHours,
    required String iHaveHours,
  });


  Future <void> addPostToFavorites({required PostModel postModel});
  Future <void> deletePostFromFavorites({required PostModel postModel});


}