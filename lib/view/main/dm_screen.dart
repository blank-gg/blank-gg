import 'package:blank_mobile/view/main/View_Messages.dart';
import 'package:flutter/material.dart';
import '../../widgets/profile/avatar_circle.dart';

class DmScreen extends StatelessWidget {
  const DmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    ListTile dm_card(
        {String Username = "Username",
        int last_seen_minutes = 99,
        String date = 'dd/mm/yy',
        String imageUrl = 'https://bit.ly/3TYaXlZ'}) {
      return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const View_Messages()),
          );
        },
        title: Text(
          '$Username',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Last message $last_seen_minutes m ago'),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
          backgroundColor: Colors.indigo,
          radius: 30,
        ),
        trailing: Text(
          date,
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    return CustomScrollView(slivers: [
      SliverAppBar(
        automaticallyImplyLeading: false,
        elevation: 5,
        scrolledUnderElevation: 1,
        shape: Border(
          bottom: BorderSide(color: colorScheme.onSurface.withOpacity(0.1)),
        ),
        title: const Text('Direct Messages',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        leading: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: AvatarCircle(radius: 24, url: 'https://picsum.photos/200'),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: Color(0xff00501E),
            ),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
        toolbarHeight: size.height * 0.1,
        leadingWidth: size.width * 0.15,
      ),
      SliverList(
        delegate: SliverChildListDelegate([
          dm_card(
              Username: 'Pratyush',
              last_seen_minutes: 30,
              imageUrl:
                  'https://media-exp1.licdn.com/dms/image/C5603AQFAmEjqj7F5qg/profile-displayphoto-shrink_800_800/0/1632294235425?e=1668643200&v=beta&t=_mp_3pgvwgJ6Y1CnaPGKsdeBvb7fBfHesHdKqSFtJP8',
              date: 'dd/mm/yy'),
          dm_card(
              Username: 'ali',
              last_seen_minutes: 20,
              imageUrl:
                  'https://media-exp1.licdn.com/dms/image/C5603AQFVEiRCbvcy8g/profile-displayphoto-shrink_800_800/0/1648843981397?e=1668643200&v=beta&t=slG_7snSm6EQl07rEGz5QhJL96HSylLXKveQf4XEGNk',
              date: 'dd/mm/yy'),
          dm_card(),
          dm_card(),
          dm_card(),
          dm_card(),
        ]),
      )
    ]);
  }
}
