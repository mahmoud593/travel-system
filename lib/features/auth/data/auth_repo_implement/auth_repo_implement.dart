import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/data/auth_repo/auth_repo.dart';
import 'package:travel_system/features/auth/data/model/user_model.dart';

class AuthRepoImplement extends AuthRepo{
  @override
  Future<void> login({required String email, required String password}) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password).then((value){
      UserDataFromStorage.setUserId(value.user!.uid);
      UserDataFromStorage.setUserIsLogin(true);
      debugPrint("User Id ===========================> ${UserDataFromStorage.userId}");
    }).catchError((error){
      debugPrint(error.toString());
    });
  }
  @override
  Future<void> register({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
    required String beasNumber,
    required String rank,
    required String payRollNumber,
    String? userImage,
    required List<String> airCrafts

  }) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
     UserModel userModel = UserModel(
          uid: value.user!.uid,
          email: email,
          userName: userName,
          phoneNumber: phoneNumber,
          beasNumber: beasNumber,
          rank: rank,
          payRollNumber: payRollNumber,
          userImage: userImage??"https://firebasestorage.googleapis.com/v0/b/airline-system-4e527.appspot.com/o/plane.png?alt=media&token=df606f6d-7628-4385-bec4-24b31c08c7bf",
          airCrafts: airCrafts
      );
      UserDataFromStorage.setUserId(userModel.uid);
      UserDataFromStorage.setUserEmail(userModel.email);
      UserDataFromStorage.setUserName(userModel.userName);
      UserDataFromStorage.setUserPhone(userModel.phoneNumber);
      UserDataFromStorage.setUserBaseNumber(userModel.beasNumber);
      UserDataFromStorage.setUserRank(userModel.rank);
      UserDataFromStorage.setUserPayrollNumber(userModel.payRollNumber);
      UserDataFromStorage.setUserAirCrafts(userModel.airCrafts!);
      UserDataFromStorage.setuserPersonalImage(userModel.userImage);
      UserDataFromStorage.setUserId(userModel!.uid);

      UserDataFromStorage.setUserIsLogin(true);
    });
  }

  UserModel? userModel;
  @override
  Future<void> uploadUserDataToFireBase({
    required String email,
    required String userName,
    required String phoneNumber,
    required String beasNumber,
    required String rank,
    required String payRollNumber,
    required List<String>airCrafts,
    String? userImage
  }) async{
      userModel = UserModel(
        uid: UserDataFromStorage.userId,
        email: email,
        userName: userName,
        phoneNumber: phoneNumber,
        beasNumber: beasNumber,
        rank: rank,
        payRollNumber: payRollNumber,
        userImage: userImage??"https://firebasestorage.googleapis.com/v0/b/airline-system-4e527.appspot.com/o/plane.png?alt=media&token=df606f6d-7628-4385-bec4-24b31c08c7bf",
        airCrafts: airCrafts
    );
    final databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference
        .child('Users')
        .child(userModel!.uid)
        .set(userModel!.toJson());
  }

  @override
  Future<void> getUserFromFireBase() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    await databaseReference
        .child('Users/${userModel?.uid ?? UserDataFromStorage.userId}').get().then((user) {
      if (user.exists) {
        Map<String, dynamic> userMap = (user.value as Map).map(
              (key, value) => MapEntry(key.toString(), value),
        );
         userModel = UserModel.fromJson(userMap);

        debugPrint("UID From Model****${userModel!.uid}");

        debugPrint("UserName From Firebase****${(user.value as Map)['userName']}****");
      }else{
        debugPrint('user not found');
      }
    });
  }
}