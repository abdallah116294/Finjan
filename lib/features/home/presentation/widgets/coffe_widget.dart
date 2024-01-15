import 'package:flutter/material.dart';

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
          width: 143,
          height: 144,
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
                left: 7,
                top: 7,
                child: SizedBox(
                  width: 129,
                  height: 99,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 129,
                          height: 99,
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
                        left: 90,
                        top: 6,
                        child: Container(
                          width: 33,
                          height: 16,
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
                                left: 0,
                                top: -2,
                                child: Container(
                                  width: 8,
                                  height: 8,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: const BoxDecoration(),
                                ),
                              ),
                              const Positioned(
                                left: 10,
                                top: 8,
                                //top: ,
                                child: Text(
                                  '4.9',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Lato',
                                    fontWeight: FontWeight.w300,
                                    height: 0.19,
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
                left: 7,
                top: 106,
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
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
                left: 8,
                top: 130,
                child: Text(
                  '${price}\$',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.11,
                  ),
                ),
              ),
              Positioned(
                left: 106,
                top: 108,
                child: InkWell(
                  onTap: () {
                    onPresed();
                  },
                  child: Container(
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    width: 30,
                    height: 30,
                    decoration: const ShapeDecoration(
                      color: Color(0xFF835F45),
                      shape: OvalBorder(),
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
