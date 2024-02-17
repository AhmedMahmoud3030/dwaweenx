import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/features/ContactUs/contact_us.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

import '../../generated/assets.dart';
import '../AboutUs/about_us.dart';
import '../Favorite/favorite_screen.dart';
import '../Notes/notes_screen.dart';

class DrawerFb1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      shadowColor: Constants.primary2,
      elevation: 20,
      // surfaceTintColor: Colors.amber,
      backgroundColor: Color(0xff0A8065),
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 30.h,
            width: double.infinity,
            child: SvgPicture.asset(
              Assets.paintingsSideMenu,
              alignment: Alignment.topCenter,
              //width: 500,
              height: 100.h,
            ),
          ),
          Container(
            height: 70.h,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
            child: Column(
              children: [
                SizedBox(height: .12.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => FavoriteScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.iconsFav,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: .10.w,
                      ),
                      Text(
                        'Favourite'.tr(),
                        style: TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NotesScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.iconsNotes,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: .10.w,
                      ),
                      Text(
                        'Notes'.tr(),
                        style: TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                InkWell(
                  onTap: () async {
                    Navigator.of(context).pop();
                    final box = context.findRenderObject() as RenderBox;
                    await Share.share(
                      '\nرابط التطبيق للاندرويد : \n # \nرابط التطبيق للايفون : \n #\n\n',
                      subject: '',
                      sharePositionOrigin:
                          box.localToGlobal(Offset.zero) & box.size,
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.iconsShare,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: .10.w,
                      ),
                      Text(
                        'Share'.tr(),
                        style: TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                Consumer<BaseProvider>(
                  builder: (BuildContext context, value, Widget? child) =>
                      InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                      value.changeLang(context: context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              Assets.iconsLang,
                              width: 30,
                              height: 30,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: .10.w,
                            ),
                            Text(
                              'Language'.tr(),
                              style: TextStyle(
                                color: Constants.primary2,
                                fontFamily: 'Cairo',
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              context.locale.languageCode == 'ar'
                                  ? 'English'
                                  : 'عربي',
                              style: TextStyle(
                                color: Constants.primary2,
                                fontFamily: 'Cairo',
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(
                              width: .10.w,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Constants.primary2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 2.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ContactUs(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.iconsContactus,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: .10.w,
                      ),
                      Text(
                        'ContactUs'.tr(),
                        style: TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 2.h),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => AboutUs(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.iconsAbout,
                        width: 30,
                        height: 30,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: .10.w,
                      ),
                      Text(
                        'AboutUs'.tr(),
                        style: TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
