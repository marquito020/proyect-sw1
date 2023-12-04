import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:marco_david_s_application3/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavInicio,
      activeIcon: ImageConstant.imgNavInicio,
      title: "Inicio",
      type: BottomBarEnum.Inicio,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavCrear,
      activeIcon: ImageConstant.imgNavCrear,
      title: "Crear",
      type: BottomBarEnum.Crear,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavSecciones,
      activeIcon: ImageConstant.imgNavSecciones,
      title: "Secciones",
      type: BottomBarEnum.Secciones,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavRecursos,
      activeIcon: ImageConstant.imgNavRecursos,
      title: "Recursos",
      type: BottomBarEnum.Recursos,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.v,
      decoration: BoxDecoration(
        color: theme.colorScheme.onErrorContainer.withOpacity(1),
        borderRadius: BorderRadius.circular(
          37.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.08),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  color: appTheme.gray600,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style:
                        CustomTextStyles.labelLargeOnPrimaryContainer.copyWith(
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusStyle.roundedBorder27,
                /* image: DecorationImage(
                  image: fs.Svg(
                    ImageConstant.imgGroup6,
                  ),
                  fit: BoxFit.cover,
                ), */
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomImageView(
                    imagePath: bottomMenuList[index].activeIcon,
                    height: 24.v,
                    width: 22.h,
                    /* color: theme.colorScheme.onErrorContainer.withOpacity(1), */
                    color: PrimaryColors().indigo400,
                    margin: EdgeInsets.only(top: 7.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 2.v,
                      bottom: 6.v,
                    ),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style:
                          CustomTextStyles.labelLargeOnErrorContainer.copyWith(
                        /* color:
                            theme.colorScheme.onErrorContainer.withOpacity(1), */
                        color: PrimaryColors().indigo400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }
}

enum BottomBarEnum {
  Inicio,
  Crear,
  Secciones,
  Recursos,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
