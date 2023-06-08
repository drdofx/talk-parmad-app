class Thread {
  final String title;
  final String text;
  final int forumId;
  final int id;

  Thread({
    required this.title,
    required this.text,
    required this.forumId,
    required this.id,
  });

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
      title: json['title'],
      text: json['text'],
      forumId: json['forum_id'],
      id: json['id'],
    );
  }
}
