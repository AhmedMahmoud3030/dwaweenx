import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgets/customTextFormField.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../KasayedByCategory/kasayed_by_category.dart';
import '../provider.dart';

class KasaedScreen extends StatelessWidget {
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
            Stack(
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
                          width: 1.w,
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcKsaed2,
                              height: 8.33333333.w,
                              width: 8.33333333.w,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'poems'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 4.w,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'search_Kasaed_catagories'.tr(),
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
                      textEditingController: provider.kasayedController,
                      onChanged: (value) {
                        provider.searchKasayedMethod(searchValue: value);
                      },
                      searchText: 'search_in_poems',
                      onPressed: () {
                        provider.kasayedController.clear();
                        provider.searchKasayedMethod(searchValue: '');
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    SizedBox(
                      height: 66.6666667.h,
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
                          : provider.KasayedScreenData.isEmpty
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
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        child: Text(
                                          'there_is_no_Kasayed'.tr(),
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
                              : GridView.builder(
                        padding: EdgeInsets.symmetric(
                                    horizontal: 3.33333333.w,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2,
                                  ),
                                  itemCount: provider.groupedBy.length > 15
                                      ? 15
                                      : provider.groupedBy.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Card(
                                        margin: EdgeInsets.all(6),
                                        child: InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              color: Colors.white,
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 6,
                                                    ),
                                                    SvgPicture.asset(
                                                      Assets.iconsIcKsaed,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    SizedBox(
                                                      width: 0.1.w,
                                                    ),
                                                    SizedBox(
                                                      width: 30.w,
                                                      child: Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        provider
                                                            .groupedBy[index]
                                                            .purpose,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.teal,
                                                          fontFamily: 'Cairo',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: .5.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 22,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      "${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber(provider.groupedBy[index].kenshat.length.toString()) : provider.groupedBy[index].kenshat.length}  ${'poem'.tr()}",
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: 'Cairo',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            provider
                                                .setGroupByPurposeIndex(index);
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    KasaedByCategoryScreen(),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
