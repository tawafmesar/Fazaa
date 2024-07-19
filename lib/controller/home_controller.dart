import 'package:fazaa/view/screen/chat_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../core/constant/routes.dart';
import '../core/services/services.dart';
import '../view/screen/auth/logout.dart';
import '../view/screen/coursesfile/addfile.dart';
import '../view/screen/coursesfile/allfiles.dart';
import '../view/screen/coursesfile/viewallfiles.dart';
import '../view/screen/homescreen.dart';

class HomeController extends GetxController {
  var currentTabIndex = 0.obs;
  MyServices myServices = Get.find();

  final List<Widget> tabPages = [
    IndexScreen(),
    ChatScreen(),
    AllFileScreen(),
    Center(child: Text('We are Working on the map and it will be in Future Work ')),
    LogoutScreen(),

  ];


  void changeTabIndex(int index) {
    currentTabIndex.value = index;
  }


  @override
  logout() async {

    myServices.sharedPreferences.setString("step","1") ;

    await Future.delayed(Duration.zero); // Add this line to schedule the navigation in the next frame
    Get.offNamed(AppRoute.login);
  }

}
