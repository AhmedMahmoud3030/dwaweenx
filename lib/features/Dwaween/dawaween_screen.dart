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

import '../provider.dart';

class DwaweenScreen extends StatelessWidget {
  const DwaweenScreen({super.key});

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
                          Assets.iconsIcDwawen2,
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
                          'dwaween'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaQuery.width / 25,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'search_all_dwaween'.tr(),
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
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  // height: mediaQuery.height / 1.55,
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
                      : provider.DewanScreenData.isEmpty
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
                                      'there_is_no_Dwaween'.tr(),
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
                          : Expanded(
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: provider.DewanScreenData.length,
                                itemBuilder: (BuildContext context, index) {
                                  return InkWell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: mediaQuery.width / 40,
                                        ),
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
                                              height: mediaQuery.width / 12,
                                              width: mediaQuery.width / 12,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  provider
                                                          .dewanBody
                                                          ?.dawawen[index]
                                                          .name ??
                                                      '',
                                                  style: TextStyle(
                                                    color: Constants.primary,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        mediaQuery.width / 20,
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ),
                                                Text(
                                                  '${'number_of_poems'.tr()} ${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber((provider.dewanBody!.dawawen[index].kasaed.length).toString()) : provider.dewanBody?.dawawen[index].kasaed.length} ${'poem'.tr()}',
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Constants.primary,
                                                    fontSize:
                                                        mediaQuery.width / 27,
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
