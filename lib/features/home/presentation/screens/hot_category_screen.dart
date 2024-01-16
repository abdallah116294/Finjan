import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/home/presentation/cubit/cubit/coffee_category_cubit.dart';
import 'package:finjan/features/home/presentation/widgets/coffe_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;

class HotCategoryScreen extends StatelessWidget {
  const HotCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<CoffeeCategoryCubit>()..getHotCoffee(),
      child: BlocBuilder<CoffeeCategoryCubit, CoffeeCategoryState>(
          builder: (context, state) {
            if(state is CoffeeCategoryLoading){
              return const Scaffold(
          body: Center(child: CircularProgressIndicator(),),
        );
            }else if (state is CoffeeCategorySucces){
              return Scaffold(
                appBar: AppBar(

                  backgroundColor: AppColor.backgroundColor,
                  centerTitle: true,
                  title:const  Text("Iced Coffe "),
                ),
      body: Column(
        children: [
          const SizedBox(height: 22,),
          const Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Finjan your Best Place ',
                style: TextStyle(
                    color: AppColor.backgroundColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
          ),
         const  SizedBox(height: 15,),
          Expanded(
              child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage('assets/image.jpg'), fit: BoxFit.cover)),
            child: Column(children: [
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: state.coffeCategory.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // crossAxisSpacing: 2,
                      // mainAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return   CategoryCoffeWidget(imageUrl: state.coffeCategory[index].image.toString(), name: state.coffeCategory[index].title.toString(),);
                    }),
              )
            ]),
          ))
        ],
      ),
    );
            }else if(state is CoffeeCategoryError){
              const Scaffold(
          body: Center(child: Text("error"),),
        );
            }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator(),),
        );
      }),
    );
  }
}
