import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constants.dart';

class Avatar extends StatelessWidget {
  final double size1, size2;
  const Avatar({super.key, required this.size1, required this.size2});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size1,
      backgroundColor: PaletteColor.textColor,
      child: CircleAvatar(
        radius: size2,
        backgroundColor: Colors.grey[200],
        backgroundImage: const CachedNetworkImageProvider(
            "http://dotnethow.net/images/actors/actor-2.jpeg"),
      ),
    );
  }
}
