import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/constants.dart';
import '../constants/layout_constants.dart';
import 'group_avatar.dart';

class ContainerBoard extends StatelessWidget {
  final String title, usernames, time;
  final bool asShadow;
  final double padding;
  const ContainerBoard(
      {super.key,
      required this.title,
      required this.usernames,
      required this.time,
      required this.asShadow,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: PaletteColor.containerColor,
        boxShadow: [
          asShadow == true
              ? const BoxShadow(
                  color: Colors.black45,
                  blurRadius: 30.0, // soften the shadow
                  spreadRadius: 0.1, //extend the shadow
                  offset: Offset(
                    0.0, // Move to right 5  horizontally
                    1.0, // Move to bottom 5 Vertically
                  ),
                )
              : const BoxShadow()
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: Fonts.semiBold,
                fontSize: 20,
              ),
            ),
            Text(
              usernames,
              style: const TextStyle(
                fontFamily: Fonts.extraLight,
                fontSize: 15,
              ),
            ),
            const SizedBox(
              height: LayoutConstants.spaceL,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GroupAvatar(
                  size1: 17.0,
                  size2: 15,
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontFamily: Fonts.extraLight,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
