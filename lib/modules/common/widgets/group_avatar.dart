import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hellotest/modules/common/widgets/avatar.dart';

import '../constants/constants.dart';

class GroupAvatar extends StatelessWidget {
  final double size1, size2;
  const GroupAvatar({super.key, required this.size1, required this.size2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Stack(children: [
        Avatar(
          size1: size1,
          size2: size2,
        ),
        Positioned(
          left: 20,
          child: Avatar(
            size1: size1,
            size2: size2,
          ),
        ),
      ]),
    );
  }
}
