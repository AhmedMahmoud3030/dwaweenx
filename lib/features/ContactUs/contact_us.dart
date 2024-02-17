import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mailto/mailto.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants.dart';
import '../../core/utils.dart';
import '../../generated/assets.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Constants.bgColor,
        appBar: AppBar(
          backgroundColor: Constants.primary,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          title: Text(
            'contact_us'.tr(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(
            color: Constants.bgColor,
            image: DecorationImage(
              image: AssetImage(
                Assets.paintingsBG,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Consumer<BaseProvider>(
              builder: (BuildContext context, provider, Widget? child) =>
                  Column(
                children: [
                  //build text field for name
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: TextField(
                      keyboardType: TextInputType.name,
                      cursorColor: Constants.primary,
                      decoration: InputDecoration(
                        hintText: 'your_name_(optional)'.tr(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        labelText: 'name'.tr(),
                        labelStyle: TextStyle(
                          color: Constants.primary,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Constants.primary2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  //build text field for email
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Constants.primary,
                      decoration: InputDecoration(
                        hintText:
                            'your_email_that_will_contact_with_you_on(optional)'
                                .tr(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        labelText: 'mail'.tr(),
                        labelStyle: TextStyle(
                          color: Constants.primary,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Constants.primary2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  //build text field for message
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: TextField(
                      controller: provider.messageController,
                      keyboardType: TextInputType.multiline,
                      cursorColor: Constants.primary,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'your_message(mandatory)'.tr(),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                        labelText: 'message'.tr(),
                        labelStyle: TextStyle(
                          color: Constants.primary,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Constants.primary2,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  //build button for send message via os mail
                  Padding(
                    padding: EdgeInsets.all(2.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (provider.messageController.text.isEmpty) {
                                Utils().displayToastMessage(
                                  'please_fill_message_field'.tr(),
                                );
                                return;
                              } else {
                                final mailtoLink = Mailto(
                                  to: ['turathfaydatijania@gmail.com'],
                                  cc: ['ahmed.mahmoud.el.beah@gmail.com'],
                                  subject: 'name_of_app'.tr(),
                                  body: provider.messageController.text,
                                );
                                // Convert the Mailto instance into a string.
                                // Use either Dart's string interpolation
                                // or the toString() method.
                                await launch('$mailtoLink');
                              }
                            },
                            child: Text(
                              'send'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Constants.primary,
                              padding: EdgeInsets.all(.1.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'name_of_app'.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Image.asset(
                        Assets.iconsNameApp,
                        width: 40,
                        height: 40,
                      ),
                      Text(
                        'name_of_company'.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: Colors.grey,
                          fontSize: 12.sp,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
