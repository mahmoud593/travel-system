abstract class NewPostsRepo{

  Future<void> uploadNewPosts({
    required String iHaveFlight,
    required String uid,
    required String dateTime,
    required String startTime,
    required String endTime,
    required String hours,
    required String willToFly,
    required String rank,
    required String planeType,
    required String iWantFlight,
    required String userName
  });

}