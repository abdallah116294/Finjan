import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:finjan/core/utils/app_methods.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
import 'package:finjan/features/home/presentation/widgets/subtitle_widget.dart';
import 'package:finjan/features/home/presentation/widgets/titles_widget.dart';
import 'package:finjan/features/orders/cubit/get_cards_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartWidget extends StatefulWidget {
  CartWidget(
      {super.key,
      required this.coffeeImage,
      required this.coffeeName,
      required this.coffePrice,
      //required this.ontap,
      required this.cardEntity,
      required this.uid});

  final String coffeeImage;
  final String coffeeName;
  final int coffePrice;
  //final VoidCallback ontap;
  final CardEntity cardEntity;
  final String uid;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => di.sl<GetCardsCubit>(),
      child: BlocBuilder<GetCardsCubit, GetCardsState>(
        builder: (context, state) {
          return FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FancyShimmerImage(
                        imageUrl: widget.coffeeImage,
                        height: size.height * 0.2,
                        width: size.width * 0.4,
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: size.width * 0.6,
                                  child: TitlesTextWidget(
                                    label: widget.coffeeName,
                                    maxLines: 2,
                                  )),
                              Column(
                                children: [
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              SubtitleTextWidget(
                                label: '${widget.coffePrice}\$',
                                color: Colors.blue,
                                fontSize: 16,
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
