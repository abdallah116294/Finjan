import 'package:finjan/core/utils/appcolor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCoffeWidget extends StatelessWidget {
  const CategoryCoffeWidget({super.key, required this.imageUrl,required this.name});
  final String imageUrl;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.w),
      child: Column(
        children: [
          Container(
            width: 130.w,
            height: 140.h,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 20.w,
                  top: 7.h,
                  width: 90.w,
                  height: 90.h,
                  child: Image.network(imageUrl),
                ),
                 SizedBox(height: 20.h),
                Positioned(
                    left: 7.w,
                    top: 106.h,
                    child:  Text(
                      name,
                      style:  TextStyle(
                          color: AppColor.backgroundColor, fontSize: 18.sp),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
