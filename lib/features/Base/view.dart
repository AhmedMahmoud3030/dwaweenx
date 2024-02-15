import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/features/Drawer/drawer.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) => Scaffold(
        backgroundColor: Colors.transparent,
        key: provider.scaffoldKey,
        drawer: const DrawerFb1(),
        // floatingActionButton: FloatingActionButton(onPressed: () async {
        //   await provider.uploadDataMethod();
        // }),
        body: Container(
          decoration: const BoxDecoration(
            color: Constants.bgColor,
            image: DecorationImage(
              image: AssetImage(Assets.paintingsBG),
              fit: BoxFit.cover,
            ),
          ),
          child: provider.screens[provider.selectedIndex],
        ),
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
                  ? SvgPicture.asset(
                      Assets.iconsIcHome2,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    )
                  : SvgPicture.asset(
                      Assets.iconsIcHome,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    ),
              title: Text(
                'Main'.tr(),
                style:
                    const TextStyle(fontFamily: 'Cairo', color: Colors.white),
              ),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 1
                  ? SvgPicture.asset(
                      Assets.iconsIcDwawen2,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    )
                  : SvgPicture.asset(
                      Assets.iconsIcDwawen,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    ),
              title: Text(
                'dwaween'.tr(),
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                ),
              ),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 2
                  ? SvgPicture.asset(
                      Assets.iconsIcKsaed2,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    )
                  : SvgPicture.asset(
                      Assets.iconsIcKsaed,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    ),
              title: Text(
                'kanash'.tr(),
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                ),
              ),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 3
                  ? SvgPicture.asset(
                      Assets.iconsIcShaikh2,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    )
                  : SvgPicture.asset(
                      Assets.iconsIcShaikh,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    ),
              title: Text(
                'shikkh'.tr(),
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                ),
              ),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: provider.selectedIndex == 4
                  ? SvgPicture.asset(
                      Assets.iconsIcMore2,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    )
                  : SvgPicture.asset(
                      Assets.iconsIcMore,
                      height: 34,
                      width: 34,
                      fit: BoxFit.scaleDown,
                    ),
              title: Text(
                'more'.tr(),
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  color: Colors.white,
                ),
              ),
              activeColor: Constants.primary,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
