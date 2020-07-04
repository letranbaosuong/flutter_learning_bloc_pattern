import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_learning_app/infinite_list_app/src/models/post/post.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostSuccess extends PostState {
  final List<Post> posts;
  final bool hasReachedMax;

  const PostSuccess({this.posts, this.hasReachedMax});

  PostSuccess copyWith({
    List<Post> posts,
    bool hasReachedMax,
  }) {
    return PostSuccess(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [posts, hasReachedMax];

  @override
  String toString() {
    return 'PostSuccess { posts: ${posts.length}, hasReachedMax: $hasReachedMax }';
  }
}

class PostFailure extends PostState {}
