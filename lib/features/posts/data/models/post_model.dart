class PostModel{
  final String uid;
  final String postId;
  final String iHaveFlight;
  final String dateTime;
  final String startTime;
  final String endTime;
  final String hours;
  final String willToFly;
  final String rank;
  final String planeType;
  final String iWantFlight;
  final String userName;

  PostModel({
    required this.iHaveFlight,
    required this.uid,
    required this.dateTime,
    required this.startTime,
    required this.endTime,
    required this.hours,
    required this.willToFly,
    required this.rank,
    required this.planeType,
    required this.iWantFlight,
    required this.postId,
    required this.userName
  });
  PostModel.fromJson(Map<dynamic, dynamic> json)
      : this(
    uid: json['uid'],
    iHaveFlight: json['iHaveFlight'],
    dateTime: json['dateTime'],
    startTime: json['startTime'],
    endTime: json['endTime'],
    hours: json['hours'],
    willToFly: json['willToFly'],
    rank: json['rank'],
    planeType: json['planeType'],
    iWantFlight: json['iWantFlight'],
    postId: json['postId'],
    userName: json['userName'],
  );

  Map<String, dynamic> toJson() => {
    'uid' : uid,
    'iHaveFlight' : iHaveFlight,
    'dateTime' : dateTime,
    'startTime' : startTime,
    'endTime' : endTime,
    'hours' : hours,
    'willToFly' : willToFly,
    'postId' : postId,
    'rank' : rank,
    'planeType' : planeType,
    'iWantFlight' : iWantFlight,
    'userName' : userName,
  };
}