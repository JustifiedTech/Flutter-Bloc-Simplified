import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc_providers/cubit/nav_cubit.dart';
import '../bloc_providers/cubit/posts_cubit.dart';
import '../models/post.dart';
import '../utils/config/size_config.dart';

class PostsView extends StatelessWidget {
  PostsView({Key? key}) : super(key: key);
  final _scrollController = ScrollController();

  void onScrollToEnd(context) {
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels != 0) {
          BlocProvider.of<PostsCubit>(context).loadPosts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    onScrollToEnd(context);
    BlocProvider.of<PostsCubit>(context).loadPosts();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<PostsCubit, PostsState>(
          builder: (context, state) {
            List<Posts> posts = [];
            bool isLoading = false;
            if (state is PostsLoading && state.isfirst) {
              return _loading();
            }
            if (state is PostsLoading) {
              posts = state.oldPosts;
              isLoading = true;
            } else if (state is PostsLoaded) {
              posts = state.posts;
            }

            return ListView.separated(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  if (index < posts.length) {
                    return ListTile(
                      onTap: () => BlocProvider.of<NavCubit<Posts>>(context)
                          .showPostDetails(posts[index]),
                      leading: CircleAvatar(child: Text('${posts[index].id}')),
                      title: Text('${posts[index].title}'),
                    );
                  } else {
                    Timer(const Duration(milliseconds: 30), () {
                      _scrollController
                          .jumpTo(_scrollController.position.maxScrollExtent);
                    });

                    return _loading();
                  }
                },
                separatorBuilder: (contex, index) => const Divider(),
                itemCount: posts.length + (isLoading ? 1 : 0));
          },
        ),
      ),
    );
  }

  Padding _loading() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
