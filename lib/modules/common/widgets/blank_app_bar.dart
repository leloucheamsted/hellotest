import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hellotest/modules/common/constants/constants.dart';

class BlanckAppBar extends StatelessWidget {
  const BlanckAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0,
      color: Colors.transparent,
    );
  }
}
