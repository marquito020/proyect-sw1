import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:marco_david_s_application3/widgets/custom_icon_button.dart';

class ContenidoListQuimicaScreen extends StatelessWidget {
  const ContenidoListQuimicaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 10.v),
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 17.h),
                        child: Column(children: [
                          _buildImage(context),
                          SizedBox(height: 17.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildBodyContent(context)),
                          SizedBox(height: 56.v),
                          _buildImage(context),
                          SizedBox(height: 17.v),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.h),
                              child: _buildBodyContent(context)),
                          SizedBox(height: 56.v),
                          _buildImage(context),
                          SizedBox(height: 16.v),
                          _buildBodyContent3(context)
                        ]))))));
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
        title:
            AppbarTitle(text: "Quimica", margin: EdgeInsets.only(left: 21.h)));
  }

  /// Section Widget
  Widget _buildBodyContent3(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16.h),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.circleBorder20),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: Column(children: [
                Text("Card header", style: theme.textTheme.titleMedium),
                Text("This is a card description",
                    style: theme.textTheme.bodyMedium)
              ])),
              Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(8.h),
                      decoration: IconButtonStyleHelper.radiusTL20,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowRight)))
            ]));
  }

  /// Common widget
  Widget _buildImage(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.circleBorder20),
        child: Container(
            height: 199.v,
            width: 358.h,
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.circleBorder20),
            child: Stack(alignment: Alignment.topRight, children: [
              CustomImageView(
                  imagePath: ImageConstant.imgImage,
                  height: 199.v,
                  width: 358.h,
                  radius: BorderRadius.circular(20.h),
                  alignment: Alignment.center),
              Padding(
                  padding: EdgeInsets.only(top: 16.v, right: 16.h),
                  child: CustomIconButton(
                      height: 32.adaptSize,
                      width: 32.adaptSize,
                      padding: EdgeInsets.all(6.h),
                      alignment: Alignment.topRight,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgMoreHorizontal)))
            ])));
  }

  /// Common widget
  Widget _buildBodyContent(BuildContext context) {
    return Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.circleBorder20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Card header", style: theme.textTheme.titleMedium),
            SizedBox(height: 6.v),
            Text("This is a card description",
                style: theme.textTheme.bodyMedium)
          ]),
          CustomIconButton(
              height: 40.adaptSize,
              width: 40.adaptSize,
              padding: EdgeInsets.all(8.h),
              decoration: IconButtonStyleHelper.radiusTL20,
              child: CustomImageView(imagePath: ImageConstant.imgArrowRight))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
