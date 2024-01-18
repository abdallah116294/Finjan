import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:finjan/features/auth/presentation/widgets/custom_button.dart';
import 'package:finjan/features/auth/presentation/widgets/textformfieldwidget.dart';
import 'package:finjan/features/layout/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.email, required this.password});
  final String email;
  final String password;
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController.text = widget.email;
    _passwordController.text = widget.password;
  }

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
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => LayoutScreen(
                      uid: state.uid,
                      name: state.userEntity.name.toString(),
                    )));
          } else if (state is UserFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error.toString())));
          }
        },
        builder: (context, state) {
          return Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover)),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black12, Colors.black87])),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                ),
                body: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.all(8.0.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: DefaultTextStyle(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.bold),
                                child: const Text('Finjan|فنجان')),
                          ),
                          Text(
                            "SignIn",
                            style: TextStyle(
                                color: Colors.white,
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
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Pleas Enter Password ";
                                      }
                                      return null;
                                    },
                                  ),
                                  SizedBox(height: 15.h,),
                                  CustomButton(
                                    color: Colors.white,
                                    action: "Login",
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        BlocProvider.of<SignUpCubit>(context)
                                            .submitSignIn(
                                                userEntity: UserEntity(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text));
                                      }
                                    },
                                    width: 150,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22.sp),
                                  )
                                ],
                              ))
                        ],
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
