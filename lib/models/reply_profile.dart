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

class ThreadProfile {
  final int userId;
  final int forumId;
  final String forumName;
  final String forumImage;
  final String threadTitle;
  final String threadText;
  final int threadId;

  ThreadProfile({
    required this.userId,
    required this.forumId,
    required this.forumName,
    required this.forumImage,
    required this.threadTitle,
    required this.threadText,
    required this.threadId,
  });

  factory ThreadProfile.fromJson(Map<String, dynamic> json) {
    return ThreadProfile(
      userId: json['user_id'],
      forumId: json['forum_id'],
      forumName: json['forum_name'],
      forumImage: json['forum_image'],
      threadTitle: json['title'],
      threadText: json['text'],
      threadId: json['thread_id'],
    );
  }
}
