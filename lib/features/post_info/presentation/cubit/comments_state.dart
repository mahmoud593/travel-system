part of 'comments_cubit.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class UploadCommentsLoading extends CommentsState {}
final class UploadCommentsSuccess extends CommentsState {}
final class UploadCommentsError extends CommentsState {}

final class GetCommentsLoading extends CommentsState {}
final class GetCommentsSuccess extends CommentsState {}
final class GetCommentsError extends CommentsState {}


