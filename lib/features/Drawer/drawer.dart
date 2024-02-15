import 'package:dwaweenx/Notes/notesData.dart';
import 'package:dwaweenx/Screens/AboutUs/AboutUs.dart';
import 'package:dwaweenx/Screens/Comment/Comment.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../Favourite/FavDataBase.dart';
import '../../generated/assets.dart';

class DrawerFb1 extends StatelessWidget {
  const DrawerFb1({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Drawer(
      shadowColor: Constants.primary2,
      elevation: 20,
      // surfaceTintColor: Colors.amber,
      backgroundColor: const Color(0xff0A8065),
      child: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: mediaQuery.size.height * .3,
            width: double.infinity,
            child: SvgPicture.asset(
              Assets.paintingsSideMenu,
              alignment: Alignment.topCenter,
              //width: 500,
              height: MediaQuery.of(context).size.height,
            ),
          ),
          Container(
            height: mediaQuery.size.height * .7,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 12.0, 8.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const FavDataBase(),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Favourite'.tr(),
                        style: const TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const noteData(),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Notes'.tr(),
                        style: const TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Share'.tr(),
                        style: const TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Language'.tr(),
                              style: const TextStyle(
                                color: Constants.primary2,
                                fontFamily: 'Cairo',
                                fontSize: 16,
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
                              style: const TextStyle(
                                color: Constants.primary2,
                                fontFamily: 'Cairo',
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              color: Constants.primary2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Comment(),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'ContactUs'.tr(),
                        style: const TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AboutUs(),
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
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'AboutUs'.tr(),
                        style: const TextStyle(
                          color: Constants.primary2,
                          fontFamily: 'Cairo',
                          fontSize: 16,
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
