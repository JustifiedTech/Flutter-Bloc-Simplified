import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc_providers/cubit/nav_cubit.dart';
import 'package:new_app/models/post.dart';

import '../user_interface/post_detail.dart';
import '../user_interface/posts_view.dart';

class BlocNavigator extends StatelessWidget {
  const BlocNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit<Posts>, Posts?>(
      builder: (context, post) {
        print('yes I an been re');
        return Navigator(
          pages: [
            MaterialPage(
              child: PostsView(),
            ),
            if (post != null)
              MaterialPage(
                child: PostDetails(
                  post: post,
                ),
              ),
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit<Posts>>(context).popToPosts();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
