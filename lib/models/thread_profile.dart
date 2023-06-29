class ThreadProfile {
  final int createdBy;
  final String forumName;
  final String forumImage;
  final String threadTitle;
  final String threadText;
  final int threadId;

  ThreadProfile({
    required this.createdBy,
    required this.forumName,
    String? forumImage,
    required this.threadTitle,
    required this.threadText,
    required this.threadId,
  }) : forumImage = forumImage ??
            'https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg';

  factory ThreadProfile.fromJson(Map<String, dynamic> json) {
    return ThreadProfile(
      createdBy: json['created_by'],
      forumName: json['forum_name'],
      forumImage: json['forum_image'],
      threadTitle: json['title'],
      threadText: json['text'],
      threadId: json['id'],
    );
  }
}
