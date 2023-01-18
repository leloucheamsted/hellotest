import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hellotest/app_bloc.dart';
import 'package:hellotest/modules/home/presentation/home.dart';
import 'package:hellotest/modules/common/constants/constants.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final List<Widget> pages = const [
    Home(),
    Home(),
    Home(),
    Home(),
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        systemNavigationBarDividerColor: PaletteColor.secondColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: PaletteColor.secondColor));
    return Scaffold(
      backgroundColor: PaletteColor.secondColor,
      resizeToAvoidBottomInset: true,
      body: IndexedStack(
        index: context.watch<AppBloc>().currentTab,
        children: pages,
      ),
      bottomNavigationBar: BottomAppBar(
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
              height: 60,
              decoration: const BoxDecoration(
                color: PaletteColor.secondColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _navigationItem(IconsName.home, "Acceuill", 0),
                    _navigationItem(IconsName.document, "Bibliotheque", 1),
                    _navigationItem(IconsName.user, "Mes Listes", 2),
                    _navigationItem(IconsName.notification, "Mon compte", 3),
                  ],
                ),
              ))),
    );
  }

  Widget _navigationItem(String icon, name, int tabIndex) {
    return Expanded(
      child: Material(
        color: Colors.white.withOpacity(0.0),
        child: InkResponse(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            context.read<AppBloc>().changeTab(tabIndex);
          },
          child: Ink(
              decoration: BoxDecoration(
                color: PaletteColor.secondColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SvgPicture.asset(
                  icon,
                  color: context.watch<AppBloc>().currentTab == tabIndex
                      ? PaletteColor.actionColor
                      : PaletteColor.textColor,
                  height: 20,
                  width: 20,
                ),
              )),
        ),
      ),
    );
  }
}
