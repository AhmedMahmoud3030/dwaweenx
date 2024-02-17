import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/features/KasydaDetails/kasyda_details.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../../core/widgets/customTextFormField.dart';
import '../provider.dart';

class KasaedByCategoryScreen extends StatelessWidget {
  KasaedByCategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) => Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Constants.bgColor,
            image: DecorationImage(
              image: AssetImage(Assets.paintingsBG),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
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
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 9.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${"poemsx".tr()} ${provider.groupedBy[provider.groupByPurposeIndex].purpose}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 4.w,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber(provider.groupedBy[provider.groupByPurposeIndex].kenshat.length.toString()) : provider.groupedBy[provider.groupByPurposeIndex].kenshat.length} ${'poem'.tr()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 4.w,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 0.1.w,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_forward_ios,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Container(
                          height: 2.h,
                        ),
                        CustomTextFormFiled(
                          textEditingController:
                              provider.kasayedByGategoryController,
                          onChanged: (value) {
                            provider.searchKasayedByGategoryMethod(
                              searchValue: value,
                            );
                          },
                          searchText: 'search_in_poems',
                          onPressed: () {
                            provider.kasayedByGategoryController.clear();
                            provider.searchKasayedByGategoryMethod(
                              searchValue: '',
                            );
                          },
                          onFieldSubmitted: (value) {},
                        ),
                        SizedBox(
                          height: 0.1.h,
                        ),
                        provider.groupedBy[provider.groupByPurposeIndex].kenshat
                                .isEmpty
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
                            : ListView.builder(
                          padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 100.w,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 3.33333333.w,
                                    ),
                                    child: InkWell(
                                      child: Padding(
                                        padding: EdgeInsets.all(4.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets.iconsIcKsaed,
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  Text(
                                                    provider
                                                        .groupedBy[provider
                                                            .groupByPurposeIndex]
                                                        .kenshat[index]
                                                        .name,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.teal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 0.1.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 16,
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        provider
                                                            .groupedBy[provider
                                                                .groupByPurposeIndex]
                                                            .kenshat[index]
                                                            .kaseydaT
                                                            .split('.')
                                                            .first,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 12,
                                                    ),
                                                    Expanded(
                                                      child: Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        provider
                                                            .groupedBy[provider
                                                                .groupByPurposeIndex]
                                                            .kenshat[index]
                                                            .kaseydaT
                                                            .split('.')[1],
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        provider
                                            .setKasydaDetailsBody(
                                              provider
                                                  .groupedBy[provider
                                                      .groupByPurposeIndex]
                                                  .kenshat[index],
                                              context.locale.languageCode,
                                            )
                                            .then(
                                              (value) => provider.splitKasyda(),
                                            );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                KasydaDetails(),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                                itemCount: provider
                                    .groupedBy[provider.groupByPurposeIndex]
                                    .kenshat
                                    .length,
                              ),
                        SizedBox(
                          height: 0.1.h,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
