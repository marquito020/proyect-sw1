import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_fisica_screen/contenido_list_fisica_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_historia_screen/contenido_list_historia_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_literatura_screen/contenido_list_literatura_screen.dart';
import 'package:marco_david_s_application3/presentation/contenido_list_quimica_screen/contenido_list_quimica_screen.dart';
import 'package:marco_david_s_application3/presentation/perfil_screen/perfil_screen.dart';
import 'package:marco_david_s_application3/shared_preferences/user_preferences.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';

class SeccionesScreenPage extends StatefulWidget {
  const SeccionesScreenPage({Key? key}) : super(key: key);

  @override
  State<SeccionesScreenPage> createState() => _SeccionesScreenPageState();
}

class _SeccionesScreenPageState extends State<SeccionesScreenPage> {
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.errorContainer,
            appBar: _buildAppBar(context),
            body: Container(
                height: 748.v,
                width: double.maxFinite,
                decoration: AppDecoration.fillErrorContainer,
                child: Stack(alignment: Alignment.centerLeft, children: [
                  Opacity(
                      opacity: 0.05,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgBg23,
                          height: 852.v,
                          width: 260.h,
                          alignment: Alignment.centerLeft)),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                          padding: EdgeInsets.symmetric(vertical: 25.v),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                /* _buildAppBar(context), */
                                /* SizedBox(height: 52.v), */
                                Container(
                                    height: 602.v,
                                    width: 316.h,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                ImageConstant.imgGroup23),
                                            fit: BoxFit.cover)),
                                    child: Stack(
                                        alignment: Alignment.topLeft,
                                        children: [
                                          _buildNineteen(context),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      top: 146.v),
                                                  decoration: AppDecoration
                                                      .gradientPurpleToPink
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .customBorderLR20),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      onTapTwo(context);
                                                      print(
                                                          "Container clicked");
                                                    },
                                                    child: Container(
                                                        width: 286.h,
                                                        margin: EdgeInsets.only(
                                                            left: 9.h),
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 30.h,
                                                            vertical: 63.v),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .customBorderLR20,
                                                            image: DecorationImage(
                                                                image: fs.Svg(
                                                                    ImageConstant
                                                                        .imgGroup3),
                                                                fit: BoxFit
                                                                    .cover)),
                                                        child: Text("Historia",
                                                            style: theme
                                                                .textTheme
                                                                .headlineLarge)),
                                                  ))),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 146.v),
                                                  decoration: AppDecoration
                                                      .gradientPinkToOrange
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .customBorderLR20),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      onTapTwenty(context);
                                                    },
                                                    child: Container(
                                                        width: 258.h,
                                                        margin: EdgeInsets.only(
                                                            left: 9.h),
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 30.h,
                                                            vertical: 63.v),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadiusStyle
                                                                    .customBorderLR20,
                                                            image: DecorationImage(
                                                                image: fs.Svg(
                                                                    ImageConstant
                                                                        .imgGroup4),
                                                                fit: BoxFit
                                                                    .cover)),
                                                        child: Text(
                                                            "Literatura",
                                                            style: theme
                                                                .textTheme
                                                                .headlineLarge)),
                                                  ))),
                                          Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Container(
                                                  decoration: AppDecoration
                                                      .gradientOrangeAToBlueGray
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .customBorderLR20),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      onTapFour(context);
                                                    },
                                                    child: Container(
                                                        width: 232.h,
                                                        margin: EdgeInsets.only(
                                                            left: 9.h),
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: 30.h,
                                                            vertical: 62.v),
                                                        decoration: BoxDecoration(
                                                            borderRadius: BorderRadiusStyle
                                                                .customBorderLR20,
                                                            image: DecorationImage(
                                                                image: fs.Svg(ImageConstant
                                                                    .imgGroup5),
                                                                fit: BoxFit
                                                                    .cover)),
                                                        child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.end,
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [SizedBox(height: 3.v), Text("Quimica", style: theme.textTheme.headlineLarge)])),
                                                  )))
                                        ]))
                              ])))
                ]))));
  }

  /// Section Widget
  /* PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 40.v,
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgFrameOnerrorcontainer,
            margin: EdgeInsets.only(left: 20.h, top: 8.v, bottom: 8.v)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFrameOnerrorcontainer24x24,
              margin: EdgeInsets.symmetric(vertical: 8.v, horizontal: 8.v)),
          Container(
              height: 40.adaptSize,
              width: 40.adaptSize,
              margin: EdgeInsets.only(left: 18.h),
              child: Stack(alignment: Alignment.bottomRight, children: [
                CustomImageView(
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
  } */
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    /* Shared Preferences */
    final prefs = UserPreferences();
    @override
    void initState() {
      prefs.initPrefs();
      super.initState();
    }

    return CustomAppBar(
        leadingWidth: 44.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgFrameOnerrorcontainer,
            margin: EdgeInsets.only(left: 20.h, top: 16.v, bottom: 16.v)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgFrameOnerrorcontainer24x24,
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
                    /* imagePath: ImageConstant.imgUserImage, */
                    imagePath: prefs.img,
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
  Widget _buildNineteen(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            decoration: AppDecoration.gradientIndigoToPrimary
                .copyWith(borderRadius: BorderRadiusStyle.customBorderLR20),
            child: GestureDetector(
                onTap: () {
                  onTapOne(context);
                  print("Container clicked");
                },
                child: Container(
                    width: 316.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.h, vertical: 63.v),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadiusStyle.customBorderLR20,
                        image: DecorationImage(
                            image: AssetImage(ImageConstant.imgGroup2),
                            fit: BoxFit.cover)),
                    child: Text("Fisica",
                        style: theme.textTheme.headlineLarge)))));
  }

  /// Navigates to the contenidoListFisicaScreen when the action is triggered.
  onTapOne(BuildContext context) {
    /* Navigator.pushNamed(context, AppRoutes.contenidoListFisicaScreen); */
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContenidoListFisicaScreen();
    }));
  }

  /// Navigates to the contenidoListLiteraturaScreen when the action is triggered.
  onTapTwenty(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContenidoListLiteraturaScreen();
    }));
  }

  onTapTwo(BuildContext context) {
    /* Navigator.pushNamed(context, AppRoutes.contenidoListFisicaScreen); */
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContenidoListHistoriaScreen();
    }));
  }

  onTapFour(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return ContenidoListQuimicaScreen();
    }));
  }
}
