import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hellotest/app_widget.dart';
import 'package:hellotest/modules/Details/details.dart';
import 'package:hellotest/modules/home/presentation/home.dart';
import 'package:hellotest/modules/common/constants/constants.dart';
import 'package:hellotest/welcome.dart';
import 'package:provider/provider.dart';

import 'app_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        systemNavigationBarDividerColor: PaletteColor.bgColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: PaletteColor.bgColor));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'HelloMer.. Demo',
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        debugShowCheckedModeBanner: false,
        home: const WelcomePage(),
      ),
    );
  }
}
