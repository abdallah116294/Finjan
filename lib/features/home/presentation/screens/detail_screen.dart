import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/auth/presentation/widgets/custom_button.dart';
import 'package:finjan/features/home/domain/entity/card_entity.dart';
import 'package:finjan/features/home/presentation/cubit/add_card_cubit.dart';
import 'package:finjan/features/home/presentation/widgets/subtitle_widget.dart';
import 'package:finjan/features/home/presentation/widgets/titles_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  Color borderColor = const Color(0xFFD17742);
  bool isClicked = false;
  bool isClickedS = false;
  bool isClickedM = false;
  bool isClickedL = false;
  String slecetedSize = '';
  void sizeSelected(String size) {
    setState(() {
      slecetedSize = size;
    });
  }

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
              centerTitle: true,
              backgroundColor: AppColor.backgroundColor,
              title: Text(
                widget.coffeeName,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  FancyShimmerImage(
                    imageUrl: widget.imageUrl.toString(),
                    height: size.height * .38,
                    width: double.infinity,
                    errorWidget: Container(),
                  ),
                  SizedBox(
                    height: 10.h,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              sizeSelected("S");
                              debugPrint(slecetedSize);
                              setState(() {
                                isClickedS = !isClickedS;
                                if (isClickedL == true) {
                                 
                                   isClickedL = !isClickedL;
                                }else if(isClickedM==true){
                                   isClickedM = !isClickedM;
                                }
                              });
                            },
                            child: ChooseSizeWidget(
                              isClicked: isClickedS,
                              borderColor: borderColor,
                              sizType: "S",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              sizeSelected("M");
                              debugPrint(slecetedSize);
                              setState(() {
                                isClickedM = !isClickedM;
                                    if (isClickedL == true) {
                                 
                                   isClickedL = !isClickedL;
                                }else if(isClickedS==true){
                                   isClickedS = !isClickedS;
                                }
                              });
                            },
                            child: ChooseSizeWidget(
                              isClicked: isClickedM,
                              borderColor: borderColor,
                              sizType: "M",
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              sizeSelected("L");
                              debugPrint(slecetedSize);
                              setState(() {
                                isClickedL = !isClickedL;
                                    if (isClickedM == true) {
                                 
                                   isClickedM = !isClickedM;
                                }else if(isClickedS==true){
                                   isClickedS = !isClickedS;
                                }
                              });
                            },
                            child: ChooseSizeWidget(
                              isClicked: isClickedL,
                              borderColor: borderColor,
                              sizType: "L",
                            ),
                          )
                        ]),
                  ),
                   CustomButton(color: borderColor,action: "ADD",style:  TextStyle(color: Colors.white,fontSize: 22.sp),width: 150,onPressed: (){
                                                 debugPrint(slecetedSize);
                            BlocProvider.of<AddCardCubit>(context)
                                .addCard(
                                    cardEntity: CardEntity(
                                        cardId: "",
                                        cardImage: widget.imageUrl,
                                        cardName: widget.coffeeName,
                                        cardPrice: widget.coffePrice,
                                        uid: widget.uid,
                                        size: slecetedSize))
                                .then((value) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Done')));
                            });
                   },)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ChooseSizeWidget extends StatelessWidget {
  const ChooseSizeWidget({
    super.key,
    required this.isClicked,
    required this.borderColor,
    required this.sizType,
  });

  final bool isClicked;
  final Color borderColor;
  final String sizType;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 91,
      height: 36,
      decoration: ShapeDecoration(
        shadows : [
              BoxShadow(
                color:isClicked? Color(0x3F000000):Colors.white,
                blurRadius: 7,
                offset: Offset(2, 1),
                spreadRadius: 0,
              )
            ],
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
              width: 2, color: isClicked ? borderColor : Colors.black45),
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      child: Center(
          child: Text(sizType,
              style: const TextStyle(
                  color: AppColor.backgroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
    );
  }
}
