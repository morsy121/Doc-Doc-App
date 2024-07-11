import 'package:appointement_booking_app/core/helpers/spacing.dart';
import 'package:appointement_booking_app/core/theming/styles.dart';
import 'package:appointement_booking_app/core/widgets/app_text_button.dart';
import 'package:appointement_booking_app/features/login/data/models/login_request_body.dart';
import 'package:appointement_booking_app/features/login/presentaion/ui/widgets/email_and_password.dart';
import 'package:appointement_booking_app/features/login/presentaion/ui/widgets/terms_and_condition_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../logic/login_cubit/login_cubit.dart';
import 'widgets/dont_have_any_account.dart';
import 'widgets/login_bloc_lisner.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Form(
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
                    const EmailAndPassword(),
                    verticalSpace(24),
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
                      onPressed: () {
                        if (context
                            .read<LogincubitCubit>()
                            .formkey
                            .currentState!
                            .validate()) {
                          context.read<LogincubitCubit>().emitLoginStates(
                                LoginRequestBody(
                                    email: context
                                        .read<LogincubitCubit>()
                                        .emailController
                                        .text,
                                    password: context
                                        .read<LogincubitCubit>()
                                        .passwordController
                                        .text),
                              );
                        }
                      },
                      textStyle: TextStyles.font16WhiteMedium,
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(16),
                    const DontHaveAccountText(),
                    const LoginBlocListnner(),
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

// void validateThemLogin(BuildContext context) {
//   if (context.read<LogincubitCubit>().formkey.currentState!.validate()) {
//     context.read<LogincubitCubit>().emitLoginStates(
//           LoginRequestBody(
//               email: context.read<LogincubitCubit>().emailController.text,
//               password:
//                   context.read<LogincubitCubit>().passwordController.text),
//         );
//   }
// }
