// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:notifications/services/notification_services.dart';
import 'package:notifications/services/theme_services.dart';
import 'package:notifications/theme.dart';
import 'package:notifications/widgets/button.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late NotifyHelper notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        body: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            _addTaskBar(),
            Container(
                margin: const EdgeInsets.only(top: 20, left: 25),
                child: DatePicker(
                  DateTime.now(),
                  height: 100,
                  width: 80,
                  locale: 'pt-br',
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Get.isDarkMode ? darkModeClr : primaryClr,
                  selectedTextColor: Get.isDarkMode ? white : darkGreyClr,
                  dateTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Get.isDarkMode ? darkModeClr : primaryClr,
                  ),
                  monthTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? darkModeClr : primaryClr,
                  ),
                  dayTextStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Get.isDarkMode ? darkModeClr : primaryClr,
                  ),
                )),
          ],
        ));
  }

  _addTaskBar() {
    return Container(
        margin: const EdgeInsets.only(left: 5, right: 22, top: 10),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: subHeadingStyle,
                  ),
                  Text(
                    "Hoje",
                    style: headingStyle,
                  ),
                ],
              )),
          MyButton(label: "+", onTap: () => null)
        ]));
  }

  _appBar() {
    return AppBar(
      elevation: 8,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          ThemeService().switchTheme();
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body: Get.isDarkMode
                ? "Activated Light Theme"
                : "Activated Dark Theme",
          );

          notifyHelper.scheduledNotification();
        },
        child: Icon(
          Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
          size: 20,
          color: Get.isDarkMode ? Colors.white : darkHeaderClr,
        ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      actions: [
        CircleAvatar(
          backgroundImage: AssetImage("images/icon-profile.png"),
        ),
        SizedBox(width: 20),
      ],
    );
  }
}
