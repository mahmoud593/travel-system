abstract class AuthRepo{

  Future<void> login({required String email, required String password});

  Future<void> register({
    required String email,
    required String password,
    required String userName,
    required String phoneNumber,
    required String beasNumber,
    required String rank,
    required String payRollNumber,
    String? userImage,
    required List<String> airCrafts,
  });

  Future<void> uploadUserDataToFireBase(
      {required String email,
        required String userName,
        required String phoneNumber,
        required String beasNumber,
        required String rank,
        required String payRollNumber,
        String? userImage,
        required List<String> airCrafts});

  Future<void> getUserFromFireBase();

}