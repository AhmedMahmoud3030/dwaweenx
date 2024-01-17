import 'package:dwaweenx/core/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class KasydaShareScreen extends StatelessWidget {
  final String image;
  final String text;

  const KasydaShareScreen({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: Image.network(image,fit: BoxFit.cover,),
          ),
          Expanded(
            flex: 3,
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: TextStyle(
                decoration: TextDecoration.none,
                decorationStyle: TextDecorationStyle.wavy,
                color: Constants.shareTextColor,
                fontSize: 20,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "name_of_app".tr(),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationStyle: TextDecorationStyle.wavy,
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Image.asset(
                    'assets/images/icons/name_app.png',
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    "name_of_company".tr(),
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      decorationStyle: TextDecorationStyle.wavy,
                      color: Colors.grey,
                      fontSize: 12,
                      fontFamily: "Cairo",
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
