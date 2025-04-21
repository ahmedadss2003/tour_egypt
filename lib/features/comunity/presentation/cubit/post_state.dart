part of 'post_cubit.dart';

sealed class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

final class PostInitial extends PostState {}
final class PostLoading extends PostState {}
final class PostSuccess extends PostState {
  final List<Map<String , dynamic>>? posts;

  PostSuccess({ this.posts});
}
final class PostFailure extends PostState {
  final String message;
  const PostFailure({required this.message}) 
  ;
}
