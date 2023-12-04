import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';

class ContenidoItemScreen extends StatelessWidget {
  const ContenidoItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 23.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Titulo", style: theme.textTheme.headlineMedium),
                        SizedBox(height: 15.v),
                        _buildFortyThree(context),
                        SizedBox(height: 14.v),
                        Text("Dollar goes up 21.3%",
                            style: theme.textTheme.headlineSmall),
                        SizedBox(height: 9.v),
                        Container(
                            width: 328.h,
                            margin: EdgeInsets.only(right: 18.h),
                            child: Text(
                                "Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up, Dollar goes up,",
                                maxLines: 30,
                                overflow: TextOverflow.ellipsis,
                                style: CustomTextStyles.labelLargeBluegray400)),
                        SizedBox(height: 5.v)
                      ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 103.h,
        leading: Container(
            margin: EdgeInsets.only(left: 40.h, top: 10.v, bottom: 11.v),
            padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 5.v),
            decoration: AppDecoration.fillBlack
                .copyWith(borderRadius: BorderRadiusStyle.circleBorder17),
            child: AppbarImage(
                imagePath: ImageConstant.imgArrowLeft,
                margin: EdgeInsets.only(right: 1.h),
                onTap: () {
                  onTapArrowLeft(context);
                })),
        title: AppbarTitle(text: "Física", margin: EdgeInsets.only(left: 21.h)),
        actions: [
          Container(
              margin: EdgeInsets.fromLTRB(23.h, 10.v, 23.h, 11.v),
              padding: EdgeInsets.symmetric(horizontal: 19.h, vertical: 5.v),
              decoration: AppDecoration.fillBlack
                  .copyWith(borderRadius: BorderRadiusStyle.circleBorder17),
              child: AppbarImage(
                  imagePath: ImageConstant.imgArrowToTop,
                  margin: EdgeInsets.only(right: 1.h)))
        ]);
  }

  /// Section Widget
  Widget _buildFortyThree(BuildContext context) {
    return Container(
        decoration: AppDecoration.fillGray
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder27),
        child: CustomImageView(
            imagePath: ImageConstant.imgRectangle203,
            height: 213.v,
            width: 347.h,
            radius: BorderRadius.circular(25.h)));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
