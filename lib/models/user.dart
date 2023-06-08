class User {
  final String id;
  final String name;
  final String email;
  final String profileImageUrl;
  final String role;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImageUrl,
    required this.role,
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
