import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/auth/data/auth_repo/register_repo.dart';
import 'package:travel_system/features/auth/data/model/user_model.dart';

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
    String? userImage,
    required List<int> airCrafts

  }) async {
  await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
      UserDataFromStorage.setUserId(value.user!.uid);
    });
  }

  @override
  Future<void> uploadUserDataToFireBase({
      required String email,
      required String userName,
      required String phoneNumber,
      required String beasNumber,
      required String rank,
      required String payRollNumber,
      required List<int>airCrafts,
      String? userImage
  }) async{
    UserModel userModel = UserModel(
      uid: UserDataFromStorage.userId,
      email: email,
      userName: userName,
      phoneNumber: phoneNumber,
      beasNumber: beasNumber,
      rank: rank,
      payRollNumber: payRollNumber,
      userImage: userImage??"",
      airCrafts: airCrafts
    );
    final databaseReference = FirebaseDatabase.instance.ref();
      await databaseReference
        .child('Users')
        .child(userModel.uid)
        .set(userModel.toJson());
  }
}
