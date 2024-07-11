import 'package:appointement_booking_app/core/routing/routes.dart';
import 'package:appointement_booking_app/core/theming/colors.dart';
import 'package:appointement_booking_app/core/theming/styles.dart';
import 'package:appointement_booking_app/features/login/presentaion/logic/login_cubit/login_cubit.dart';
import 'package:appointement_booking_app/features/login/presentaion/logic/login_cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginBlocListnner extends StatelessWidget {
  const LoginBlocListnner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LogincubitCubit, LogincubitState>(
      listenWhen: (previos, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                ));
              },
            );
          },
          success: (data) {
            GoRouter.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("${data.message}"),
                backgroundColor: ColorsManager.mainBlue,
              ),
            );
            GoRouter.of(context).pop();
            GoRouter.of(context).push(Routes.homeScreen);
          },
          error: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, String error) {
    GoRouter.of(context).pop();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: const Icon(
            Icons.error,
            color: Colors.red,
          ),
          title: Text(
            error,
            style: TextStyles.font15DarkBlueMedium,
          ),
          content: Text(error.toString()),
          actions: [
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text(
                "Got It",
                style: TextStyles.font14BlueSemiBold,
              ),
            )
          ],
        );
      },
    );
  }
}
