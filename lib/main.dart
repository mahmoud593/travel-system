import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/splash/presentation/view/splash_screen.dart';
import 'package:travel_system/styles/theme_manger/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/chat/presentation/cubit/chat_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await UserDataFromStorage.getData();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => SettingsCubit()..getUserData()..getFavoritePosts()..getHistoryPosts(),),
        BlocProvider(create: (context) => ChatCubit()..getMessages(),),
        BlocProvider(create: (context) => PostsCubit()..getPosts(context),),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(context),
        home: const SplashScreen(),
      ),
    );
  }
}

