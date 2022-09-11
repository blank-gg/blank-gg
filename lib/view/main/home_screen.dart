import 'package:blank_mobile/widgets/common/post_card.dart';
import 'package:blank_mobile/widgets/profile/avatar_circle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/post.dart';
import '../../models/user.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    List<Post> posts = [
      Post(
        author: User(
          username: 'Martha Craig',
          avatarUrl: 'https://picsum.photos/200',
          userAddress: '0x678C2ED039a57F19a636A7AC43e6662d1Dc59855',
        ),
        content: 'UXR/UX: You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou',
        likes: 21,
      ),
      Post(
        author: User(
          username: 'Maximillian',
          avatarUrl: 'https://picsum.photos/200',
          userAddress: '0x7c70cedD7f933A1D558F0124293363678cE9be83',
        ),
        content: 'Y’all ready for this next post?',
        likes: 363,
      ),
      Post(
        author: User(
          username: 'Tabitha Potter',
          avatarUrl: 'https://picsum.photos/200',
          userAddress: '0x084a598c6675181D8cBFa366F4c7B1315d73DAb8',
        ),
        content: 'Kobe’s passing is really sticking w/ me in a way I didn’t expect. He was an icon, the kind of person who wouldn’t die this way. My wife compared it to Princess Di’s accident.',
        likes: 11,
      ),
      Post(
        author: User(
          username: 'karennne',
          avatarUrl: 'https://picsum.photos/200',
          userAddress: '0xE7EC6B8646F95b980eC77AEAb2A62334a09a463F',
        ),
        content: 'Name a show where the lead character is the worst character on the show I’ll get Sabrina Spellman',
        likes: 7461,
      )
    ];

    return CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        scrolledUnderElevation: 1,
        shape: Border(
          bottom: BorderSide(color: colorScheme.onSurface.withOpacity(0.1)),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Elon Suss',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 4),
            Text('0xd9145CCE52D386f254917e481eB44e9943F39138',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: colorScheme.onBackground.withOpacity(0.4),
                )),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed("/profile"),
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: AvatarCircle(radius: 24, url: 'https://picsum.photos/200'),
            ),
          ),
        ],
        toolbarHeight: size.height * 0.1,
        leadingWidth: size.width * 0.15,
      ),
      SliverList(
        delegate: SliverChildListDelegate(
          posts.map((post) => PostCard(
              authorName: post.author.username,
              authorAvatarUrl: post.author.avatarUrl,
              authorAddress: post.author.userAddress,
              imageUrl: post.imageUrl,
              content: post.content,
              likes: post.likes,
              height: size.height * 0.281,
          )).toList(),
        ),
      )
    ]);
  }
}
