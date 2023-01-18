import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hellotest/modules/common/widgets/container_board.dart';

import '../common/constants/constants.dart';
import '../common/constants/layout_constants.dart';
import '../common/widgets/avatar.dart';

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // status bar color
        systemNavigationBarDividerColor: PaletteColor.bgColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: PaletteColor.bgColor));
    return WillPopScope(
      onWillPop: () async {
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent, // status bar color
            systemNavigationBarDividerColor: PaletteColor.secondColor,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: PaletteColor.secondColor));
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: PaletteColor.fisrtBg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ----------------- AppBar
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstants.paddingM + 5),
                margin: const EdgeInsets.fromLTRB(
                    0, LayoutConstants.paddingM + 8, 0, 0),
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bacButton(context),
                    const Avatar(
                      size1: 20,
                      size2: 17,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: LayoutConstants.spaceL,
              ),
              // ----------------  Calendar controller
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: LayoutConstants.paddingM + 8),
                child: _calendarController(context),
              ),
              const SizedBox(
                height: LayoutConstants.spaceXL,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: LayoutConstants.paddingM + 8),
                child: Text(
                  'Ongoing',
                  style: TextStyle(
                    fontFamily: Fonts.bold,
                    color: PaletteColor.blackColor,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: LayoutConstants.spaceL,
              ),
              // ------------------- List tasks
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _ongoingTask('9 AM', '10 AM', 'Mobile App Design',
                        'Mike and Inata', "9.00 AM - 10.00 AM"),
                    const SizedBox(
                      height: 15,
                    ),
                    _stopTime('10 AM'),
                    const SizedBox(
                      height: 15,
                    ),
                    _ongoingTask('11 AM', '12 AM', 'Software Testing',
                        'Mike and Inata', "11.00 AM - 12.00 AM"),
                    const SizedBox(
                      height: 15,
                    ),
                    _ongoingTask('1 PM', '12 AM', 'Web Development',
                        'Mike and Inata', "1.00 PM - 12.00 AM"),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

// stop time
  Widget _stopTime(String time) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(LayoutConstants.paddingM + 8, 0, 5, 0),
      child: Row(
        children: [
          Text(
            time,
            style: const TextStyle(
                fontFamily: Fonts.regular, color: PaletteColor.textHourColor),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            height: 15,
            width: 15,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: PaletteColor.textColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 30.0, // soften the shadow
                  spreadRadius: 0.1, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: PaletteColor.redColor,
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              height: 1,
              color: PaletteColor.redColor,
            ),
          ),
        ],
      ),
    );
  }
// Ongoing task item

  Widget _ongoingTask(
      String startTime, endTime, String title, usernames, fullTime) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: LayoutConstants.paddingM + 8),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                startTime,
                style: const TextStyle(
                    fontFamily: Fonts.regular,
                    color: PaletteColor.textHourColor),
              ),
              const SizedBox(
                height: LayoutConstants.spaceXL,
              ),
              Text(
                endTime,
                style: const TextStyle(
                    fontFamily: Fonts.regular,
                    color: PaletteColor.textHourColor),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ContainerBoard(
                padding: 8,
                title: title,
                usernames: usernames,
                time: fullTime,
                asShadow: false),
          ),
        ],
      ),
    );
  }

// Calendar controller
  Widget _calendarController(context) {
    return Container(
      // color: Colors.red,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //--- Previous button
              _previuos(),
              const Text(
                'April',
                style: TextStyle(
                  fontFamily: Fonts.bold,
                  fontSize: 25,
                  color: PaletteColor.blackColor,
                ),
              ),
              _next(),
            ],
          ),
          const SizedBox(
            height: LayoutConstants.spaceXL - 5,
          ),
          _dayList()
        ],
      ),
    );
  }

//day's list
  Widget _dayList() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _daylistItem('12', 'Wed', true),
      _daylistItem('13', 'Thu', false),
      _daylistItem('14', 'Fri', false),
      _daylistItem('15', 'Sat', false),
    ]);
  }

  // day's list item
  Widget _daylistItem(String date, day, bool isday) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color:
            isday == true ? PaletteColor.secondColor : PaletteColor.textColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
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
        padding: const EdgeInsets.symmetric(
            vertical: LayoutConstants.paddingS, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              date,
              style: TextStyle(
                  fontFamily: Fonts.semiBold,
                  fontSize: 28,
                  color: isday == true
                      ? PaletteColor.textColor
                      : PaletteColor.containerColor),
            ),
            Text(
              day,
              style: TextStyle(
                  fontFamily: Fonts.light,
                  fontSize: 12,
                  color: isday == true
                      ? PaletteColor.textColor
                      : PaletteColor.containerColor),
            )
          ],
        ),
      ),
    );
  }

// Action Button
  Widget _previuos() {
    return Row(
      children: [
        SvgPicture.asset(
          IconsName.back,
          height: 20,
          width: 20,
          color: PaletteColor.blackColor,
        ),
        const SizedBox(
          width: LayoutConstants.spaceS,
        ),
        const Text(
          'Mar',
          style: TextStyle(
            color: PaletteColor.blackColor,
            fontSize: 15,
            fontFamily: Fonts.semiBold,
          ),
        )
      ],
    );
  }

  Widget _next() {
    return Row(
      children: [
        const Text(
          'May',
          style: TextStyle(
            color: PaletteColor.blackColor,
            fontSize: 15,
            fontFamily: Fonts.semiBold,
          ),
        ),
        const SizedBox(
          width: LayoutConstants.spaceS,
        ),
        SvgPicture.asset(
          IconsName.arrowRight,
          height: 20,
          width: 20,
          color: PaletteColor.blackColor,
        ),
      ],
    );
  }

//  Back button
  Widget _bacButton(context) {
    return Material(
      color: Colors.white.withOpacity(0.0),
      child: InkWell(
        focusColor: PaletteColor.secondColor,
        onTap: (() {
          Navigator.pop(context);
        }),
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: PaletteColor.borderColor,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            height: 40,
            width: 40,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(5),
            //   border: Border.all(
            //     width: 1,
            //     color: PaletteColor.borderColor,
            //   ),
            // ),
            child: SvgPicture.asset(
              IconsName.back,
              height: 25,
              width: 25,
              color: PaletteColor.blackColor,
            ),
          ),
        ),
      ),
    );
  }
}
