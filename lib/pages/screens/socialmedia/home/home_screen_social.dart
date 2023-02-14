import 'package:cocreator/pages/screens/socialmedia/blog/add_blog_screen.dart';
import 'package:cocreator/pages/screens/socialmedia/home/components/home_drawer.dart';
import 'package:cocreator/pages/screens/socialmedia/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreenSocial extends GetView<HomeController> {
  const HomeScreenSocial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //   title: Obx(
      //     () => Text(controller.titleString[controller.currentIndex.value]),
      //   ),
      //   centerTitle: true,
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.notifications),
      //       onPressed: () {},
      //     ),
      //   ],
      // ),
      //drawer: const HomeDrawer(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.teal,
      //   onPressed: () {
      //     //Get.to(const AddBlogScreen());
      //     PersistentNavBarNavigator.pushNewScreen(context,
      //         withNavBar: false,
      //         screen: AddBlogScreen(),
      //         pageTransitionAnimation: PageTransitionAnimation.slideUp);
      //   },
      //   child: const Text(
      //     '+',
      //     style: TextStyle(fontSize: 40),
      //   ),
      // ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.teal,
      //   shape: const CircularNotchedRectangle(),
      //   notchMargin: 12,
      //   child: SizedBox(
      //     height: 60,
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         children: <Widget>[
      //           Obx(
      //             () => IconButton(
      //               icon: const Icon(Icons.home),
      //               color: controller.currentIndex.value == 0
      //                   ? Colors.white
      //                   : Colors.white54,
      //               onPressed: () {
      //                 controller.currentIndex(0);
      //               },
      //               iconSize: 40,
      //             ),
      //           ),
      //           Obx(
      //             () => IconButton(
      //               icon: const Icon(Icons.person),
      //               color: controller.currentIndex.value == 1
      //                   ? Colors.white
      //                   : Colors.white54,
      //               onPressed: () {
      //                 controller.currentIndex(1);
      //               },
      //               iconSize: 40,
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: Obx(() => controller.widgets[controller.currentIndex.value]),
    );
  }
}
