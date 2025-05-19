class ChatMessageEntity {
  String text;
  String? imageURL;
  String id;
  int createdAt;
  Author author;

  ChatMessageEntity({
    required this.text,
    required this.id,
    required this.createdAt,
    this.imageURL,
    required this.author,
  });
}

class Author {
  String userName;

  Author({required this.userName});
}
