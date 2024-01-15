import 'package:equatable/equatable.dart';
import 'package:finjan/features/auth/domain/usecase/get_user_current_uuid.dart';
import 'package:finjan/features/home/presentation/screens/home.dart';
import 'package:finjan/features/orders/presentation/screens/orders.dart';
import 'package:finjan/features/profile/presentation/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_cubit_state.dart';

class LayoutCubitCubit extends Cubit<LayoutCubitState> {
  LayoutCubitCubit({required this.getUserCurrentUidUsecase})
      : super(LayoutCubitInitial());
  GetUserCurrentUidUsecase getUserCurrentUidUsecase;
  static LayoutCubitCubit get(context) => BlocProvider.of(context);
    List<BottomNavigationBarItem> bottomItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Order'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
    // const BottomNavigationBarItem(
    //     icon: Icon(Icons.settings), label: 'settings'),
  ];
  Future<void> selectedScreen2(int index) async {
    if (index == 1) {
      try {
        String uid = await getUserCurrentUidUsecase.call();
        screens[index] = OrdersScreen(uid: uid);
      } catch (error) {
        debugPrint("error:$error");
      }
    }
  }

  List<Widget> screens = [
    HomeScreen(
      name: '',
      uid: '',
    ),
    OrdersScreen(uid: 'uid'),
    const ProfileScreen(),
  ];
  int selectedTab = 0;
  selectedScreen(int index) {
    selectedTab = index;
  }
}
