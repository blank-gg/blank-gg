import 'user.dart';

class Post {
  final User author;
  final String content;
  final int likes;

  final String? imageUrl;

  Post({
    required this.author,
    required this.content,
    required this.likes,

    this.imageUrl,
  });
}
