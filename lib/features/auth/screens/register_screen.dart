import 'package:finjan/core/utils/appcolor.dart';
import 'package:finjan/features/auth/widgets/custom_button.dart';
import 'package:finjan/features/auth/widgets/textformfieldwidget.dart';
import 'package:flutter/material.dart';
class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(  
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: DefaultTextStyle(
                    style: TextStyle(
                        color: AppColor.backgroundColor,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                    child: Text('Finjan|فنجان')),
              ),
              const Text(
                "Register",
                style: TextStyle(
                    color: AppColor.backgroundColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormFiled(
                       controller:_nameController ,
                        prefixIcon: Icons.person,
                        textInputType: TextInputType.name,
                       onPresed: (){},
                       inputFiled:"Full Name" ,
                       isObscureText: false,
                        // onFieldSubmitted: () {},
                        validator: ( value) {
                          if (value!.isEmpty) {
                            return "Pleas Enter Full Name ";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormFiled(
                        inputFiled: 'Email',
                        controller:_emailController ,
                        onPresed: (){},
                        isObscureText: false,
                        onchange: (String value){},
                        prefixIcon: Icons.email,
                        textInputType: TextInputType.emailAddress,
                        validator: ( value) {
                          if (value!.isEmpty) {
                            return "Pleas Enter Email";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormFiled(
                        inputFiled: 'Password',
                        onPresed: (){},
                        controller: _passwordController,
                        onchange: (String value){},
                        isObscureText: true,
                        prefixIcon: Icons.lock,
                        textInputType: TextInputType.visiblePassword,
                        validator: ( value) {
                          if (value !.isEmpty) {
                            return "Pleas Enter Password ";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormFiled(
                        inputFiled: 'Phone',
                        prefixIcon: Icons.phone,
                        textInputType: TextInputType.phone,
                        controller: _phoneController,
                        onPresed: (){},
                        isObscureText: false,
                        onchange: (String value){},
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Pleas Enter Phone";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
          
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        onPressed: () {
                          if(_formKey.currentState!.validate()){
                          }
                        },
                        child: const Icon(
                          Icons.arrow_right_alt,
                          size: 32,
                          color: AppColor.backgroundColor,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
