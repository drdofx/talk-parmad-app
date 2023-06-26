class ForumData {
  final int forumId;
  final String forumName;
  final String forumIntroductionText;
  final String forumCategory;
  final String forumImage;

  const ForumData({
    required this.forumId,
    required this.forumName,
    required this.forumIntroductionText,
    required this.forumCategory,
    String? forumImage,
  }) : forumImage = forumImage ??
            'https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg';

  factory ForumData.fromJson(Map<String, dynamic> json) {
    return ForumData(
      forumId: json['id'],
      forumName: json['forum_name'],
      forumIntroductionText: json['introduction_text'],
      forumCategory: json['category'],
      forumImage: json['forum_image'],
    );
  }
}
