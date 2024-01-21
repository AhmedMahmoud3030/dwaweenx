import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgits/audio_card.dart';
import 'package:dwaweenx/core/widgits/customTextFormField.dart';
import 'package:dwaweenx/features/DewanDetails/view.dart';
import 'package:dwaweenx/features/KasayedByCategory/kasayed_by_category.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
        children: [
          SvgPicture.asset(
            "assets/images/paintings/img_head_home.svg",
            alignment: Alignment.topCenter,
            width: mediaQuery.width,
            height: mediaQuery.height / 2,
          ),
          Consumer<BaseProvider>(
            builder: (BuildContext context, provider, Widget? child) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.transparent,
                  height: mediaQuery.height / 4,
                ),
                CustomTextFormFiled(
                  mediaQuery: mediaQuery,
                  textEditingController: provider.homeController,
                  onChanged: (value) {
                    provider.searchHomeMethod(searchValue: value);
                  },
                  searchText: 'search_in_dwaween',
                  onPressed: () {
                    provider.homeController.clear();
                    provider.searchHomeMethod(searchValue: '');
                  },
                  onFieldSubmitted: (String) {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: provider.dewanBodyLoading
                        ? Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                  bottom: mediaQuery.height / 2),
                              width: mediaQuery.width,
                              height: mediaQuery.height,
                              child: Center(
                                child: SpinKitCircle(
                                  color: Constants.primary,
                                ),
                              ),
                            ),
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: provider.homeController.text.isEmpty
                                    ? mediaQuery.height * .02
                                    : 0,
                              ),
                              Visibility(
                                visible: provider.homeController.text.isEmpty,
                                child: AudioCard(),
                              ),
                              SizedBox(
                                height: mediaQuery.height * .02,
                              ),
                              SizedBox(
                                height: mediaQuery.height * .07,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: mediaQuery.width / 25,
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/icons/ic_dwawenTit.svg",
                                      height: mediaQuery.width / 12,
                                      width: mediaQuery.width / 12,
                                    ),
                                    Text(
                                      "dwaween".tr(),
                                      style: TextStyle(
                                        color: Color(0xff1C7F88),
                                        fontSize: mediaQuery.width / 25,
                                        fontFamily: "Cairo",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: mediaQuery.width / 2.1,
                                      child: Divider(
                                        color: Colors.teal,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();

                                        provider.setSelectedIndex(
                                          index: 1,
                                        );

                                        provider.homeController.clear();
                                      },
                                      child: Text(
                                        "view_all".tr(),
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontSize: mediaQuery.width / 25,
                                            fontFamily: "Cairo",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mediaQuery.width / 25,
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: mediaQuery.height * .000001,
                              // ),
                              Visibility(
                                visible: provider.HomeScreenData.length > 0
                                    ? false
                                    : true,
                                child: Container(
                                  width: mediaQuery.width,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: mediaQuery.width / 30),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
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
                                ),
                              ),
                              Visibility(
                                visible: provider.HomeScreenData.length > 0
                                    ? true
                                    : false,
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: mediaQuery.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: mediaQuery.width / 30),
                                      child: InkWell(
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.white,
                                            ),
                                            child: ListTile(
                                              leading: SvgPicture.asset(
                                                "assets/images/icons/ic_ksaed.svg",
                                                height: 25,
                                                width: 25,
                                              ),
                                              title: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  provider.HomeScreenData[index]
                                                      .name,
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontFamily: "Cairo"),
                                                ),
                                              ),
                                              subtitle: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "number_of_poems".tr(),
                                                    style: TextStyle(
                                                      color: Colors.teal,
                                                    ),
                                                  ),
                                                  Text('  '),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 4.0),
                                                    child: Text(
                                                      context.locale
                                                                  .languageCode ==
                                                              'ar'
                                                          ? Utils().convertToArabicNumber(
                                                              provider
                                                                  .HomeScreenData[
                                                                      index]
                                                                  .kasaed
                                                                  .length
                                                                  .toString())
                                                          : provider
                                                              .HomeScreenData[
                                                                  index]
                                                              .kasaed
                                                              .length
                                                              .toString(),
                                                      style: TextStyle(
                                                        color: Colors.teal,
                                                        fontFamily: "Cairo",
                                                      ),
                                                    ),
                                                  ),
                                                  Text('  '),
                                                  Text(
                                                    "poem".tr(),
                                                    style: TextStyle(
                                                      color: Colors.teal,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        onTap: provider.HomeScreenData[index]
                                                    .kasaed.length >
                                                0
                                            ? () {
                                                provider.setDewanIndex(index);

                                                provider
                                                    .calculateKafyaList(index);

                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DewanDetailsPage(),
                                                  ),
                                                );
                                              }
                                            : () {
                                                Utils().displayToastMessage(
                                                    'there_is_no_Kasayed'.tr());
                                              },
                                      ),
                                    );
                                  },
                                  itemCount: provider.HomeScreenData.length > 15
                                      ? 15
                                      : provider.HomeScreenData.length,
                                ),
                              ),
                              // SizedBox(
                              //   height: 10,
                              // ),
                              SizedBox(
                                height: 35,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: mediaQuery.width / 25,
                                    ),
                                    SvgPicture.asset(
                                      "assets/images/icons/ic_ksaed.svg",
                                      height: mediaQuery.width / 12,
                                      width: mediaQuery.width / 12,
                                    ),
                                    Text(
                                      "poems".tr(),
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: mediaQuery.width / 20,

                                        // fontFamily: "Cairo",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: mediaQuery.width / 2.1,
                                      child: Divider(
                                        color: Colors.teal,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: () {
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();

                                        provider.setSelectedIndex(
                                          index: 2,
                                        );

                                        provider.homeController.clear();
                                      },
                                      child: Text(
                                        "view_all".tr(),
                                        style: TextStyle(
                                            color: Colors.teal,
                                            fontSize: mediaQuery.width / 25,
                                            fontFamily: "Cairo",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mediaQuery.width / 25,
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: provider.groupedBy.length > 0
                                    ? false
                                    : true,
                                child: Container(
                                  width: mediaQuery.width,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: mediaQuery.width / 30),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.white,
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          'there_is_no_Kasayed'.tr(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.teal,
                                            fontFamily: "Cairo",
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: provider.groupedBy.length > 0
                                    ? true
                                    : false,
                                child: GridView.builder(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: mediaQuery.width / 30),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 2),
                                  itemCount: provider.groupedBy.length > 15
                                      ? 15
                                      : provider.groupedBy.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      margin: EdgeInsets.all(6),
                                      child: InkWell(
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  SvgPicture.asset(
                                                    "assets/images/icons/ic_ksaed.svg",
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Container(
                                                    child: Text(
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.fade,
                                                      provider.groupedBy[index]
                                                          .purpose,
                                                      style: TextStyle(
                                                        color: Colors.teal,
                                                        fontFamily:
                                                            "Amiri Regular",
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(right: 22),
                                                child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      "${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber(provider.groupedBy[index].kenshat.length.toString()) : provider.groupedBy[index].kenshat.length}  ${'poem'.tr()}",
                                                      style: TextStyle(
                                                          color: Colors.grey,
                                                          fontFamily:
                                                              "Amiri Regular"),
                                                    )),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: provider.groupedBy[index].kenshat
                                                    .length >
                                                0
                                            ? () {
                                                provider.setGroupByPurposeIndex(
                                                    index);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        KasaedByCategoryScreen(),
                                                  ),
                                                );
                                              }
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
