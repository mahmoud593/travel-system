import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/screens/new_posts_screen.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/screens/posts_screen.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/screens/settings_screen.dart';
import 'package:travel_system/features/on_boarding/data/model/onboarding_model.dart';

class Constants{

  static List onBoardingScreens=[
    OnBoardingModel(
        title: 'Freelancer',
        content: 'A freelancer is a self-employed individual who offers services to clients on a project basis, often working remotely and managing their own business',
        image: 'assets/images/onBoarding1.png'
    ),
    OnBoardingModel(
        title: 'Investment',
        content: 'We ate constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
        image: 'assets/images/pilot.png'
    ),
    OnBoardingModel(
        title: 'Social Media',
        content: ' it is easy to determine the exact number of calories consumed at each meal',
        image: 'assets/images/onBoarding2.png'
    ),

  ];

  static List<Widget> homeLayoutScreens=[
    const PostsScreen(),
     // NewPostsScreen(),
    const SettingsScreen(),
  ];


  static List<String> homeLayoutTitles=[
    'Posts',
    'New Posts',
    'Settings',
  ];

  static List<int> airCraftsModel=[
    777,
    787,
    330,
    320
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
}