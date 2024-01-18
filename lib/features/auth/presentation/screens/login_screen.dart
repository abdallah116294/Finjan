import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:finjan/features/auth/presentation/widgets/textformfieldwidget.dart';
import 'package:finjan/features/layout/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is UserLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Welcom To you")));
          } else if (state is UserSucess) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LayoutScreen(uid: state.uid, name: state.userEntity.name.toString(),)));
          }else if(state is UserFailure){
            ScaffoldMessenger.of(context)
                .showSnackBar( SnackBar(content: Text(state.error.toString())));
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                  padding:  EdgeInsets.all(8.0.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Center(
                        child: DefaultTextStyle(
                            style: TextStyle(
                                color: AppColor.backgroundColor,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold),
                            child: const Text('Finjan|فنجان')),
                      ),
                       Text(
                        "SignIn",
                        style: TextStyle(
                            color: AppColor.backgroundColor,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.bold),
                      ),
                       SizedBox(
                        height: 20.h,
                      ),
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              CustomTextFormFiled(
                                inputFiled: 'Email',
                                controller: _emailController,
                                onPresed: () {},
                                isObscureText: false,
                                onchange: (String value) {},
                                prefixIcon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Pleas Enter Email";
                                  }
                                  return null;
                                },
                              ),
                               SizedBox(
                                height: 15.h,
                              ),
                              CustomTextFormFiled(
                                inputFiled: 'Password',
                                onPresed: () {},
                                controller: _passwordController,
                                onchange: (String value) {},
                                isObscureText: true,
                                prefixIcon: Icons.lock,
                                textInputType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Pleas Enter Password ";
                                  }
                                  return null;
                                },
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                                ),
                                // backgroundColor: Colors.white,
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<SignUpCubit>(context)
                                        .submitSignIn(
                                            userEntity: UserEntity(
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text));
                                  }
                                },
                                child:  Icon(
                                  Icons.arrow_right_alt,
                                  size: 32.w,
                                  color: AppColor.backgroundColor,
                                ),
                              )
                            ],
                          ))
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
