import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgets/customTextFormField.dart';
import 'package:dwaweenx/features/DewanDetails/dewan_details.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../provider.dart';

class DwaweenScreen extends StatelessWidget {
  DwaweenScreen({super.key});

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
                  height: 9.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsIcDwawen2,
                          height: 8.33333333.w,
                          width: 8.33333333.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'dwaween'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 4.w,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'search_all_dwaween'.tr(),
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
                  textEditingController: provider.dewanController,
                  onChanged: (value) {
                    provider.searchDewanMethod(searchValue: value);
                  },
                  searchText: 'search_in_dwaween',
                  onPressed: () {
                    provider.dewanController.clear();
                    provider.searchDewanMethod(searchValue: '');
                  },
                  onFieldSubmitted: (value) {},
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  // height: 66.6666667.h
                  width: 100.h,
                  child: provider.dewanBodyLoading
                      ? SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: Center(
                            child: SpinKitCircle(
                              color: Constants.primary,
                            ),
                          ),
                        )
                      : provider.DewanScreenData.isEmpty
                          ? Container(
                              width: 100.w,
                              margin: EdgeInsets.symmetric(
                                horizontal: 3.33333333.w,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white,
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      'there_is_no_Dwaween'.tr(),
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        color: Colors.teal,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 67.h,
                              color: Colors.transparent,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.DewanScreenData.length,
                                itemBuilder: (BuildContext context, index) {
                                  return InkWell(
                                    child: Padding(
                                      padding: EdgeInsets.all(6.0),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.iconsIcDwawen,
                                              height: 8.33333333.w,
                                              width: 8.33333333.w,
                                            ),
                                            SizedBox(
                                              width: 1.w,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Container(
                                                  width: 82.w,
                                                  child: Text(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    provider
                                                            .dewanBody
                                                            ?.dawawen[index]
                                                            .name ??
                                                        '',
                                                    style: TextStyle(
                                                      color: Constants.primary,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 4.7.w,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  '${'number_of_poems'.tr()} ${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber((provider.dewanBody!.dawawen[index].kasaed.length).toString()) : provider.dewanBody?.dawawen[index].kasaed.length} ${'poem'.tr()}',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Constants.primary,
                                                    fontSize: 3.7037037.w,
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      provider.setDewanIndex(index);

                                      provider.calculateKafyaList(index);

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              DewanDetailsPage(),
                                        ),
                                      );
                                    },
                                  );
                                },
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
