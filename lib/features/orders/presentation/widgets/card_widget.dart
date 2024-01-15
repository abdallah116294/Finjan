
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:finjan/features/home/presentation/widgets/subtitle_widget.dart';
import 'package:finjan/features/home/presentation/widgets/titles_widget.dart';
import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  CartWidget({super.key, required this.coffeeImage, required this.coffeeName,required this.coffePrice});

  final String coffeeImage;
  final String coffeeName;
  final int coffePrice;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FittedBox(
      child: IntrinsicWidth(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  imageUrl: coffeeImage,
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
                              label: coffeeName,
                              maxLines: 2,
                            )),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () async {},
                                icon: const Icon(
                                  Icons.clear,
                                  color: Colors.red,
                                )),
                            // HeartButtonWidget(
                            //   productId: getCurrentProduct.productId,
                            // ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      children: [
                        SubtitleTextWidget(
                          label: '${coffePrice}\$',
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
  }
}
