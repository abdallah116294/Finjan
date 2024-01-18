import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/auth/domain/entities/user_entity.dart';
import 'package:finjan/features/auth/presentation/cubit/cubit/sign_up_cubit.dart';
import 'package:finjan/features/auth/presentation/screens/login_screen.dart';
import 'package:finjan/features/auth/presentation/widgets/textformfieldwidget.dart';
import 'package:finjan/features/home/presentation/screens/home.dart';
import 'package:finjan/features/layout/screens/layout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:finjan/injection_container.dart' as di;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<SignUpCubit>(),
      child: BlocConsumer<SignUpCubit, SignUpState>(
        listener: (context, state) {
          if (state is UserLoading) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Loading")));
          } else if (state is UserSucess) {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) =>  LayoutScreen(uid: state.uid.toString(), name: state.userEntity.name.toString(),)));
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
                        "Register",
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
                                controller: _nameController,
                                prefixIcon: Icons.person,
                                textInputType: TextInputType.name,
                                onPresed: () {},
                                inputFiled: "Full Name",
                                isObscureText: false,
                                // onFieldSubmitted: () {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Pleas Enter Full Name ";
                                  }
                                  return null;
                                },
                              ),
                               SizedBox(
                                height: 15.h,
                              ),
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
                               SizedBox(
                                height: 15.h,
                              ),
                              CustomTextFormFiled(
                                inputFiled: 'Phone',
                                prefixIcon: Icons.phone,
                                textInputType: TextInputType.phone,
                                controller: _phoneController,
                                onPresed: () {},
                                isObscureText: false,
                                onchange: (String value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return " Pleas Enter Phone";
                                  }
                                  return null;
                                },
                              ),
                               SizedBox(
                                height: 15.h,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white
                                ),
                              //  backgroundColor: Colors.white,
                                //shape: CircleBorder(side: B),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    BlocProvider.of<SignUpCubit>(context)
                                        .submitSignUp(
                                            userEntity: UserEntity(
                                      email: _emailController.text,
                                      phonenumber: _phoneController.text,
                                      password: _passwordController.text,
                                      name: _nameController.text,
                                      uid: '',
                                      status: 'I am new User for this coffe ',
                                    ));
                                  }
                                },
                                child:  Icon(
                                  Icons.arrow_right_alt,
                                  size:32.w,
                                  color: AppColor.backgroundColor,
                                ),
                              ),
                               SizedBox(
                                height: 15.sp,
                              ),
                              Row(
                                children: [
                                   Text(
                                    'Have an account ',
                                    style: TextStyle(color: Colors.grey,fontSize: 28.sp),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginScreen()));
                                      },
                                      child:  Text('SignIn',style: TextStyle(fontSize: 24.sp),))
                                ],
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
