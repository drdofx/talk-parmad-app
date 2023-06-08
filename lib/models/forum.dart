class Forum {
  final int id;
  final String forumName;
  final String introductionText;
  final String forumImage;
  final String category;

  Forum({
    required this.id,
    required this.forumName,
    this.introductionText = '',
    this.forumImage = '',
    this.category = '',
  });

  factory Forum.fromJson(Map<String, dynamic> json) {
    return Forum(
      id: json['forum_id'],
      forumName: json['forum_name'],
      forumImage: json['forum_image'],
      introductionText: json['introduction_text'],
      category: json['category'],
    );
  }
}
