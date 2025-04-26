part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<Map<String, dynamic>>? posts;
  final bool isPostAdded;

  const PostSuccess({this.posts, this.isPostAdded = false});

  @override
  List<Object?> get props => [posts, isPostAdded];
}

class PostFailure extends PostState {
  final String message;

  const PostFailure({required this.message});

  @override
  List<Object> get props => [message];
}