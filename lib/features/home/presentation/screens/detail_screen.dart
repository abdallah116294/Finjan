import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
import 'package:finjan/features/home/presentation/cubit/add_card_cubit.dart';
import 'package:finjan/features/home/presentation/widgets/subtitle_widget.dart';
import 'package:finjan/features/home/presentation/widgets/titles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;

class DetailScreen extends StatefulWidget {
  DetailScreen(
      {super.key,
      required this.coffeeName,
      required this.imageUrl,
      required this.coffePrice,
      required this.kind,
      required this.description,
      required this.uid});
  final String coffeeName;
  final String imageUrl;
  final int coffePrice;
  final String kind;
  final String description;
  final String uid;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => di.sl<AddCardCubit>(),
      child: BlocConsumer<AddCardCubit, AddCardState>(
        listener: (context, state) {
          if (state is AddCardLoading) {
            // uid = state.uuid;
            debugPrint(state.uuid);
            //debugPrint(uid);
            debugPrint(widget.uid);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            )));
          } else if (state is AddCardSuccess) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Done')));
          } else if (state is AddCardError) {
            debugPrint(state.error);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error.toString())));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.backgroundColor,
              title: Text(
                widget.coffeeName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            body: Column(
              children: [
                FancyShimmerImage(
                  imageUrl: widget.imageUrl.toString(),
                  height: size.height * .38,
                  width: double.infinity,
                  errorWidget: Container(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text(
                        widget.coffeeName,
                        maxLines: 2,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      )),
                      SubtitleTextWidget(
                        label: "${widget.coffePrice}\$",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: AppColor.backgroundColor,
                      )
                    ],
                  ),
                ),
                //heart widgt
                //details widget
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TitlesTextWidget(label: "Details"),
                      SubtitleTextWidget(
                        label: widget.kind,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                BlocProvider.of<AddCardCubit>(context)
                    .addCard(
                        cardEntity: CardEntity(
                            cardId: "",
                            cardImage: widget.imageUrl,
                            cardName: widget.coffeeName,
                            cardPrice: widget.coffePrice,
                            uid: widget.uid))
                    .then((value) {
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text('Done')));
                });
              },
              backgroundColor: AppColor.backgroundColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
