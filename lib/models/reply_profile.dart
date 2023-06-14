class ReplyProfile {
  final int forumId;
  final String forumName;
  final String forumImage;
  final String threadTitle;
  final String replyText;

  ReplyProfile({
    required this.forumId,
    required this.forumName,
    required this.forumImage,
    required this.threadTitle,
    required this.replyText,
  });

  factory ReplyProfile.fromJson(Map<String, dynamic> json) {
    return ReplyProfile(
      forumId: json['forum_id'],
      forumName: json['forum_name'],
      forumImage: json['forum_image'],
      threadTitle: json['thread_title'],
      replyText: json['reply_text'],
    );
  }
}
