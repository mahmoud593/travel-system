class CommentModel {
  final String postId;
  final String comment;
  final String userImage;
  final String userName;

  CommentModel({
    required this.postId,
    required this.comment,
    required this.userImage,
    required this.userName
  });

  CommentModel.fromJson(Map<dynamic, dynamic> json)
      : this(
    postId: json['postId'],
    comment: json['comment']??'',
    userImage: json['userImage']??'',
    userName: json['userName']??'',
  );

  Map<String, dynamic> toJson() => {
    'postId': postId,
    'comment': comment,
    'userImage': userImage,
    'userName': userName
  };
}