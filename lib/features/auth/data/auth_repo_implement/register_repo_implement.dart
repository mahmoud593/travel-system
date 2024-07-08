import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/data/auth_repo/register_repo.dart';
import 'package:travel_system/features/auth/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterRepoImplement extends RegisterRepo {

  @override
  Future<void> register({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
    required String beasNumber,
    required String rank,
    required String payRollNumber,

  }) async {
  final  user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      UserDataFromStorage.setUserId(value.user!.uid);
    });
  }

  @override
  Future<void> uploadUserDataToFireBase(

      {
      required String email,
      required String userName,
      required String phoneNumber,
      required String beasNumber,
      required String rank,
      required String payRollNumber}) async{
    UserModel userModel = UserModel(
      uid: UserDataFromStorage.userId,
      email: email,
      userName: userName,
      phoneNumber: phoneNumber,
      beasNumber: beasNumber,
      rank: rank,
      payRollNumber: payRollNumber
    );
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(userModel.uid)
        .set(userModel.toJson());

  }
}
