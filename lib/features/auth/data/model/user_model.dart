class UserModel {
  final String uid;
  final String email;
  final String userName;
  final String phoneNumber;
  final String beasNumber;
  final String rank;
  final String payRollNumber;
  final String userImage;
  final List<String> airCrafts;

  UserModel({
    required this.uid,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.beasNumber,
    required this.rank,
    required this.payRollNumber,
    required this.userImage,
    required this.airCrafts,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'] ?? '',
        email = json['email'] ?? '',
        userName = json['userName'] ?? '',
        phoneNumber = json['phoneNumber'] ?? '',
        beasNumber = json['beasNumber'] ?? '',
        rank = json['rank'] ?? '',
        payRollNumber = json['payRollNumber'] ?? '',
        userImage = json['userImage'] ?? '',
        airCrafts = (json['airCrafts'] as List<dynamic>?)
            ?.map((item) => item.toString())
            .toList() ??
            [];

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'userName': userName,
    'phoneNumber': phoneNumber,
    'beasNumber': beasNumber,
    'rank': rank,
    'payRollNumber': payRollNumber,
    'userImage': userImage,
    'airCrafts': airCrafts,
  };
}
