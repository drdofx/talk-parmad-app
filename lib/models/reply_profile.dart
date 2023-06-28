class ReplyProfile {
  final ReplyProfileThread thread;
  final ReplyProfileReply reply;

  ReplyProfile({
    required this.thread,
    required this.reply,
  });

  factory ReplyProfile.fromJson(Map<String, dynamic> json) {
    final threadData = json['thread'] as Map<String, dynamic>;
    final replyData = json['reply'] as Map<String, dynamic>;

    // print(threadData);

    return ReplyProfile(
      thread: ReplyProfileThread.fromJson(threadData),
      reply: ReplyProfileReply.fromJson(replyData),
    );
  }
}

class ReplyProfileThread {
  final int threadId;
  final String threadTitle;
  final String threadText;

  ReplyProfileThread({
    required this.threadId,
    required this.threadTitle,
    required this.threadText,
  });

  factory ReplyProfileThread.fromJson(Map<String, dynamic> json) {
    return ReplyProfileThread(
      threadId: json['id'],
      threadTitle: json['title'],
      threadText: json['text'],
    );
  }
}

class ReplyProfileReply {
  final int replyId;
  final String replyText;

  ReplyProfileReply({
    required this.replyId,
    required this.replyText,
  });

  factory ReplyProfileReply.fromJson(Map<String, dynamic> json) {
    return ReplyProfileReply(
      replyId: json['id'],
      replyText: json['text'],
    );
  }
}
