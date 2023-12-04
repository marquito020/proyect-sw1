import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_leading_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_trailing_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:marco_david_s_application3/widgets/custom_drop_down.dart';
import 'package:marco_david_s_application3/widgets/custom_elevated_button.dart';
import 'package:marco_david_s_application3/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ContenidoCrearScreenPage extends StatelessWidget {
  ContenidoCrearScreenPage({Key? key}) : super(key: key);

  TextEditingController tituloController = TextEditingController();

  TextEditingController descripcionController = TextEditingController();

  TextEditingController subseccionesController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 3.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Crear contenido",
                          style: theme.textTheme.headlineMedium)),
                  SizedBox(height: 28.v),
                  _buildTitulo(context),
                  SizedBox(height: 28.v),
                  _buildDescripcion(context),
                  SizedBox(height: 28.v),
                  _buildSubsecciones(context),
                  SizedBox(height: 28.v),
                  CustomDropDown(
                      icon: Container(
                          margin: EdgeInsets.fromLTRB(30.h, 11.v, 18.h, 12.v),
                          child: CustomImageView(
                              imagePath: ImageConstant.imgArrowdown,
                              height: 20.adaptSize,
                              width: 20.adaptSize)),
                      hintText: "Sección",
                      items: dropdownItemList,
                      onChanged: (value) {}),
                  SizedBox(height: 28.v),
                  _buildCrear(context),
                  SizedBox(height: 5.v)
                ]))));
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
  Widget _buildTitulo(BuildContext context) {
    return CustomTextFormField(
        controller: tituloController, hintText: "Titulo");
  }

  /// Section Widget
  Widget _buildDescripcion(BuildContext context) {
    return CustomTextFormField(
        controller: descripcionController, hintText: "Descripcion");
  }

  /// Section Widget
  Widget _buildSubsecciones(BuildContext context) {
    return CustomTextFormField(
        controller: subseccionesController,
        hintText: "Subsecciones",
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildCrear(BuildContext context) {
    return CustomElevatedButton(
        text: "Crear",
        buttonStyle: CustomButtonStyles.none,
        decoration: CustomButtonStyles.gradientIndigoToPrimaryDecoration,
        onPressed: () {
          onTapCrear(context);
        });
  }

  /// Navigates to the contenidoItemScreen when the action is triggered.
  onTapCrear(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.contenidoItemScreen);
  }
}
