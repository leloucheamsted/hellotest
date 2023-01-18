import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hellotest/app_widget.dart';
import 'package:hellotest/modules/home/presentation/home.dart';
import 'package:hellotest/modules/common/constants/constants.dart';
import 'package:hellotest/modules/common/constants/layout_constants.dart';
import 'package:hellotest/modules/common/widgets/blank_app_bar.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: PaletteColor.fisrtBg),
        child: Padding(
          padding: const EdgeInsets.all(LayoutConstants.paddingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text(
                'Manage your daily tasks',
                style: TextStyle(
                  color: PaletteColor.blackColor,
                  fontFamily: Fonts.bold,
                  fontWeight: FontWeight.w700,
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: LayoutConstants.spaceL,
              ),
              const Text(
                'Team and Project management with solution providing App',
                style: TextStyle(
                  color: PaletteColor.blackColor,
                  fontFamily: Fonts.regular,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: LayoutConstants.spaceL * 2,
              ),
              _started(context),
              const SizedBox(
                height: LayoutConstants.spaceXL + 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  ///------ STARTED BUTTON
  Widget _started(context) {
    return SizedBox(
      //color: PaletteColor.redColor,
      child: GestureDetector(
        onTap: (() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        }),
        child: Row(
          children: [
            Material(
              color: Colors.white.withOpacity(0.0),
              child: InkWell(
                focusColor: PaletteColor.secondColor,
                onTap: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppWidget()),
                  );
                }),
                borderRadius: BorderRadius.circular(30),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: const Color(0xFFffffff),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white10,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      )
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.centerRight,
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      //  color: const Color(0xFFffffff),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.white10,
                          blurRadius: 15.0, // soften the shadow
                          spreadRadius: 5.0, //extend the shadow
                          offset: Offset(
                            5.0, // Move to right 5  horizontally
                            5.0, // Move to bottom 5 Vertically
                          ),
                        )
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(6),
                      child: Text(
                        'Get',
                        style: TextStyle(
                          color: PaletteColor.blackColor,
                          fontFamily: Fonts.semiBold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }),
              child: const Text(
                'Started',
                style: TextStyle(
                  color: PaletteColor.blackColor,
                  fontFamily: Fonts.semiBold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
