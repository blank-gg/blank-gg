import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String authorName;
  final String authorAvatarUrl;
  final String authorAddress;
  final String content;
  final int likes;
  final double height;

  final String? imageUrl;

  const PostCard(
      {Key? key,
      required this.authorName,
      required this.authorAvatarUrl,
      required this.authorAddress,
      required this.content,
      required this.likes,
      required this.height,
      this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String authorNameTrimmed = authorAddress.length > 10
        ? authorAddress.substring(0, 10) + '...'
        : authorAddress;

    return Container(
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: const BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Row(children: [
                CircleAvatar(
                    backgroundImage: NetworkImage(authorAvatarUrl), radius: 36),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Text(authorName,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(width: 8),
                                Text("@$authorNameTrimmed",
                                    overflow: TextOverflow.ellipsis),
                              ],
                            ),
                          ),
                          SizedBox(
                              width: 30,
                              height: 30,
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: IconButton(
                                      icon: const Icon(Icons.expand_more,
                                          size: 20, color: Colors.grey),
                                      onPressed: () {}))),
                        ],
                      ),
                      Text(
                        content,
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                )
              ]),
            ),
            // if (imageUrl != null)
            //   SizedBox(
            //     width: 100,
            //     child: Card(
            //       semanticContainer: true,
            //       clipBehavior: Clip.antiAliasWithSaveLayer,
            //       child: Image.network(
            //         'https://placeimg.com/640/480/any',
            //         fit: BoxFit.fill,
            //       ),
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //     ),
            //   ),
            Row(
              children: [
                const SizedBox(width: 88),
                IconButton(
                    icon: const Icon(Icons.favorite_border,
                        size: 20, color: Colors.grey),
                    onPressed: () {}),
                const SizedBox(width: 8),
                Text(likes.toString()),
                const SizedBox(width: 16),
                IconButton(
                    icon: const Icon(Icons.ios_share,
                        size: 20, color: Colors.grey),
                    onPressed: () {}),
              ],
            )
          ],
        ));
  }
}
