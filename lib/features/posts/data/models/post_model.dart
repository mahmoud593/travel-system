class PostModel{
  final String uid;
  final String postId;
  final String iHaveFlight;
  final String startTime;
  final String endTime;
  final String iWantHours;
  final String iHaveHours;
  final String iHaveLav;
  final String PRN;
  final List<String> iWantLav;
  final List<String> visa;
  final List<String> willToFly;
  final String rank;
  final String planeType;
  final String phoneNumber;
  final List<String> iWantFlight;
  final String userName;

  PostModel({
    required this.iHaveFlight,
    required this.uid,
    required this.startTime,
    required this.endTime,
    required this.iWantHours,
    required this.iHaveHours,
    required this.PRN,
    required this.iHaveLav,
    required this.iWantLav,
    required this.visa,
    required this.willToFly,
    required this.rank,
    required this.planeType,
    required this.iWantFlight,
    required this.postId,
    required this.phoneNumber,
    required this.userName
  });
  PostModel.fromJson(Map<dynamic, dynamic> json)
      : this(
    uid: json['uid']??'',
    iHaveFlight: json['iHaveFlight']??'',
    startTime: json['startTime']??'',
    PRN: json['PRN']??'',
    iWantHours: json['iWantHours']??'',
    iHaveHours: json['iHaveHours']??'',
    iWantLav:  (json['iWantLav'] as List<dynamic>?)
        ?.map((item) => item.toString())
        .toList() ??
        [],
    iHaveLav: json['iHaveLav']??  '',
    visa:  (json['visa'] as List<dynamic>?)
        ?.map((item) => item.toString())
        .toList() ??
        [],
    endTime: json['endTime']??  '',
    willToFly: (json['willToFly'] as List<dynamic>?)
        ?.map((item) => item.toString())
        .toList() ??
        [],
    rank: json['rank']??  '',
    planeType: json['planeType']??  '',
    iWantFlight:(json['iWantFlight'] as List<dynamic>?)
        ?.map((item) => item.toString())
        .toList() ??
        [],
    postId: json['postId']??  '',
    phoneNumber: json['phoneNumber']??  '',
    userName: json['userName']??  '',
  );

  Map<String, dynamic> toJson() => {
    'uid' : uid,
    'iHaveFlight' : iHaveFlight,
    'startTime' : startTime,
    'endTime' : endTime,
    'iWantHours' : iWantHours,
    'iHaveHours' : iHaveHours,
    'iWantLav' : iWantLav,
    'iHaveLav' : iHaveLav,
    'PRN' : PRN,
    'visa' : visa,
    'willToFly' : willToFly,
    'postId' : postId,
    'rank' : rank,
    'phoneNumber' : phoneNumber,
    'planeType' : planeType,
    'iWantFlight' : iWantFlight,
    'userName' : userName,
  };
}