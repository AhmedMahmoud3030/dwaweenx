import 'package:dwaweenx/Notes/notesData.dart';
import 'package:dwaweenx/Screens/AboutUs/AboutUs.dart';
import 'package:dwaweenx/Screens/Comment/Comment.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/nav.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';

import '../../Favourite/FavDataBase.dart';

class DrawerFb1 extends StatefulWidget {
  const DrawerFb1({super.key});

  @override
  State<DrawerFb1> createState() => _DrawerFb1State();
}

class _DrawerFb1State extends State<DrawerFb1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    double d1 = width / 12;
    double d2 = width / 20;
    double d3 = width / 25;
    double d4 = height / 40;

    return Drawer(
      child: Material(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 250,
              width: 500,
              child: SvgPicture.asset(
                Assets.paintingsSideMenu,
                alignment: Alignment.topCenter,
                //width: 500,
                height: MediaQuery.of(context).size.height,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      selectedItem(context, 0);
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'المفضلة',
                          //AppLocale.of(context).getTranslated("المفضلة"),
                          key: const ObjectKey('Favourit'),
                          style: TextStyle(
                            color: Constants.primary,
                            fontFamily: 'Cairo',
                            fontSize: d3,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          Assets.iconsFav,
                          width: d1,
                          height: d1,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: d2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: d4),
                  InkWell(
                    onTap: () {
                      selectedItem(context, 1);
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'الملاحظات',
                          //AppLocale.of(context).getTranslated("الملاحظات"),
                          key: const ObjectKey('Notes'),
                          style: TextStyle(
                            color: Constants.primary,
                            fontFamily: 'Cairo',
                            fontSize: d3,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          Assets.iconsNotes,
                          width: d1,
                          height: d1,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: d2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: d4),
                  InkWell(
                    onTap: () {
                      selectedItem(context, 2);
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'مشاركه',
                          //AppLocale.of(context).getTranslated("مشاركه"),
                          key: const ObjectKey('Share'),
                          style: TextStyle(
                            color: Constants.primary,
                            fontFamily: 'Cairo',
                            fontSize: d3,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          Assets.iconsShare,
                          width: d1,
                          height: d1,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: d2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: d4),
                  Visibility(
                    visible: false,
                    child: InkWell(
                      onTap: () {
                        selectedItem(context, 3);
                      },
                      child: Row(
                        children: [
                          const Spacer(),
                          Text(
                            'اللغه',
                            // AppLocale.of(context).getTranslated("اللغه"),
                            key: const ObjectKey('Language'),
                            style: TextStyle(
                              color: Constants.primary,
                              fontFamily: 'Cairo',
                              fontSize: d3,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Image.asset(
                            Assets.iconsLang,
                            width: d1,
                            height: d1,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: d2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(visible: false, child: SizedBox(height: d4)),
                  InkWell(
                    onTap: () {
                      selectedItem(context, 4);
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'تواصل معنا',
                          //AppLocale.of(context).getTranslated("تواصل معنا"),
                          key: const ObjectKey('ContactUs'),
                          style: TextStyle(
                            color: Constants.primary,
                            fontFamily: 'Cairo',
                            fontSize: d3,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          Assets.iconsContactus,
                          width: d1,
                          height: d1,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: d2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: d4),
                  InkWell(
                    onTap: () {
                      selectedItem(context, 5);
                    },
                    child: Row(
                      children: [
                        const Spacer(),
                        Text(
                          'حول التطبيق',
                          //AppLocale.of(context).getTranslated("تواصل معنا"),
                          key: const ObjectKey('AboutUs'),
                          style: TextStyle(
                            color: Constants.primary,
                            fontFamily: 'Cairo',
                            fontSize: d3,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          Assets.iconsAbout,
                          width: d1,
                          height: d1,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          width: d2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) async {
    // boxNotes = await Hive.openBox<Notes>("notesBox");
    //
    // setState(() {});
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        navigateTo(context, const FavDataBase());
        break;
      case 1:
        navigateTo(context, const noteData());
        break;
      case 2:
        shareText();
        break;
      case 4:
        navigateTo(context, Comment());
        break;
      case 5:
        navigateTo(context, const AboutUs());
        break;
    }
  }

  shareText() async {
    final box = context.findRenderObject() as RenderBox;
    await Share.share(
      '\nرابط التطبيق للاندرويد : \n # \nرابط التطبيق للايفون : \n #\n\n',
      subject: '',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }
}

class MenuItem extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Colors.teal;
    final hoverColor = Colors.teal[700];

    return ListTile(
      trailing: SizedBox(
        height: 35,
        width: 35,
        child: Image.asset(icon),
      ),
      title: Text(
        text,
        style: TextStyle(color: color),
        textAlign: TextAlign.end,
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
