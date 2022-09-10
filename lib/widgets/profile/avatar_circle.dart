import 'package:flutter/material.dart';

class AvatarCircle extends StatelessWidget {
  final String url;
  final double radius;

  const AvatarCircle({Key? key, required this.url, required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundImage: NetworkImage(url),
    );
  }
}
