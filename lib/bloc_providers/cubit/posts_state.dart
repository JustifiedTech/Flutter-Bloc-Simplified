part of 'posts_cubit.dart';

abstract class PostsState extends Equatable {
  final List<Posts> posts;
  const PostsState(
    this.posts,
  );

  @override
  List<Object> get props => [posts];
}

class PostsInitial extends PostsState {
  PostsInitial() : super(<Posts>[]);
}

class PostsLoaded extends PostsState {
  final List<Posts> newPosts;

  const PostsLoaded({required this.newPosts}) : super(newPosts);
}

class PostsLoading extends PostsState {
  final List<Posts> oldPosts;
  final bool isfirst;
  const PostsLoading({required this.oldPosts, this.isfirst = false})
      : super(oldPosts);
}

class PostsLoadFailed extends PostsState {
  PostsLoadFailed() : super(<Posts>[]);
}


// abstract class PostsState extends Equatable {}

// class PostsInitial extends PostsState {
//   @override
//   List<Object> get props => [];
// }

// class PostsLoaded extends PostsState {
//   final List<Posts> posts;

//   PostsLoaded({required this.posts});
//   @override
//   List<Object> get props => [posts];
// }

// class PostsLoading extends PostsState {
//   final List<Posts> oldPosts;
//   final bool isfirst;
//   PostsLoading({required this.oldPosts, this.isfirst = false});
//   @override
//   List<Object> get props => [oldPosts, isfirst];
// }

// class PostsLoadFailed extends PostsState {
//   PostsLoadFailed() : super();
//   @override
//   List<Object> get props => [];
// }

