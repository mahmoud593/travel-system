abstract class CommentRepo {
  Future<void> postComment(
      {required String postId,
      required String userName,
      required String userImage,
      required String comment});

}
