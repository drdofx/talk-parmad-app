class ForumDetail {
  final ForumDetailForum forum;
  final List<ForumDetailThread> thread;
  final int totalThreads;
  final int numberOfMembers;
  final bool isMember;

  ForumDetail({
    this.forum = const ForumDetailForum(),
    this.thread = const [], // Update the default value here
    this.totalThreads = 0,
    this.numberOfMembers = 0,
    this.isMember = false,
  });

  factory ForumDetail.fromJson(Map<String, dynamic> json) {
    final forum =
        ForumDetailForum.fromJson(json['forum'] as Map<String, dynamic>);
    final threadJson = json['threads'] as List<dynamic>?;

    List<ForumDetailThread> thread = [];
    if (threadJson != null) {
      thread = threadJson.map((e) => ForumDetailThread.fromJson(e)).toList();
    }

    return ForumDetail(
      forum: forum,
      thread: thread,
      totalThreads: json['total_threads'],
      numberOfMembers: json['number_of_members'],
      isMember: json['is_member'],
    );
  }
}

class ForumDetailForum {
  final int id;
  final String forumName;
  final String introductionText;
  final String forumImage;
  final String category;

  const ForumDetailForum({
    this.id = 0,
    this.forumName = '',
    this.introductionText = '',
    String? forumImage,
    this.category = '',
  }) : forumImage = forumImage ??
            'https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg';

  factory ForumDetailForum.fromJson(Map<String, dynamic> json) {
    return ForumDetailForum(
      id: json['id'],
      forumName: json['forum_name'],
      forumImage: json['forum_image'],
      introductionText: json['introduction_text'],
      category: json['category'],
    );
  }

  factory ForumDetailForum.fromSearchJson(Map<String, dynamic> json) {
    return ForumDetailForum(
      id: json['id'] ?? 0,
      forumName: json['forum_name'] ?? '',
      forumImage: json['forum_image'] != null && json['forum_image'] != ''
          ? json['forum_image']
          : 'https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg',
      introductionText: '',
      category: json['category'] ?? '',
    );
  }
}

class ForumDetailThread {
  final int id;
  final String title;
  final String text;
  final String createdBy;
  final String createdByImage;

  const ForumDetailThread({
    this.id = 0,
    this.title = '',
    this.text = '',
    this.createdBy = '',
    String? createdByImage,
  }) : createdByImage = createdByImage ??
            'https://t3.ftcdn.net/jpg/02/49/82/50/360_F_249825007_f5dzNTBuUZoV5nERUWTlPDoU3cvLIBzn.jpg';

  factory ForumDetailThread.fromJson(Map<String, dynamic> json) {
    return ForumDetailThread(
      id: json['id'],
      title: json['title'],
      text: json['text'],
      createdBy: json['created_by'],
    );
  }
}
