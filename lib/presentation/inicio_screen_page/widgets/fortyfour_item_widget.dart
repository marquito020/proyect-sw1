import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class FortyfourItemWidget extends StatelessWidget {
  FortyfourItemWidget({
    Key? key,
    this.onTapFisica,
  }) : super(
          key: key,
        );

  VoidCallback? onTapFisica;

  @override
  Widget build(BuildContext context) {
    return CustomElevatedButton(
      width: 172.h,
      text: "Fisica",
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientIndigoToPrimaryDecoration,
      onPressed: () {
        onTapFisica!.call();
      },
    );
  }
}
