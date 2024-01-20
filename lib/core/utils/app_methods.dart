import 'package:finjan/features/home/presentation/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppMethods {
 static Future<void> dailogAlert(
      {required BuildContext context,
      required String imagePathe,
      required String title,
      required Function fun}) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).dialogBackgroundColor,
            content: Column(mainAxisSize: MainAxisSize.min, children: [
              Image.asset(
                imagePathe,
                height: 60.h,
                width: 60.w,
              ),
              const SizedBox(
                height: 16,
              ),
              SubtitleTextWidget(label: title),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child:  Text(
                        "cancel",
                        style: TextStyle(color: Colors.red, fontSize: 20.sp),
                      )),
                   SizedBox(height: 18.h),
                  TextButton(
                      onPressed: () {
                        fun();
                      },
                      child:  Text(
                        "Ok",
                        style: TextStyle(color: Colors.blue, fontSize: 20.sp),
                      )),
                ],
              )
            ]),
          );
        });
  }
}