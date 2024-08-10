import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/features/chat_history/presentation/view/chat_history_screen.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/screens/posts_screen.dart';
import 'package:travel_system/features/settings/presentation/view/favorite_screen/favorite_screen.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/screens/settings_screen.dart';
import 'package:travel_system/features/on_boarding/data/model/onboarding_model.dart';

class Constants{

  static List onBoardingScreens=[
    OnBoardingModel(
        title: 'Flight Trades',
        content: 'Simplify your schedule with effortless flight exchanges. Post your available flights and find the perfect swap in just a few taps.',
        image: 'assets/images/onBoarding1.png'
    ),
    OnBoardingModel(
        title: 'Stay Notified',
        content: 'Never miss an opportunity! Get instant notifications when a flight matching your preferences becomes available, so you can secure your ideal exchange.',
        image: 'assets/images/onBoarding2.png'
    ),
    OnBoardingModel(
        title: 'Connect & Exchange',
        content: 'Seamlessly connect with fellow pilots to arrange your swaps. Communicate, negotiate, and finalize details directly within the app.',
        image: 'assets/images/pilot.png'
    ),

  ];

  static List<Widget> homeLayoutScreens=[
    const PostsScreen(),
    const FavoriteScreen(),
    const SettingsScreen(),
  ];


  static List<String> homeLayoutTitles=[
    'Posts',
    'New Posts',
    'Settings',
  ];

  static List<String> airCraftsModel=[
    "777",
    "787",
    "330",
    "320"
  ];

  static final database = FirebaseDatabase.instance
      .refFromURL('https://airline-system-4e527-default-rtdb.firebaseio.com/');



  static List<String> iHaveLocations=[
    'Paris',
    'Cairo',
    'London',
    'Qatar',
    'Oman',
  ];


  static List<String> airCraftsList=[
    '777',
    '787',
    '330',
    '320'
  ];

  static List<String> baseList=[
    'Cairo',
    'London',
    'Qatar',
    'Oman',
  ];
  static List<String> rankList=[
    'Captain',
    'First Officer',
    'Second Officer',
    'Flight Assistant',
  ];
}