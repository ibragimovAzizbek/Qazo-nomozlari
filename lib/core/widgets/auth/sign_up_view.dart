import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qazonomozlar/core/constants/colors/color_const.dart';
import 'package:qazonomozlar/extensions/mq_extension.dart';
import 'package:qazonomozlar/views/auth/cubit/auth_cubit.dart';

class SignUpBody extends StatelessWidget {
  SignUpBody({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.w * 0.03),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: context.h * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'register'.tr(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SvgPicture.asset('assets/icons/Vector.svg')
                ],
              ),
              SizedBox(height: context.h * 0.04),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('name'.tr()),
                    SizedBox(height: context.h * 0.01),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      controller: context.watch<AuthCubit>().nameController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'enterName'.tr()),
                      validator: (name) {
                        if (name!.isEmpty) {
                          return "Ism kiritilishi shart";
                        }
                      },
                    ),
                    SizedBox(height: context.h * 0.04),
                    Text('email'.tr()),
                    SizedBox(height: context.h * 0.01),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      controller: context.watch<AuthCubit>().emailController,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.email),
                          hintText: 'enterEmail'.tr()),
                      validator: (email) {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(email!)) {
                          return "Email kiritilmagan yoki xato";
                        }
                      },
                    ),
                    SizedBox(height: context.h * 0.04),
                    Text('createPass'.tr()),
                    SizedBox(height: context.h * 0.01),
                    TextFormField(
                      obscureText: context.watch<AuthCubit>().isHidden,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      controller: context.watch<AuthCubit>().passwordController,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: context.watch<AuthCubit>().isHidden
                              ? const Icon(Icons.remove_red_eye)
                              : const Icon(Icons.visibility_off_sharp),
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .changePasswrodHidden();
                          },
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        hintText: 'newPassWrite'.tr(),
                      ),
                      validator: (pass) {
                        if (pass!.length < 5) {
                          return "Password kiriting yoki password xato";
                        }
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: context.h * 0.05),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    primary: ColorConst.green100,
                    fixedSize: Size(context.w, context.h * 0.08)),
                child: Text('send'.tr(),
                    style: TextStyle(color: ColorConst.white, fontSize: 17)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await BlocProvider.of<AuthCubit>(context).registerUser();
                  }
                },
              ),
              SizedBox(height: context.h * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: context.w * 0.3,
                    child: const Divider(),
                  ),
                  Text('or'.tr(),
                      style: TextStyle(color: ColorConst.darkForText)),
                  SizedBox(
                    width: context.w * 0.3,
                    child: const Divider(),
                  ),
                ],
              ),
              SizedBox(height: context.h * 0.06),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  otherWithSignUp(
                    context,
                    iconPath: 'assets/icons/google_icon.svg',
                    name: "Google",
                    index: 1,
                  ),
                  otherWithSignUp(
                    context,
                    iconPath: 'assets/icons/fb_icon.svg',
                    name: "Facebook",
                    index: 2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector otherWithSignUp(BuildContext context,
      {required String iconPath, required String name, required int index}) {
    return GestureDetector(
      child: Container(
        height: context.h * 0.08,
        width: context.w * 0.3,
        decoration: BoxDecoration(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(iconPath),
            Text(
              name,
              style: TextStyle(color: ColorConst.titleColorText, fontSize: 16),
            )
          ],
        ),
      ),
      onTap: () {
        // ? SIGN UP GOOGLE or FASEBOOK
      },
    );
  }
}
