import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/features/KasydaDetails/kasyda_details.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../core/widgits/customTextFormField.dart';
import '../provider.dart';

class KasaedByCategoryScreen extends StatelessWidget {
  const KasaedByCategoryScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) => Scaffold(
        body: Container(
          decoration: const BoxDecoration(
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
                  SvgPicture.asset(
                    Assets.paintingsImgHeadInternal,
                    alignment: Alignment.topCenter,
                    width: mediaQuery.width * 4,
                    height: mediaQuery.height / 2,
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: mediaQuery.height * .09,
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
                                    fontSize: mediaQuery.width / 25,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber(provider.groupedBy[provider.groupByPurposeIndex].kenshat.length.toString()) : provider.groupedBy[provider.groupByPurposeIndex].kenshat.length} ${'poem'.tr()}",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: mediaQuery.width / 25,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Container(
                          height: mediaQuery.height * .02,
                        ),
                        CustomTextFormFiled(
                          mediaQuery: mediaQuery,
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
                          onFieldSubmitted: (String) {},
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        provider.groupedBy[provider.groupByPurposeIndex].kenshat
                                .isEmpty
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
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.white,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerRight,
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
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: mediaQuery.width,
                                    margin: EdgeInsets.symmetric(
                                      horizontal: mediaQuery.width / 30,
                                    ),
                                    child: InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
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
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.teal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                        style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black45,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
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
                                                        style: const TextStyle(
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
                        const SizedBox(
                          height: 10,
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
