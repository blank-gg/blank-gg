import 'package:blank_mobile/widgets/common/post_card.dart';
import 'package:flutter/material.dart';

import '../models/post.dart';
import '../models/user.dart';
import '../widgets/layout/root.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return Container(
        height: size.height * 0.32,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(child: Text("Edit Profile"), onPressed: () {})),
                        SizedBox(height: size.height * 0.01),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Elon Suss',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22)),
                            Text('0xd9145CCE52D386f254917e481eB44e9943F39138',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: Colors.grey)),
                            const SizedBox(height: 16),
                            Text(
                                'Digital Goodies Team - Web & Mobile UI/UX development; Graphics; Illustrations',
                                style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(Icons.link, color: Colors.grey, size: 22),
                                const SizedBox(width: 4),
                                Text('elon.suss',
                                    style: TextStyle(fontSize: 12, color: colorScheme.primary)),

                                const SizedBox(width: 12),

                                Icon(Icons.calendar_month, color: Colors.grey, size: 22),
                                const SizedBox(width: 4),
                                Text('Joined September 10, 2022',
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: '217',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: ' Following',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Text.rich(
                                  TextSpan(
                                    text: '210',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    children: [
                                      TextSpan(
                                          text: ' Followers',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
            Positioned(
              top: -30,
              left: 10,
              child: CircleAvatar(
                radius: 42,
                backgroundImage:
                    NetworkImage("https://placeimg.com/640/480/people"),
              ),
            ),
          ],
        ));
  }
}

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  List<Post> posts = [
    Post(
      author: User(
        username: 'Martha Craig',
        avatarUrl: 'https://picsum.photos/200',
        userAddress: '0x678C2ED039a57F19a636A7AC43e6662d1Dc59855',
      ),
      content:
          'UXR/UX: You can only bring one item to a remote island to assist your research of native use of tools and usability. What do you bring? #TellMeAboutYou',
      likes: 21,
    ),
    Post(
      author: User(
        username: 'Maximillian',
        avatarUrl: 'https://picsum.photos/200',
        userAddress: '0x7c70cedD7f933A1D558F0124293363678cE9be83',
      ),
      imageUrl: 'https://picsum.photos/200',
      content: 'Y’all ready for this next post?',
      likes: 363,
    ),
    Post(
      author: User(
        username: 'Tabitha Potter',
        avatarUrl: 'https://picsum.photos/200',
        userAddress: '0x084a598c6675181D8cBFa366F4c7B1315d73DAb8',
      ),
      imageUrl: 'https://picsum.photos/200',
      content:
          'Kobe’s passing is really sticking w/ me in a way I didn’t expect. He was an icon, the kind of person who wouldn’t die this way. My wife compared it to Princess Di’s accident.',
      likes: 11,
    ),
    Post(
      author: User(
        username: 'karennne',
        avatarUrl: 'https://picsum.photos/200',
        userAddress: '0xE7EC6B8646F95b980eC77AEAb2A62334a09a463F',
      ),
      imageUrl: 'https://picsum.photos/200',
      content:
          'Name a show where the lead character is the worst character on the show I’ll get Sabrina Spellman',
      likes: 7461,
    )
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Root(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: size.height * 0.46,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned.fill(
                    child: Image.network("https://picsum.photos/400/200",
                        fit: BoxFit.cover)),
                AboutSection()
              ],
            ),
          ),
          title: Text('Profile', style: TextStyle(color: Colors.black)),
          floating: true,
          pinned: true,
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          for (var post in posts)
            PostCard(
              authorName: post.author.username,
              authorAvatarUrl: post.author.avatarUrl,
              authorAddress: post.author.userAddress,
              imageUrl: post.imageUrl,
              content: post.content,
              likes: post.likes,
              height: size.height * 0.281,
            )
        ])),
      ],
    ));
  }
}
