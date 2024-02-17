import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/widgets/customTextFormField.dart';
import '../provider.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) =>
          GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [
            Container(
              width: 100.0.w,
              height: 20.0.h,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.orn_header_home),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(70),
                  ),
                  color: Constants.primary),
            ),
            Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height: 9.0.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: Device.orientation == Orientation.portrait
                          ? 1.h
                          : 1.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'shikkh'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'shikkh_name'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: Device.orientation == Orientation.portrait
                      ? 2.0.h
                      : 2.0.w,
                ),
                CustomTextFormFiled(
                  textEditingController: provider.aboutController,
                  onChanged: (value) {},
                  searchText: 'search_in_dwaween',
                  onPressed: () {
                    provider.aboutController.clear();
                  },
                  onFieldSubmitted: (value) {
                    provider.aboutController.clear();
                    provider.dewanController.text = value;

                    provider.setSelectedIndex(index: 1);
                    provider.searchDewanMethod(searchValue: value);
                  },
                ),
                SizedBox(
                  height: .1.h,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(right: 20, left: 20),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: .1.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'his_birth_and_upbringing'.tr(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Constants.primary2,
                                      fontSize: 18.sp,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: .1.h,
                                    color: Constants.primary2,
                                  ),
                                  Text(
                                    'brief_about_him'.tr(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54,
                                      fontSize: 14.sp,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                              child: Image.asset(
                                Assets.paintingsShikh,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'his_elders'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.primary2,
                                fontSize: 18.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 0.1.h,
                              color: Constants.primary2,
                            ),
                            Text(
                              'his_elders_brief'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            SizedBox(
                              height: .2.h,
                            ),
                            Text(
                              'scholars_granted_him_permission'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.primary2,
                                fontSize: 18.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: .1.h,
                              color: Constants.primary2,
                            ),
                            Text(
                              'there_are_very_many'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_1'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_2'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_3'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_4'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_5'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_6'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_7'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_8'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_9'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_10'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_11'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_12'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_13'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_14'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            SizedBox(
                              height: .2.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
