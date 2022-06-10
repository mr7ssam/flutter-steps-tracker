class UserCounterModel {
  final String userName;
  final int count;

  UserCounterModel({
    required this.userName,
    required this.count,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'count': count,
    };
  }

  factory UserCounterModel.fromMap(Map<String, dynamic> map) {
    return UserCounterModel(
      userName: map['userName'] as String,
      count: map['count'] as int,
    );
  }
}
