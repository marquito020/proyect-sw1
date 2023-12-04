import 'package:marco_david_s_application3/presentation/contenido_list_fisica_screen/contenido_list_fisica_screen.dart';
import 'package:marco_david_s_application3/presentation/perfil_screen/perfil_screen.dart';

import '../inicio_screen_page/widgets/fortyfive_item_widget.dart';
import '../inicio_screen_page/widgets/fortyfour_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:marco_david_s_application3/widgets/custom_elevated_button.dart';

class InicioScreenPage extends StatelessWidget {
  const InicioScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SingleChildScrollView(
              child: Container(
                  width: double.maxFinite,
                  padding:
                      EdgeInsets.symmetric(horizontal: 19.h, vertical: 5.v),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Text("Hola Rohan,",
                                style: theme.textTheme.headlineMedium)),
                        SizedBox(height: 3.v),
                        /* Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "You have ",
                                      style: theme.textTheme.bodyLarge),
                                  TextSpan(
                                      text: "4 pending test this week ",
                                      style: CustomTextStyles.titleMediumRed700)
                                ]),
                                textAlign: TextAlign.left)),
                        SizedBox(height: 26.v),
                        _buildFrame(context),
                        SizedBox(height: 28.v),
                        Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Row(children: [
                              Padding(
                                  padding: EdgeInsets.only(top: 2.v),
                                  child: Text("4 Pending tests",
                                      style: CustomTextStyles
                                          .titleMediumBlack900)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgFrameRed700,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  margin: EdgeInsets.only(left: 8.h))
                            ])),
                        SizedBox(height: 9.v),
                        _buildFortyFive(context),
                        SizedBox(height: 27.v), */
                        Padding(
                            padding: EdgeInsets.only(left: 1.h),
                            child: Text("Secciones",
                                style: CustomTextStyles.titleMediumBlack900)),
                        SizedBox(height: 9.v),
                        _buildFortyFour(context)
                      ])),
            )));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgFrame,
            margin: EdgeInsets.only(left: 20.h, top: 16.v, bottom: 16.v)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFrameBlack900,
              margin: EdgeInsets.fromLTRB(19.h, 16.v, 8.h, 8.v)),
          Container(
              height: 40.adaptSize,
              width: 40.adaptSize,
              margin: EdgeInsets.only(left: 18.h, top: 8.v, right: 27.h),
              child: Stack(alignment: Alignment.bottomRight, children: [
                CustomImageView(
                    onTap: () {
                      print("Image tapped");
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PerfilScreen();
                      }));
                    },
                    imagePath: ImageConstant.imgUserImage,
                    height: 40.adaptSize,
                    width: 40.adaptSize,
                    radius: BorderRadius.circular(20.h),
                    alignment: Alignment.center),
                CustomImageView(
                    imagePath: ImageConstant.imgCirclewavycheck,
                    height: 12.adaptSize,
                    width: 12.adaptSize,
                    alignment: Alignment.bottomRight,
                    margin: EdgeInsets.only(left: 28.h, top: 28.v))
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildTakeTestNow(BuildContext context) {
    return CustomElevatedButton(
        height: 31.v,
        width: 107.h,
        text: "Take test now",
        margin: EdgeInsets.only(top: 32.v, bottom: 26.v),
        buttonStyle: CustomButtonStyles.fillOnErrorContainer,
        buttonTextStyle: theme.textTheme.titleSmall!);
  }

  /// Section Widget
  Widget _buildFrame(BuildContext context) {
    return Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.only(left: 1.h),
        color: appTheme.indigo400,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.circleBorder20),
        child: Container(
            height: 122.v,
            width: 354.h,
            decoration: AppDecoration.fillIndigo
                .copyWith(borderRadius: BorderRadiusStyle.circleBorder20),
            child: Stack(alignment: Alignment.centerLeft, children: [
              Opacity(
                  opacity: 0.3,
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse6,
                      height: 100.v,
                      width: 239.h,
                      alignment: Alignment.bottomRight)),
              CustomImageView(
                  imagePath: ImageConstant.imgEllipse6122x233,
                  height: 122.v,
                  width: 233.h,
                  alignment: Alignment.centerLeft),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(19.h, 14.v, 19.h, 17.v),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(children: [
                                    Text("300",
                                        style: theme.textTheme.displayMedium),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            top: 24.v, bottom: 5.v),
                                        child: Text("Points",
                                            style: CustomTextStyles
                                                .bodyMediumOnErrorContainer))
                                  ]),
                                  SizedBox(height: 3.v),
                                  SizedBox(
                                      width: 179.h,
                                      child: Text(
                                          "Cross 500 within the week to get a free One on One Class.",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: CustomTextStyles
                                              .bodyMediumOnErrorContainer
                                              .copyWith(height: 1.36)))
                                ]),
                            _buildTakeTestNow(context)
                          ])))
            ])));
  }

  /// Section Widget
  Widget _buildFortyFive(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 89.v,
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) {
              return FortyfiveItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildFortyFour(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 1.h),
        child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 63.v,
                crossAxisCount: 2,
                mainAxisSpacing: 10.h,
                crossAxisSpacing: 10.h),
            physics: NeverScrollableScrollPhysics(),
            itemCount: 8,
            itemBuilder: (context, index) {
              return FortyfourItemWidget(onTapFisica: () {
                onTapFisica(context);
              });
            }));
  }

  /// Navigates to the contenidoListQuimicaScreen when the action is triggered.
  onTapFisica(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContenidoListFisicaScreen();
    }));
  }
}
