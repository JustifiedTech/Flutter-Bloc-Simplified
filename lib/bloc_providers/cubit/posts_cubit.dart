import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// / import 'package:equatable/equatable.dart';

import '../../models/post.dart';
import '../../repository/posts_repository.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit(
    this.repository,
  ) : super(PostsInitial());

  int page = 1;
  final PostsRepository repository;

  void loadPosts() {
    if (state is PostsLoading) return;
    final currentState = state;
    List<Posts> oldPosts = <Posts>[];

    if (currentState is PostsLoaded) {
      oldPosts = currentState.posts;
    }
    emit(PostsLoading(oldPosts: oldPosts, isfirst: page == 1));

    repository.fetchPosts(page).then((newPosts) {
      page++;
      final posts = (state as PostsLoading).oldPosts;
      posts.addAll(newPosts);
      emit(PostsLoaded(newPosts: posts));
    });
  }
}
