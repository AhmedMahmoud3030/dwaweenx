import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/features/Drawer/drawer.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) => Scaffold(
        backgroundColor: Colors.transparent,
        key: provider.scaffoldKey,
        drawer: DrawerFb1(),
        floatingActionButton: FloatingActionButton(onPressed: () async {
          await provider.uploadDataMethod();
        }),
        body: Container(
            decoration: BoxDecoration(
              color: Constants.bgColor,
              image: DecorationImage(
                image: AssetImage('assets/images/paintings/BG.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: provider.screens[provider.selectedIndex]),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: provider.selectedIndex,
          showElevation: false,
          itemCornerRadius: 10,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            if (index == 4) {
              provider.scaffoldKey.currentState!.openDrawer();
            } else {
              provider.setSelectedIndex(index: index);
            }
          },
          items: [
            BottomNavyBarItem(
              icon: provider.selectedIndex == 0
                  ? SvgPicture.asset("assets/images/icons/ic_home2.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown)
                  : SvgPicture.asset("assets/images/icons/ic_home.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown),
              title: Text(
                "Main".tr(),
                style: TextStyle(fontFamily: "Cairo", color: Colors.white),
              ),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 1
                  ? SvgPicture.asset("assets/images/icons/ic_dwawen2.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown)
                  : SvgPicture.asset("assets/images/icons/ic_dwawen.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown),
              title: Text('dwaween'.tr(),
                  style: TextStyle(fontFamily: "Cairo", color: Colors.white)),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 2
                  ? SvgPicture.asset("assets/images/icons/ic_ksaed2.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown)
                  : SvgPicture.asset("assets/images/icons/ic_ksaed.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown),
              title: Text('kanash'.tr(),
                  style: TextStyle(fontFamily: "Cairo", color: Colors.white)),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 3
                  ? SvgPicture.asset("assets/images/icons/ic_shaikh2.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown)
                  : SvgPicture.asset("assets/images/icons/ic_shaikh.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown),
              title: Text('shikkh'.tr(),
                  style: TextStyle(fontFamily: "Cairo", color: Colors.white)),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 4
                  ? SvgPicture.asset("assets/images/icons/ic_more2.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown)
                  : SvgPicture.asset("assets/images/icons/ic_more.svg",
                      height: 34, width: 34, fit: BoxFit.scaleDown),
              title: Text('more'.tr(),
                  style: TextStyle(fontFamily: "Cairo", color: Colors.white)),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
