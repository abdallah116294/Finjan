import 'package:card_swiper/card_swiper.dart';
import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/core/utils/assets_manager.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
import 'package:finjan/features/home/presentation/cubit/add_card_cubit.dart';
import 'package:finjan/features/home/presentation/cubit/get_coffe_cubit.dart';
import 'package:finjan/features/home/presentation/screens/hot_category_screen.dart';
import 'package:finjan/features/home/presentation/screens/detail_screen.dart';
import 'package:finjan/features/home/presentation/screens/iced_category_screen.dart';
import 'package:finjan/features/home/presentation/widgets/buy_buttom.dart';
import 'package:finjan/features/home/presentation/widgets/coffe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.name, required this.uid});
  final String name;
  final String uid;
  final _scorllController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final deviceH = MediaQuery.of(context).size.height;
    final deviceW = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.all(16.0.w),
          child: SizedBox(
            height: size.height * .24,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              child: Swiper(
                itemCount: 2,
                duration: 2000,
                autoplay: true,
                itemBuilder: (context, index) {
                  return Image.asset(
                    AssetsManager.bannersImage[index],
                    fit: BoxFit.fill,
                  );
                },
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.red, activeColor: Colors.blue)),
              ),
            ),
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const IcedCategoryScreen()));
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 7,
                    offset: Offset(2, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Lottie.asset(
                'assets/iced_coffee.json',
                width: 150,
                height: 150,
              ),
            ),
          ),
          InkWell(
            onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const HotCategoryScreen()));
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x3F000000),
                    blurRadius: 7,
                    offset: Offset(2, 1),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Lottie.asset(
                'assets/hot_coffee.json',
                width: 150,
                height: 150,
              ),
            ),
          ),
        ]),
        SizedBox(height: 10.h),
        BlocProvider(
          create: (context) => di.sl<GetCoffeCubit>()..getHotCoffe(),
          child: BlocBuilder<GetCoffeCubit, GetCoffeState>(
              builder: (context, state) {
            if (state is GetHotCoffeIsloading) {
              return const Center(
                child:
                    CircularProgressIndicator(color: AppColor.backgroundColor),
              );
            } else if (state is GetHotCoffeLoaded) {
              return Expanded(
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  //shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: state.hotCoffe!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                    coffeeName:
                                        state.hotCoffe![index].name.toString(),
                                    imageUrl: state.hotCoffe![index].imageUrl
                                        .toString(),
                                    coffePrice:
                                        state.hotCoffe![index].price!.toInt(),
                                    kind: state.hotCoffe![index].region
                                        .toString(),
                                    description: state
                                        .hotCoffe![index].description
                                        .toString(),
                                    uid: state.uuid,
                                  )));
                        },
                        child: HomeSmallProductCard(
                          price: state.hotCoffe![index].price!.toInt(),
                          grind_option:
                              state.hotCoffe![index].grindOption.toString(),
                          name: state.hotCoffe![index].name.toString(),
                          newtworkImage:
                              state.hotCoffe![index].imageUrl.toString(),
                          onPresed: () {
                            BlocProvider.of<AddCardCubit>(context)
                                .addCard(
                                    cardEntity: CardEntity(
                                        cardId: "",
                                        cardImage: state
                                            .hotCoffe![index].imageUrl
                                            .toString(),
                                        cardName: state.hotCoffe![index].name
                                            .toString(),
                                        cardPrice: state.hotCoffe![index].price!
                                            .toInt(),
                                        uid: state.uuid))
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      '${state.hotCoffe![index].name} add to cart')));
                            });
                          },
                        ));
                  },
                ),
              );
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