import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';
import '../../core/constant/color.dart';


class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double appBarHeight = MediaQuery.of(context).size.width > 600 ? 72.0 : 56.0;

    return Scaffold(
        body: Obx(() => controller.tabPages[controller.currentTabIndex.value]),
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.react,
          color: AppColor.primaryColor,
          backgroundColor: AppColor.bottombar,
          height:appBarHeight ,
          items: const [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.mark_chat_unread_outlined, title: 'Assistant'),
            TabItem(icon: Icons.folder_shared, title: 'Files'),
            TabItem(icon: Icons.map, title: 'Loction'),
            TabItem(icon: Icons.login, title: 'logout'),
          ],
          onTap: (int i) { controller.changeTabIndex(i);},
        )
    );
  }
}
