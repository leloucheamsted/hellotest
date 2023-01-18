import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../Details/details.dart';
import '../../common/constants/constants.dart';
import '../../common/constants/layout_constants.dart';
import '../../common/widgets/group_avatar.dart';

class Containers extends StatelessWidget {
  const Containers({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        focusColor: PaletteColor.secondColor,
        borderRadius: BorderRadius.circular(15),
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Details()),
          );
        }),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: PaletteColor.containerColor,
            boxShadow: const [
              BoxShadow(
                color: Colors.black45,
                blurRadius: 30.0, // soften the shadow
                spreadRadius: 0.1, //extend the shadow
                offset: Offset(
                  0.0, // Move to right 5  horizontally
                  1.0, // Move to bottom 5 Vertically
                ),
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mobile App Design',
                  style: TextStyle(
                    fontFamily: Fonts.semiBold,
                    fontSize: 20,
                  ),
                ),
                const Text(
                  'Mike and Anita',
                  style: TextStyle(
                    fontFamily: Fonts.extraLight,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(
                  height: LayoutConstants.spaceL,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    GroupAvatar(
                      size1: 20.0,
                      size2: 17.0,
                    ),
                    Text(
                      'Now',
                      style: TextStyle(
                        fontFamily: Fonts.extraLight,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
