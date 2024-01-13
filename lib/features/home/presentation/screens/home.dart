import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/home/presentation/cubit/get_coffe_cubit.dart';
import 'package:finjan/features/home/presentation/widgets/coffe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key, required this.name});
  final String name;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    return Column(
      children: [
        BlocProvider(
          create: (context) => di.sl<GetCoffeCubit>()..getHotCoffe(),
          child: BlocBuilder<GetCoffeCubit, GetCoffeState>(
              builder: (context, state) {
            if (state is GetHotCoffeIsloading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColor.backgroundColor),
              );
            } else if (state is GetHotCoffeLoaded) {
              
            } else if (state is GetHotCoffeError) {
              return Text(
                state.error.toString(),
                style: const TextStyle(color: AppColor.error),
              );
            }
            return const Center(
              child: CircularProgressIndicator(color: AppColor.backgroundColor),
            );
          }),
        ),
      ],
    );
  }
}
// 