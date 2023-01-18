import 'package:flutter/material.dart';

class PaletteColor {
  static const Color bgColor = Color(0xFFDBE9F6);
  static const Color primaryColor = Color(0xFF293C67);
  static const Color secondColor = Color(0xFF4530B3);
  static const Color textColor = Color(0xFFFFFFFF);
  static const Color text1Color = Color(0xFFCEDCE9);
  static const Color actionColor = Color(0xFF21D1FF);
  static const Color blackColor = Color(0xFF0B1F52);
  static const Color redColor = Color(0xFFDD4957);
  static const Color borderColor = Color(0xFFB8CAE2);
  static const Color textAgenda = Color(0xFF554FD5);
  static const Color containerColor = Color(0xFF5451D6);
  static const Color textHourColor = Color(0xFFADBCD1);
  static const LinearGradient fisrtBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.4, 0.6, 0.9],
    colors: [
      Color(0xFFF9FAFC),
      Color(0xFFDBE9F6),
      Color(0xFFDBE9F6),
      Color(0xFFDBE9F6),
    ],
  );

  static const LinearGradient secondBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomCenter,
    stops: [0.1, 0.4, 0.6, 0.9],
    colors: [
      Color(0xFF7162E1),
      Color(0xFF5E4DCF),
      Color(0xFF4530B3),
      Color(0xFF4530B3),
    ],
  );
}

class Fonts {
  static const String regular = 'poppinsRegular';
  static const String light = 'poppinsLight';
  static const String thin = 'poppinsThin';
  static const String extraLight = 'poppinsExtraLight';
  static const String medium = 'poppinsMedium';
  static const String bold = 'poppinsBold';
  static const String semiBold = 'poppinsSemiBold';
}

class IconsName {
  static const String home = 'assets/icons/home.svg';
  static const String calendar = 'assets/icons/calendar.svg';
  static const String user = 'assets/icons/user.svg';
  static const String document = 'assets/icons/document.svg';
  static const String notification = 'assets/icons/notification.svg';
  static const String menu = 'assets/icons/bars-sort.svg';
  static const String back = 'assets/icons/arrow-small-left.svg';
  static const String arrowLeft = 'assets/icons/arrow-left.svg';
  static const String arrowRight = 'assets/icons/arrow-small-right.svg';
}
