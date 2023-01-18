import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellotest/modules/common/constants/constants.dart';
import 'package:hellotest/modules/common/constants/layout_constants.dart';
import 'package:hellotest/modules/common/widgets/avatar.dart';
import 'package:hellotest/modules/common/widgets/card_board.dart';
import 'package:hellotest/modules/common/widgets/container_board.dart';
import 'package:hellotest/modules/common/widgets/group_avatar.dart';
import 'package:hellotest/modules/common/widgets/left_drawer.dart';
import 'package:hellotest/modules/home/ui/container_board.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key

  //
// class Home extends StatelessWidget {
//   const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // status bar color
            systemNavigationBarDividerColor: PaletteColor.bgColor,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: PaletteColor.bgColor));

        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        key: _key,
        //drawer: const LeftDrawer(),
        body: Container(
          padding: const EdgeInsets.all(LayoutConstants.paddingM + 8),
          decoration: const BoxDecoration(gradient: PaletteColor.secondBg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        IconsName.menu,
                        color: PaletteColor.textColor,
                        height: 30,
                      ),
                    ),
                    const Avatar(
                      size1: 20.0,
                      size2: 17.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: LayoutConstants.spaceL,
              ),
              //----------------------- Title Part App
              const Text(
                'Hi Ghulam',
                style: TextStyle(
                  fontFamily: Fonts.semiBold,
                  fontSize: 34,
                ),
              ),
              const Text(
                '6 Tasks are pending',
                style: TextStyle(
                  fontFamily: Fonts.extraLight,
                  fontSize: 18,
                ),
              ),

              const SizedBox(
                height: LayoutConstants.spaceXL,
              ),
              const Containers(),

              const SizedBox(
                height: LayoutConstants.spaceXL,
              ),
              //----- REVIEW
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Monthly Review',
                    style: TextStyle(
                      fontFamily: Fonts.semiBold,
                      fontSize: 20,
                    ),
                  ),

                  //--- Agenda button
                  Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: PaletteColor.actionColor,
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
                    child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          IconsName.calendar,
                          color: PaletteColor.textColor,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: LayoutConstants.spaceXL,
              ),
              Expanded(child: _board(context)),
            ],
          ),
        ),
      ),
    );
  }

  //------------------Widget avater
  Widget _avatar() {
    return CircleAvatar(
      radius: 20.0,
      backgroundColor: PaletteColor.textColor,
      child: CircleAvatar(
        radius: 17.0,
        backgroundColor: Colors.grey[200],
        backgroundImage: const CachedNetworkImageProvider(
            "http://dotnethow.net/images/actors/actor-2.jpeg"),
      ),
    );
  }

//----------------- Container Board

//------------  Board

  Widget _board(context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardBoard(
                      number: 22,
                      statut: "Done",
                      heigth: 130,
                      width: MediaQuery.of(context).size.width / 2),
                  const SizedBox(
                    height: 12,
                  ),
                  CardBoard(
                      number: 15,
                      statut: "Ongoing",
                      heigth: 75,
                      width: MediaQuery.of(context).size.width / 2),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CardBoard(
                      number: 07,
                      statut: "In progress",
                      heigth: 75,
                      width: MediaQuery.of(context).size.width / 2),
                  const SizedBox(
                    height: 15,
                  ),
                  CardBoard(
                      number: 12,
                      statut: "Waiting for Review",
                      heigth: 130,
                      width: MediaQuery.of(context).size.width / 2),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
