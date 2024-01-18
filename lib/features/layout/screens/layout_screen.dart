import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/home/presentation/screens/home.dart';
import 'package:finjan/features/home/presentation/widgets/titles_widget.dart';
import 'package:finjan/features/layout/screens/cubit/layout_cubit_cubit.dart';
import 'package:finjan/features/orders/presentation/screens/orders.dart';
import 'package:finjan/features/profile/presentation/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LayoutScreen extends StatefulWidget {
  LayoutScreen({super.key, required this.uid, required this.name});
  final String uid;
  final String name;
  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), label: 'Order'),
    // const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.settings), label: 'settings'),
  ];

  List<Widget> screens = [
    HomeScreen(
      name: '',
      uid: '',
    ),
    const OrdersScreen(uid: ''),
    // const ProfileScreen(),
  ];

  int selectedTab = 0;

  selectedScreen(int index) {
    setState(() {
      selectedTab = index;
    });
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
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
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.brown, Colors.brown.withOpacity(0.2)],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animateChildDecoration: true,
      animationDuration: const Duration(milliseconds: 300),
      disabledGestures: false,
      rtlOpening: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
          child: Container(
        child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              children: [
                Container(
                    width: 128.0,
                    height: 128.0,
                    margin: const EdgeInsets.only(
                      top: 24.0,
                      bottom: 64.0,
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      color: AppColor.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Lottie.asset("assets/splash.json")),
                TitlesTextWidget(
                  label: "Welcom ${widget.name} ",
                  color: Colors.white,
                ),
                ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                ),
                ListTile(
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                      _handleMenuButtonPressed();
                    });
                  },
                  leading: const Icon(Icons.home),
                  title: const Text('Orders'),
                ),
              ],
            )),
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          leading: IconButton(
            onPressed: _handleMenuButtonPressed,
            icon: ValueListenableBuilder<AdvancedDrawerValue>(
              valueListenable: _advancedDrawerController,
              builder: (context, value, child) {
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Icon(
                    value.visible ? Icons.clear : Icons.menu,
                    key: ValueKey<bool>(value.visible),
                  ),
                );
              },
            ),
          ),
        ),
        body: screens[selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            backgroundColor: AppColor.backgroundColor,
            currentIndex: selectedTab,
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
            items: bottomItems),
      ),
    );
  }
}
