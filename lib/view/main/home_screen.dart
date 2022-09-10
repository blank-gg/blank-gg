import 'package:blank_mobile/widgets/profile/avatar_circle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    return CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        scrolledUnderElevation: 1,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colorScheme.onSurface.withOpacity(0.1)),
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
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: AvatarCircle(radius: 24, url: 'https://picsum.photos/200'),
          ),
        ],
        toolbarHeight: size.height * 0.1,
        leadingWidth: size.width * 0.15,
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          Container(
            height: size.height * 0.2,
            color: Colors.white,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.blue,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.green,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.yellow,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.purple,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.orange,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.pink,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.brown,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.grey,
          ),
          Container(
            height: size.height * 0.2,
            color: Colors.black,
          ),
        ]),
      )
    ]);
  }
}
