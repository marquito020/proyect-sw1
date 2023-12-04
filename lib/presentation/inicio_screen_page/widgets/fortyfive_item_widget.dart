import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class FortyfiveItemWidget extends StatelessWidget {
  const FortyfiveItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 19.v,
      ),
      decoration: AppDecoration.fillOnErrorContainer.copyWith(
        borderRadius: BorderRadiusStyle.circleBorder20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Law of Motion",
            style: CustomTextStyles.titleMediumBlack900,
          ),
          SizedBox(height: 4.v),
          Row(
            children: [
              Container(
                width: 54.h,
                padding: EdgeInsets.symmetric(
                  horizontal: 6.h,
                  vertical: 2.v,
                ),
                decoration: AppDecoration.fillPurple.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder11,
                ),
                child: Text(
                  "Physics",
                  style: CustomTextStyles.bodySmallPurpleA200,
                ),
              ),
              CustomImageView(
                imagePath: ImageConstant.imgFrameRed70014x14,
                height: 14.adaptSize,
                width: 14.adaptSize,
                margin: EdgeInsets.only(
                  left: 6.h,
                  top: 4.v,
                  bottom: 4.v,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 2.h,
                  top: 2.v,
                  bottom: 2.v,
                ),
                child: Text(
                  "1d:10Hr",
                  style: CustomTextStyles.bodyMediumRed700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
