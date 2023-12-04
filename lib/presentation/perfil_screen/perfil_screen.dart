import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 31.h),
                child: Column(children: [
                  Text("Your Profile Information",
                      style: CustomTextStyles.titleMediumBluegray400),
                  SizedBox(height: 31.v),
                  CustomImageView(
                      imagePath: ImageConstant.img57,
                      height: 134.adaptSize,
                      width: 134.adaptSize,
                      radius: BorderRadius.circular(64.h)),
                  SizedBox(height: 33.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                          opacity: 0.8,
                          child: Text("Informacion Personal",
                              style:
                                  CustomTextStyles.titleMediumBlack900Bold))),
                  SizedBox(height: 20.v),
                  _buildUsername(context,
                      nombre: "ID", aryanStirkTwo: "3024982387"),
                  SizedBox(height: 6.v),
                  _buildUsername(context,
                      nombre: "Nombre", aryanStirkTwo: "Aryan.Stirk2"),
                  SizedBox(height: 6.v),
                  _buildUsername(context,
                      nombre: "Email",
                      aryanStirkTwo: "aryan.stirk2nd@gmail.com"),
                  SizedBox(height: 6.v),
                  _buildUsername(context,
                      nombre: "Celular", aryanStirkTwo: "+620932938232"),
                  SizedBox(height: 6.v),
                  _buildUsername(context,
                      nombre: "Fecha Nacimiento", aryanStirkTwo: "2000/07/20"),
                  SizedBox(height: 5.v)
                ]))));
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
            AppbarTitle(text: "Perfil", margin: EdgeInsets.only(left: 21.h)));
  }

  /// Common widget
  Widget _buildUsername(
    BuildContext context, {
    required String nombre,
    required String aryanStirkTwo,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 9.v),
        decoration: AppDecoration.fillGray100
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder11),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 1.v),
              child: Text(nombre,
                  style: theme.textTheme.labelLarge!
                      .copyWith(color: appTheme.black900))),
          Opacity(
              opacity: 0.4,
              child: Padding(
                  padding: EdgeInsets.only(top: 1.v),
                  child: Text(aryanStirkTwo,
                      style: CustomTextStyles.bodySmallPrimaryContainer
                          .copyWith(
                              color: theme.colorScheme.primaryContainer))))
        ]));
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
