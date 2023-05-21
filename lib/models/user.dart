class User {
  final String id;
  final String name;
  final String email;
  final String avatarUrl;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatarUrl,
  });
}
  // factory User.fromJson(Map<String, dynamic> json) {
  //   return User(
  //     id: json['id'],
  //     name: json['name'],
  //     email: json['email'],
  //     avatarUrl: json['avatarUrl'],
  //   );
  // }

  // Map<String, dynamic> toJson() => {
  //       'id': id,
  //       'name': name,
  //       'email': email,
  //       'avatarUrl': avatarUrl,
  //     };
