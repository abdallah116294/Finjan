import 'package:finjan/features/home/presentation/widgets/subtitle_widget.dart';
import 'package:flutter/material.dart';

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
              Image.network(
                imagePathe,
                height: 60,
                width: 60,
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
                      child: const Text(
                        "cancel",
                        style: TextStyle(color: Colors.red, fontSize: 20),
                      )),
                  const SizedBox(height: 18),
                  TextButton(
                      onPressed: () {
                        fun();
                      },
                      child: const Text(
                        "Ok",
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      )),
                ],
              )
            ]),
          );
        });
  }
}