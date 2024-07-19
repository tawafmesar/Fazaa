import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
class LogoutScreen extends StatefulWidget {
  @override
  _LogoutScreenState createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  final HomeController controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();

    controller.logout();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.clockOutline,
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(AppImageAsset.logo),
        ),
        title: const Text("Logout",style: TextStyle(
            color: AppColor.scaffoldBackgroundColor,
            fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
            onPressed: () async {
            },
            icon: const Icon(Icons.more_vert_rounded, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: Text("Logout screen content goes here"),
      ),
    );
  }
}
