import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/widgets/customTextFormField.dart';
import '../provider.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 100.0.w,
        height: 100.0.h,
        decoration: BoxDecoration(
          color: Constants.bgColor,
          image: DecorationImage(
            image: AssetImage(
              Assets.paintingsBG,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<BaseProvider>(
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
                      height: 9.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'about_app'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 4.w,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'dwanen_el_sheikh_ibrahim_abdullah_niass'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 4.w,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 2.h,
                    ),
                    CustomTextFormFiled(
                      textEditingController: provider.aboutUsController,
                      onChanged: (value) {},
                      searchText: 'search_in_dwaween',
                      onPressed: () {
                        provider.aboutUsController.clear();
                      },
                      onFieldSubmitted: (value) {
                        provider.aboutUsController.clear();
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
                        padding: EdgeInsets.only(right: .2.w, left: .2.w),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          children: [
                            SizedBox(
                              height: .1.h,
                            ),
                            Text(
                              'group_of_poems_by_el_sheikh_ibrahim_abdullah_niass'
                                  .tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            SizedBox(
                              height: .3.h,
                            ),
                            Text(
                              'about_app_content'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            SizedBox(
                              width: .2.w,
                            ),
                            Text(
                              'about_app_content2'.tr(),
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                                fontSize: 14.sp,
                                fontFamily: 'Cairo',
                              ),
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
        ),
      ),
    );
  }
}
