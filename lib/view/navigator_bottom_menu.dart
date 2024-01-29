import 'package:Fast_Team/view/account/account_page.dart';
import 'package:Fast_Team/view/employee/employee.dart';
import 'package:Fast_Team/view/inbox/inbox_page.dart';
import 'package:Fast_Team/view/request/schedule_request_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home.dart';

class NavigatorBottomMenu extends StatefulWidget {
  const NavigatorBottomMenu({Key? key}) : super(key: key);

  @override
  State<NavigatorBottomMenu> createState() => _NavigatorBottomMenuState();
}

class _NavigatorBottomMenuState extends State<NavigatorBottomMenu> {
  DateTime? currentBackPressedTime;
  static const backPressedDuration = Duration(seconds: 2);
  var selectedIndex = 0.obs;
  var data = false.obs;

  @override
  moveToMenu(index) async {
    // await Future.delayed(const Duration(milliseconds: 500));
    selectedIndex.value = index;
  }

  Future<bool> onBackPressed() async {
    final now = DateTime.now();

    if (currentBackPressedTime == null ||
        now.difference(currentBackPressedTime!) > backPressedDuration) {
      currentBackPressedTime = now;

      var snackbar = const SnackBar(
        content: Text("Tekan sekali lagi untuk keluar..."),
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      return Future.value(false);
    }
    return Future.value(true);
  }

  Widget build(BuildContext context) {
    Widget navigationMenu() {
      return Obx(
        () => WillPopScope(
          // child:HomePage(),
          child: (selectedIndex.value == 0)
              ? HomePage()
              : (selectedIndex.value == 1)
                  ? EmployeePage()
                  : (selectedIndex.value == 3)
                      ? InboxPage()
                      : (selectedIndex.value == 2)
                          ? ScheduleRequestPage()
                          : AccountPage(),
          onWillPop: onBackPressed,
        ),
      );
    }

    Widget itemNavigation() => Container(
          color: Colors.blue, // Ganti dengan warna yang sesuai
          child: BottomNavigationBar(
            onTap: (index) => setState(() {
              moveToMenu(index);
            }),
            currentIndex: selectedIndex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Employee',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.request_page),
                label: 'Request',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.inbox),
                label: 'Inbox',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Account',
              ),
            ],
          ),
        );

    return Scaffold(
      body: navigationMenu(),
      bottomNavigationBar: itemNavigation(),
    );
  }
}
