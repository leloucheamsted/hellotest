import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hellotest/modules/Details/details.dart';
import 'package:hellotest/modules/common/constants/layout_constants.dart';

import '../constants/constants.dart';

class CardBoard extends StatelessWidget {
  final int number;
  final String statut;
  final double heigth, width;
  const CardBoard(
      {super.key,
      required this.number,
      required this.statut,
      required this.heigth,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Material(
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
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: PaletteColor.containerColor,
            boxShadow: const [],
          ),
          child: Container(
            height: heigth,
            width: width - 20 - LayoutConstants.spaceM * 2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    number.toString(),
                    style: const TextStyle(
                      fontFamily: Fonts.semiBold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: LayoutConstants.spaceS - 2,
                  ),
                  Text(statut,
                      style: const TextStyle(
                        fontFamily: Fonts.regular,
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
