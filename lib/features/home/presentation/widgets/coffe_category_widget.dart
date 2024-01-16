import 'package:finjan/core/utils/appcolor.dart';
import 'package:flutter/material.dart';

class CategoryCoffeWidget extends StatelessWidget {
  const CategoryCoffeWidget({super.key, required this.imageUrl,required this.name});
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 130,
            height: 140,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 7,
                  width: 90,
                  height: 90,
                  child: Image.network(imageUrl),
                ),
                const SizedBox(height: 20),
                Positioned(
                    left: 7,
                    top: 106,
                    child:  Text(
                      name,
                      style:const  TextStyle(
                          color: AppColor.backgroundColor, fontSize: 18),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
