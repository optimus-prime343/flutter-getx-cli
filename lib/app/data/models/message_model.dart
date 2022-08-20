class MessageModel {
  final User user;
  final String message;
  final String date;
  final bool hasRead;

  MessageModel({
    required this.user,
    required this.message,
    required this.date,
    required this.hasRead,
  });
  factory MessageModel.fromJSON(Map<String, dynamic> json) {
    return MessageModel(
      user: User.fromJSON(json['user']),
      message: json['message'],
      date: json['date'],
      hasRead: json['hasRead'],
    );
  }
}

class User {
  final String username;
  final String profileImage;

  User({
    required this.username,
    required this.profileImage,
  });
  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      profileImage: json['profileImage'],
    );
  }
}
