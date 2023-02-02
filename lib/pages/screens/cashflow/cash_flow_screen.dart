import 'package:cocreator/pages/screens/cashflow/expense.dart';
import 'package:cocreator/pages/screens/hakim/screens/speech_screen.dart';
import 'package:cocreator/widgets/FloatHakeem.dart';
import 'package:cocreator/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'income.dart';

class CashFlowScreen extends StatefulWidget {
  static const String routeName = '/cashflow';
  const CashFlowScreen({Key? key}) : super(key: key);

  @override
  State<CashFlowScreen> createState() => _CashFlowScreenState();
}

class _CashFlowScreenState extends State<CashFlowScreen>
    with SingleTickerProviderStateMixin {
  int selectedPage = 0;

  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller =
        TabController(length: 2, initialIndex: selectedPage, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const Drawer(
          child: CustomDrawer(),
        ),
        appBar: AppBar(
          centerTitle: true,
          title: SizedBox(width: 180, child: (Image.asset('assets/logo3.png'))),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    //     stops: [
                    //   0.2,
                    //   0.4,
                    // ],
                    colors: [
                  Color.fromARGB(255, 143, 200, 241),
                  // Color.fromARGB(255, 94, 129, 253),
                  Color.fromARGB(255, 70, 106, 234)
                ])),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: currentWidth,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Colors.deepPurple))),
                child: Material(
                  color: Colors.white,
                  child: TabBar(
                    indicatorColor: const Color(0xff143E6C),
                    controller: controller,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 100,
                            height: 40,
                            child: const Text(
                              'Income',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.green),
                            )),
                      ),
                      Tab(
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            width: 100,
                            height: 40,
                            child: const Text(
                              'Expense',
                              style: TextStyle(fontSize: 20, color: Colors.red),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: currentWidth,
                height: 800,
                child: TabBarView(
                  controller: controller,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: const IncomeScreen(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      child: const ExpenseScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
            elevation: 5.0,
            onPressed: () {
              PersistentNavBarNavigator.pushNewScreen(context,
                  withNavBar: false,
                  screen: SpeechScreen(),
                  pageTransitionAnimation: PageTransitionAnimation.slideUp);
            },
            label: Text(
              'Hakim',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
            ),
            icon: FloatIaIcon()));
  }
}
