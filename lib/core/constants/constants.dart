import 'package:flutter/material.dart';
import 'package:travel_system/features/new_posts/presentation/view/new_posts_screen/screens/new_posts_screen.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/screens/posts_screen.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/screens/settings_screen.dart';
import 'package:travel_system/models/onboarding_model.dart';

class Constants{

  static List onBoardingScreens=[
    OnBoardingModel(
        title: 'Freelancer',
        content: 'A freelancer is a self-employed individual who offers services to clients on a project basis, often working remotely and managing their own business',
        image: 'assets/icons/onboarding1.json'
    ),
    OnBoardingModel(
        title: 'Investment',
        content: 'We ate constantly adding your favourite restaurant throughout the territory and around your area carefully selected',
        image: 'assets/icons/onboarding2.json'
    ),
    OnBoardingModel(
        title: 'Social Media',
        content: ' it is easy to determine the exact number of calories consumed at each meal',
        image: 'assets/icons/onboarding3.json'
    ),

  ];

  static List<Widget> homeLayoutScreens=[
    const PostsScreen(),
     NewPostsScreen(),
    const SettingsScreen(),
  ];


  static List<String> homeLayoutTitles=[
    'Posts Screen',
    'New Posts Screen',
    'Settings Screen',
  ];

}