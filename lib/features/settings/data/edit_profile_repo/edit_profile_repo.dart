import 'dart:io';

import 'package:flutter/cupertino.dart';

abstract class EditProfileRepo{

  Future <Map<String, dynamic>> getUserDataFromFireBase();

  Future <String> uploadUserProfileImage({required File imageFile});

  Future <Map<String, dynamic>> updateUserProfileData({
    required String email,
    required String userName,
    required String phoneNumber,
    required String beasNumber,
    required String rank,
    required String payRollNumber,
    required List<dynamic> airCrafts,
    required String imageUrl
  });

  Future <void> logout({required BuildContext context});


  Future <void> deleteAccount({required BuildContext context});

  Future <void> getUserHistory();

  Future <void> getUserFavorites();

}