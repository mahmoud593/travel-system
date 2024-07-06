import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/screens/home_layout_screen.dart';
import 'package:travel_system/features/on_boarding_screen/screen/on_boarding_screen.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/view/notification_screen/notificarions_screen.dart';
import 'package:travel_system/features/splash_screen/splash_screen.dart';
import 'package:travel_system/styles/theme_manger/theme_manager.dart';

import 'features/settings/presentation/view/edit_profile_screen/edit_profile_screen.dart';
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
          BlocProvider(create: (context) => HomeLayoutCubit(),),
          BlocProvider(create: (context) => SettingsCubit(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(context),
          home: const HomeLayoutScreen(),
        ),
    );
  }
}

