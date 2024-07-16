import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:travel_system/core/helper/friebase_api.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/login/login.dart';
import 'package:travel_system/features/settings/data/edit_profile_repo/edit_profile_repo.dart';

class EditProfileRepoImplement extends EditProfileRepo{

  @override
  Future<Map<String, dynamic>> getUserDataFromFireBase() async {

    Map<String, dynamic> userData = await FirebaseApi.getCall(path: 'Users/${UserDataFromStorage.userId}');
    debugPrint("User data from Firebase ==========> ${userData.toString()}");

    return userData;
  }




  @override
  Future<String> uploadUserProfileImage({required File imageFile}) async {
    String imageUrl = '';
    await FirebaseStorage.instance.ref()
        .child('UserImages/${Uri.file(imageFile.path)
        .pathSegments.last}').putFile(imageFile).then((p0){
      p0.ref.getDownloadURL().then((value) {
        imageUrl = value;
        debugPrint("Image Url ==========> $imageUrl");
      }).catchError((error) {
        debugPrint("Error when uploading image : ${error.toString()}");
        return;
      });
    });

    return imageUrl;
  }

  @override
  Future<Map<String, dynamic>> updateUserProfileData({
    required String email,
    required String userName,
    required String phoneNumber,
    required String beasNumber,
    required String rank,
    required String payRollNumber,
    required List<dynamic> airCrafts,
    required String imageUrl}) {
    
    return FirebaseApi.updateCall(
       path: 'Users/${UserDataFromStorage.userId}',
        data: {
      'email' : email,
      'userName' : userName,
      'phoneNumber' : phoneNumber,
      'beasNumber' : beasNumber,
      'rank' : rank,
      'payRollNumber' : payRollNumber,
      'airCrafts' : airCrafts,
      'imageUrl' : imageUrl
    });
    
  }

  @override
  Future<void> logout({required BuildContext context}) async {
    FirebaseAuth.instance.signOut();
    customPushAndRemoveUntil(context, const LoginScreen());
    return Future.value();
  }











}