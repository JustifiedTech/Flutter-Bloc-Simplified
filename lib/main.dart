import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/bloc_providers/bloc_navigator.dart';
import 'package:new_app/models/post.dart';
import 'package:new_app/repository/posts_repository.dart';
import 'package:new_app/service/post_service.dart';
import 'package:new_app/user_interface/posts_view.dart';

import 'bloc_providers/cubit/nav_cubit.dart';
import 'bloc_providers/cubit/posts_cubit.dart';
import 'bloc_providers/transaction_bloc.dart';
import 'repository/transaction_repository.dart';
import 'utils/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //   await DatabaseHelper.initDb();
  // await GetStorage.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp(postsRepository: PostsRepository(PostService())));

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.postsRepository}) : super(key: key);
  final PostsRepository postsRepository;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: const AllTransactions(),
      home: MultiBlocProvider(providers: [
        BlocProvider(create: (context) => NavCubit<Posts>()),
        BlocProvider(create: (context) => PostsCubit(postsRepository)),
      ], child: const BlocNavigator()),
      // initialRoute: AppRoute.allTransactions,
      onGenerateRoute: AppRoute.onGenerateRoute,
    );
  }
}
