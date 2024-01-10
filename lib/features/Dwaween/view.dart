import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgits/customTextFormField.dart';
import 'package:dwaweenx/features/DewanDetails/view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class DwaweenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) =>
          GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/paintings/img_head_internal.svg",
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width * 4,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Column(
              children: [
                Container(
                  color: Colors.transparent,
                  height: mediaQuery.size.height * .09,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SvgPicture.asset(
                          "assets/images/icons/ic_dwawen2.svg",
                          height: mediaQuery.size.width / 12,
                          width: mediaQuery.size.width / 12,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "dwaween".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaQuery.size.width / 25,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'search_all_dwaween'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaQuery.size.width / 25,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: mediaQuery.size.height * .02,
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
                  onFieldSubmitted: (String) {},
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // height: mediaQuery.size.height / 1.55,
                  width: mediaQuery.size.height,
                  child: provider.dewanBodyLoading
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Center(
                              child: SpinKitCircle(
                            color: Constants.primary,
                          )),
                        )
                      : provider.dewanBody!.dawawen.isEmpty
                          ? Container(
                              width: mediaQuery.size.width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: mediaQuery.size.width / 30),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
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
                                        fontSize: 16,
                                        color: Colors.teal,
                                        fontFamily: "Cairo",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      provider.dewanBody?.dawawen.length ?? 0,
                                  itemBuilder: (BuildContext context, index) {
                                    return InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    mediaQuery.size.width / 40),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/images/icons/ic_dwawen.svg",
                                                  height:
                                                      mediaQuery.size.width /
                                                          12,
                                                  width: mediaQuery.size.width /
                                                      12,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      provider
                                                              .dewanBody
                                                              ?.dawawen[index]
                                                              .name ??
                                                          '',
                                                      style: TextStyle(
                                                        color:
                                                            Constants.primary,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: mediaQuery
                                                                .size.width /
                                                            20,
                                                        fontFamily: "Cairo",
                                                      ),
                                                    ),
                                                    Text(
                                                      '${'number_of_poems'.tr()} ${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber((provider.dewanBody!.dawawen![index].kasaed!.length).toString()) : provider.dewanBody?.dawawen?[index].kasaed!.length} ${'poem'.tr()}',
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color:
                                                            Constants.primary,
                                                        fontSize: mediaQuery
                                                                .size.width /
                                                            27,
                                                        fontFamily: "Cairo",
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )),
                                      ),
                                      onTap: () {
                                        provider.seDewanIndex(index);

                                        provider.setKafya(index);

                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DewanDetailsPage(),
                                          ),
                                        );
                                      },
                                    );
                                  }),
                            ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
