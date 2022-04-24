import 'package:bloc/bloc.dart';

import '../../models/post.dart';

// part 'nav_state.dart';

class NavCubit<T> extends Cubit<T?> {
  NavCubit() : super(null);

  void showPostDetails(T post) {
    print('triggered');
    print(post.toString());
    emit(post);
  }

  void popToPosts() => emit(null);
}
