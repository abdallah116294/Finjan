import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/home/presentation/screens/home.dart';
import 'package:finjan/features/layout/screens/cubit/layout_cubit_cubit.dart';
import 'package:finjan/features/orders/presentation/screens/orders.dart';
import 'package:finjan/features/profile/presentation/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;

class LayoutScreen extends StatefulWidget {
   LayoutScreen({super.key, required this.uid});
  final String uid;

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
    List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.settings), label: 'settings'),
  ];

  List<Widget> screens = [
    HomeScreen(
      name: '',
      uid: '',
    ),
    const  OrdersScreen(uid: ''),
    const ProfileScreen(),
  ];

  int selectedTab = 0;

  selectedScreen(int index) {
   setState(() {
      selectedTab = index;
   });
  }
@override
  void initState() {
    super.initState();
    screens = [
      HomeScreen(
        name: '',
        uid: '',
      ),
      OrdersScreen(uid: widget.uid),
      const ProfileScreen(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    //var cubit = LayoutCubitCubit.get(context);
    return Scaffold(
              body: screens[selectedTab],
              bottomNavigationBar: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColor.backgroundColor,
                currentIndex:selectedTab,
                onTap: (value) {
                  selectedScreen(value);
                  //selectedScreen2(value);
                  debugPrint(value.toString());
                },
                unselectedIconTheme:
                    const IconThemeData(color: AppColor.unselcetedIcon),
                selectedIconTheme: const IconThemeData(
                  color: Colors.white,
                ),
                items: bottomItems
              ));
  }
}
