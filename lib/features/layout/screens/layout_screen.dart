import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/home/presentation/screens/home.dart';
import 'package:finjan/features/layout/widgets/nav_bar_widget.dart';
import 'package:finjan/features/orders/presentation/screens/orders.dart';
import 'package:finjan/features/profile/presentation/screens/profile.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key,});
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int selectedTab = 0;
  List<Widget> screens = [
    HomeScreen(name: '',),
    const OrdersScreen(),
    const ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[selectedTab],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(18),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColor.backgroundColor,
            currentIndex: selectedTab,
            onTap: (value) {
              setState(() {
                selectedTab = value;
              });
              debugPrint(value.toString());
            },
            unselectedIconTheme:
                const IconThemeData(color: AppColor.unselcetedIcon),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
            ),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: "Orders"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile")
            ],
          ),
        ));
  }
}
