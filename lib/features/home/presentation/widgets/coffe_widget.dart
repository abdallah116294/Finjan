import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeSmallProductCard extends StatelessWidget {
  const HomeSmallProductCard(
      {super.key,
      required this.newtworkImage,
      required this.name,
      required this.grind_option,
      required this.price,
      required this.onPresed});
  final String newtworkImage;
  final String name;
  final String grind_option;
  final int price;
  final VoidCallback onPresed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 143.w,
          height: 144.h,
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
          child: Stack(
            children: [
              Positioned(
                left: 7.w,
                top: 7.h,
                child: SizedBox(
                  width: 129.w,
                  height: 99.h,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0.w,
                        top: 0.h,
                        child: Container(
                          width: 129.w,
                          height: 99.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(newtworkImage),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 90.w,
                        top: 6.h,
                        child: Container(
                          width: 33.w,
                          height: 16.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF835F45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                left: 0.w,
                                top: -2.h,
                                child: Container(
                                  width: 8.w,
                                  height: 8.h,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                               Positioned(
                                left: 7.w,
                                top: 8.h,
                                //top: ,
                                child: Center(
                                  child: Text(
                                    '4.9⭐',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontFamily: 'Lato',
                                      fontWeight: FontWeight.w300,
                                      height: 0.19,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 7.w,
                top: 106.h,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w400,
                    height: 0.09,
                  ),
                ),
              ),
              // Positioned(
              //   left: 7,
              //   top: 127,
              //   child: Text(
              //     grind_option,
              //     textAlign: TextAlign.center,
              //     style: const TextStyle(
              //       color: Colors.black,
              //       fontSize: 6,
              //       fontFamily: 'Lato',
              //       fontWeight: FontWeight.w400,
              //       height: 0.33,
              //     ),
              //   ),
              // ),
              Positioned(
                left: 8.w,
                top: 130.h,
                child: Text(
                  '${price}\$',
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                  ),
                ),
              ),
              Positioned(
                left: 106.w,
                top: 108.h,
                child: InkWell(
                  onTap: () {
                    onPresed();
                  },
                  child: Container(
                    width: 30.h,
                    height: 30.w,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF835F45),
                      shape: OvalBorder(),
                    ),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              // Positioned(
              //   left: 115,
              //   top: 135,
              //   child: Container(
              //     width: 12.22,
              //     height: 11,
              //     child: const Stack(children: [

              //     ]),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
