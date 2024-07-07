abstract class RegisterRepo {
  Future<void> register(
      {required String email,
          required String password,
          required String userName,
          required String phoneNumber,
          required String beasNumber,
          required String rank,
          required String payRollNumber,});

  Future<void> uploadUserDataToFireBase(
      {required String email,
      required String userName,
      required String phoneNumber,
      required String beasNumber,
      required String rank,
      required String payRollNumber});
}
