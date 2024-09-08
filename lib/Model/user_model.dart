class UserModel {
  final int? id;
  final String userID;
  final String username;
  final String email;
  final List<String> tools;


  UserModel({
    this.id,

    required this.userID,
    required this.username,
    required this.email,
    this.tools = const [],




  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'username': username,
      'email': email,

    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      userID: map['userID'],
      username: map['username'],
      email: map['email'],

    );
  }
}
