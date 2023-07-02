class ThreadDetail {
  final ThreadDetailThread thread;
  final List<ThreadDetailReply> replies;
  final int totalReplies;
  final int totalUpvotes;
  final int totalDownvotes;
  final String createdBy;

  ThreadDetail({
    this.thread = const ThreadDetailThread(),
    this.replies = const [],
    this.totalReplies = 0,
    this.totalUpvotes = 0,
    this.totalDownvotes = 0,
    this.createdBy = "",
  });

  factory ThreadDetail.fromJson(Map<String, dynamic> json) {
    final thread =
        ThreadDetailThread.fromJson(json['thread'] as Map<String, dynamic>);
    final repliesJson = json['reply'] as List<dynamic>?;

    List<ThreadDetailReply> replies = [];
    if (repliesJson != null) {
      replies = repliesJson.map((e) => ThreadDetailReply.fromJson(e)).toList();
    }

    return ThreadDetail(
      thread: thread,
      replies: replies,
      totalReplies: json['total_replies'],
      totalUpvotes: json['total_upvotes'],
      totalDownvotes: json['total_downvotes'],
      createdBy: json['created_by'],
    );
  }
}

class ThreadDetailThread {
  final String title;
  final String text;
  final int id;

  const ThreadDetailThread({
    this.title = "",
    this.text = "",
    this.id = 0,
  });

  factory ThreadDetailThread.fromJson(Map<String, dynamic> json) {
    return ThreadDetailThread(
      id: json['id'],
      title: json['title'],
      text: json['text'],
    );
  }
}

class ThreadDetailReply {
  final String text;
  final int id;
  final String createdBy;
  final int totalUpvotes;
  final int totalDownvotes;

  const ThreadDetailReply({
    this.text = "",
    this.id = 0,
    this.createdBy = "",
    this.totalUpvotes = 0,
    this.totalDownvotes = 0,
  });

  factory ThreadDetailReply.fromJson(Map<String, dynamic> json) {
    return ThreadDetailReply(
      id: json['id'],
      text: json['text'],
      createdBy: json['created_by'],
      totalUpvotes: json['total_upvotes'],
      totalDownvotes: json['total_downvotes'],
    );
  }
}
