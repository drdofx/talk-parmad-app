class HomePageModel {
  final int forumId;
  final String forumName;
  final String forumImage;
  final String threadTitle;
  final String threadText;
  final int threadId;

  HomePageModel({
    required this.forumId,
    required this.forumName,
    required this.forumImage,
    required this.threadTitle,
    required this.threadText,
    required this.threadId,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) {
    return HomePageModel(
      forumId: json['forum_id'],
      forumName: json['forum_name'],
      forumImage: json['forum_image'],
      threadTitle: json['title'],
      threadText: json['text'],
      threadId: json['thread_id'],
    );
  }
}
