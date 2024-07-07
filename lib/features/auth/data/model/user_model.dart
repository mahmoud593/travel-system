class UserModel{
  final String uid;
  final String email;
  final String userName;
  final String phoneNumber;
  final String beasNumber;
  final String rank;
  final String payRollNumber;

  UserModel({
    required this.email,
    required this.uid,
    required this.userName,
    required this.phoneNumber,
    required this.beasNumber,
    required this.rank,
    required this.payRollNumber
  });
  UserModel.fromJson(Map<String, dynamic> json)
    : this(
    uid : json['uid']??'',
    email : json['email']??'',
    userName : json['userName']??'',
    phoneNumber : json['phoneNumber']??'',
    beasNumber: json['beasNumber']??'',
    rank : json['rank']??'',
    payRollNumber : json['payRollNumber']??''
  );

  Map<String, dynamic> toJson() => {
    'uid' : uid,
    'email' : email,
    'userName' : userName,
    'phoneNumber' : phoneNumber,
    'beasNumber' : beasNumber,
    'rank' : rank,
    'payRollNumber' : payRollNumber
  };
}