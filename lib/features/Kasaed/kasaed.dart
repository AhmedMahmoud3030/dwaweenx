import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgets/customTextFormField.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../KasayedByCategory/kasayed_by_category.dart';
import '../provider.dart';

class KasaedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

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
                SvgPicture.asset(
                  Assets.paintingsImgHeadInternal,
                  alignment: Alignment.topCenter,
                  width: mediaQuery.width * 4,
                  height: mediaQuery.height / 2,
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: mediaQuery.height * .09,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcKsaed2,
                              height: mediaQuery.width / 12,
                              width: mediaQuery.width / 12,
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'poems'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: mediaQuery.width / 25,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'search_Kasaed_catagories'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: mediaQuery.width / 25,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: mediaQuery.height * .02,
                    ),
                    CustomTextFormFiled(
                      mediaQuery: mediaQuery,
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
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: mediaQuery.height / 1.55,
                      width: mediaQuery.height,
                      child: provider.dewanBodyLoading
                          ? SizedBox(
                              width: mediaQuery.width,
                              height: mediaQuery.height,
                              child: const Center(
                                child: SpinKitCircle(
                                  color: Constants.primary,
                                ),
                              ),
                            )
                          : provider.KasayedScreenData.isEmpty
                              ? Container(
                                  width: mediaQuery.width,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: mediaQuery.width / 30,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        child: Text(
                                          'there_is_no_Kasayed'.tr(),
                                          style: const TextStyle(
                                            fontSize: 16,
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
                                    horizontal: mediaQuery.width / 30,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2,
                                  ),
                                  itemCount: provider.groupedBy.length > 15
                                      ? 15
                                      : provider.groupedBy.length,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      child: Card(
                                        margin: const EdgeInsets.all(6),
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
                                                    const SizedBox(
                                                      width: 6,
                                                    ),
                                                    SvgPicture.asset(
                                                      Assets.iconsIcKsaed,
                                                      height: 25,
                                                      width: 25,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    SizedBox(
                                                      width:
                                                          mediaQuery.width * .3,
                                                      child: Text(
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        provider
                                                            .groupedBy[index]
                                                            .purpose,
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.teal,
                                                          fontFamily: 'Cairo',
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: 22,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      "${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber(provider.groupedBy[index].kenshat.length.toString()) : provider.groupedBy[index].kenshat.length}  ${'poem'.tr()}",
                                                      style: const TextStyle(
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
                                                    const KasaedByCategoryScreen(),
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
