import 'package:appointement_booking_app/core/helpers/spacing.dart';
import 'package:appointement_booking_app/core/theming/colors.dart';
import 'package:appointement_booking_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;
  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumber,
      required this.hasMinLength});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidatedRow("At Least 1 lowercase letter", hasLowerCase),
        verticalSpace(2),
        buildValidatedRow("At Least 1 uppercase letter", hasUpperCase),
        verticalSpace(2),
        buildValidatedRow(
            "At Least 1 special character ", hasSpecialCharacters),
        verticalSpace(2),
        buildValidatedRow("At Least 1 number", hasNumber),
        verticalSpace(2),
        buildValidatedRow("At Least 8 characters long", hasMinLength),
      ],
    );
  }

  Widget buildValidatedRow(String text, bool hasValidated) {
    return Row(children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: Colors.grey,
      ),
      horizontalSpace(10),
      Text(
        text,
        style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration: hasValidated ? TextDecoration.lineThrough : null,
          decorationColor: Colors.green,
          decorationThickness: 2,
          color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
        ),
      )
    ]);
  }
}
