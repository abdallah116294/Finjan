
import 'package:finjan/core/utils/appcolor.dart';
import 'package:flutter/material.dart';
class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled(
      {Key? key,
      this.isObscureText,
      this.inputFiled,
      this.prefixIcon,
      this.validator,
      this.textInputType,
      required this.controller,
      this.onchange, required this.onPresed})
      : super(key: key);
  final bool? isObscureText;
  final String? inputFiled;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final TextEditingController controller;
  final Function(String)? onchange;
  final GestureTapCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: onPresed,
      style: const TextStyle(color: AppColor.backgroundColor),
      onChanged: onchange,
      obscureText: isObscureText!,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.error)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.backgroundColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.backgroundColor)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: AppColor.backgroundColor)),
        contentPadding:const  EdgeInsets.symmetric(vertical: 10,horizontal: 10),

          label: Text('$inputFiled'),
          prefixIcon: Icon(prefixIcon,color: AppColor.backgroundColor),
          ),
    );
  }
}