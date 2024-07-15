class UserModel {
  final int? id;
  final String userID;
  final String username;
  final String email;
  final bool isLogged;
  final bool isPremium;

  UserModel({
    this.id,

    required this.userID,
    required this.username,
    required this.email,
    this.isLogged = false,
    this.isPremium = false

    ,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userID': userID,
      'username': username,
      'email': email,
      'isLogged': isLogged,
      'isPremium': isPremium,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      userID: map['userID'],
      username: map['username'],
      email: map['email'],
      isLogged: map['isLogged'],
      isPremium: map['isPremium'],
    );
  }
}
