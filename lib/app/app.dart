import 'package:finjan/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:finjan/features/auth/presentation/cubit/register_cubit.dart';
import 'package:finjan/features/home/presentation/cubit/add_card_cubit.dart';
import 'package:finjan/features/home/presentation/cubit/cubit/coffee_category_cubit.dart';
import 'package:finjan/features/home/presentation/cubit/get_coffe_cubit.dart';
import 'package:finjan/features/home/presentation/screens/hot_category_screen.dart';
import 'package:finjan/features/home/presentation/screens/iced_category_screen.dart';
import 'package:finjan/features/layout/screens/cubit/layout_cubit_cubit.dart';
import 'package:finjan/features/layout/screens/layout_screen.dart';
import 'package:finjan/features/orders/cubit/get_cards_cubit.dart';
import 'package:finjan/features/splash/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:finjan/injection_container.dart" as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();
  static const MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => di.sl<RegisterCubit>()),
          BlocProvider(create: (context) => di.sl<LayoutCubitCubit>()),
          BlocProvider(create: (context) => di.sl<SignUpCubit>()),
          BlocProvider(
            create: (context) => di.sl<GetCoffeCubit>()..getHotCoffe(),
          ),
          BlocProvider(create: (context) => di.sl<AddCardCubit>()),
          BlocProvider(create: (context) => di.sl<GetCardsCubit>()),
          BlocProvider(
            create: (context) => di.sl<CoffeeCategoryCubit>()
              ..getHotCoffee()
              ..getIcdedCoffee(),
          )
        ],
        child: ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SplashScreen(),
            );
          },
        ));
  }
}
