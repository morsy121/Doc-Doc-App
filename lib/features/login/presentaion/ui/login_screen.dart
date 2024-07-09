import 'package:appointement_booking_app/core/helpers/spacing.dart';
import 'package:appointement_booking_app/core/theming/styles.dart';
import 'package:appointement_booking_app/core/widgets/app_text_button.dart';
import 'package:appointement_booking_app/core/widgets/app_text_form_field.dart';
import 'package:appointement_booking_app/features/login/presentaion/ui/widgets/terms_and_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/dont_have_any_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formkey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last\n logged in.',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    AppTextFormField(
                      hintText: 'Email',
                      validator: (value) {},
                    ),
                    verticalSpace(10),
                    AppTextFormField(
                      isObscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(isObscureText
                            ? Icons.visibility
                            : Icons.visibility_outlined),
                      ),
                      hintText: 'Password',
                      validator: (value) {},
                    ),
                    verticalSpace(20),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Forget Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(20),
                    AppTextButton(
                      buttonText: 'Login',
                      onPressed: () {},
                      textStyle: TextStyles.font16WhiteMedium,
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(16),
                    const DontHaveAccountText()
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
