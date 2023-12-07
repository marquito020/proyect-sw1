import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/core/app_export.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:marco_david_s_application3/services/index.dart';
import 'package:marco_david_s_application3/shared_preferences/user_preferences.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_image.dart';
import 'package:marco_david_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:marco_david_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:marco_david_s_application3/widgets/custom_icon_button.dart';
import 'package:provider/provider.dart';

class ContenidoListLiteraturaScreen extends StatefulWidget {
  const ContenidoListLiteraturaScreen({Key? key}) : super(key: key);

  @override
  State<ContenidoListLiteraturaScreen> createState() =>
      _ContenidoListLiteraturaScreenState();
}

class _ContenidoListLiteraturaScreenState
    extends State<ContenidoListLiteraturaScreen> {
  /* Shared Preferences */
  final prefs = UserPreferences();
  @override
  void initState() {
    prefs.initPrefs();
    super.initState();
  }

  List<Contenido> contenidoList = [];
  List<Pertenencia> pertenenciaList = [];
  @override
  Widget build(BuildContext context) {
    final contenidoService = Provider.of<ContenidoService>(context);
    final pertenenciaService = Provider.of<PertenenciaService>(context);
    if (contenidoService.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (pertenenciaService.isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    contenidoList = contenidoService.contenidoList;
    pertenenciaList = pertenenciaService.pertenenciaList;
    print(contenidoList);
    print(pertenenciaList);
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
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: contenidoList.length,
                              itemBuilder: (context, index) {
                                if (contenidoList.isEmpty) {
                                  return Center(
                                      child: Text("No hay contenido"));
                                }
                                if (contenidoList[index].id_seccion == 4) {
                                  var pertenencia = pertenenciaList.firstWhere(
                                      (element) =>
                                          element.id_contenido ==
                                          contenidoList[index].id,
                                      orElse: () => Pertenencia(
                                          id: 0,
                                          id_contenido: 0,
                                          id_usuario: 0,
                                          fecha_pertenencia:
                                              DateTime.now().toString()));
                                  if (pertenencia.id_usuario == prefs.id) {
                                    return _buildBodyContent(
                                        context, contenidoList[index]);
                                  }
                                }
                                return null;
                              })
                          /* _buildImage(context),
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
                          _buildBodyContent3(context) */
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
        title: AppbarTitle(
            text: "Literatura", margin: EdgeInsets.only(left: 21.h)));
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
  Widget _buildBodyContent(BuildContext context, Contenido contenido) {
    return Column(
      children: [
        Card(
            clipBehavior: Clip.antiAlias,
            elevation: 0,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusStyle.circleBorder20),
            child: Container(
                height: 199.v,
                width: 358.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusStyle.circleBorder20),
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
                ]))),
        Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.circleBorder20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(contenido.titulo,
                            style: theme.textTheme.titleMedium),
                        /* SizedBox(height: 6.v),
                Text(contenido.p_descripcion, style: theme.textTheme.bodyMedium) */
                      ]),
                  CustomIconButton(
                      height: 40.adaptSize,
                      width: 40.adaptSize,
                      padding: EdgeInsets.all(8.h),
                      decoration: IconButtonStyleHelper.radiusTL20,
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowRight))
                ])),
      ],
    );
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
