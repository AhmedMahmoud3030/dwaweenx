import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/widgits/customTextFormField.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';

class KasydaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) => Screenshot(
        controller: provider.screenshotController,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: provider.BGColor,
              image: DecorationImage(
                image: AssetImage('assets/images/paintings/BG.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/images/paintings/img_head_internal.svg",
                  alignment: Alignment.topCenter,
                  width: mediaQuery.width * 4,
                  height: mediaQuery.height / 2,
                ),
                Column(
                  children: [
                    Container(
                      height: mediaQuery.height * .08,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                ),
                                color: Colors.white,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider.K.first,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${"number_of_verses".tr()} ${provider.KT.length} ${"verse".tr()}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "${"kafya".tr()} (${provider.KasydaDetailsBody!.letter})",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Cairo",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                          // IconButton(
                          //   onPressed: () {
                          //     //todo view some data about
                          //   },
                          //   icon: Icon(
                          //     Icons.more_horiz,
                          //   ),
                          //   color: Colors.white,
                          // ),
                        ],
                      ),
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
                            searchValue: value);
                      },
                      searchText: 'search_in_poems',
                      onPressed: () {
                        provider.kasayedByGategoryController.clear();
                        provider.searchKasayedByGategoryMethod(searchValue: '');
                      },
                      onFieldSubmitted: (String) {},
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: provider.KT.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: index % 2 == 0
                                  ? MainAxisAlignment.start
                                  : MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Text(
                                    style: TextStyle(
                                        fontSize: provider.fontSize,
                                        color: provider.fontColor),
                                    provider.KT[index],
                                    textAlign: index % 2 == 0
                                        ? TextAlign.start
                                        : TextAlign.end,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: mediaQuery.height * .15,
                      width: double.infinity,
                      color: Constants.primary,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => Container(
                                      // height: 300,
                                      // width: double.infinity,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            bottom: mediaQuery.height * .15,
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'المنشدين',
                                                        style: TextStyle(
                                                          color: Constants
                                                              .primary2,
                                                          fontSize:
                                                              mediaQuery.width /
                                                                  16,
                                                          fontFamily: "Cairo",
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Container(
                                                        height: 1,
                                                        color:
                                                            Constants.primary2,
                                                        width:
                                                            mediaQuery.width /
                                                                2,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  )),
                                              width: mediaQuery.width,
                                              height: mediaQuery.height * .3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "${"vocalist".tr()} ${context.locale.languageCode == 'ar' ? provider.KasydaDetailsBody!.audio[provider.audioIndex].sheikhAr : provider.KasydaDetailsBody!.audio[provider.audioIndex].sheikhEn}",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: "Cairo",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> openSelectionDialog(BuildContext context) async {
  //   List<String>? result = await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text(
  //           'اضف نصوص للمشاركة',
  //           style: TextStyle(fontFamily: 'Cairo'),
  //         ),
  //         content: StatefulBuilder(
  //           builder: (BuildContext context, StateSetter setState) {
  //             return Directionality(
  //               textDirection: TextDirection.rtl,
  //               child: Container(
  //                 width: double.maxFinite,
  //                 child: ListView.builder(
  //                   itemCount: allTexts.length,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     String text = allTexts[index];
  //                     bool isSelected = selectedTexts.contains(text);

  //                     return ListTile(
  //                       title:
  //                           Text(text, style: TextStyle(fontFamily: 'Cairo')),
  //                       tileColor: isSelected ? Constants.primary : null,
  //                       onTap: () {
  //                         setState(() {
  //                           if (isSelected) {
  //                             selectedTexts.remove(text);
  //                           } else {
  //                             if (selectedTexts.length < 4) {
  //                               selectedTexts.add(text);
  //                             } else {
  //                               displayToastMessage(
  //                                   'يمكنك فقط اختيار 4 ابيات للمشاركة');
  //                             }
  //                           }
  //                         });
  //                       },
  //                     );
  //                   },
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               // Navigator.of(context).pop(selectedTexts);
  //               navigateBack(context);

  //               showDialog(
  //                 context: context,
  //                 builder: (BuildContext context) {
  //                   return
  //                   CustomDialog(
  //                       kasedaName: widget.KNameT,
  //                       kaseda: widget.kasyedaTRepeat,
  //                       allText: selectedTexts);
  //                 },
  //               );
  //             },
  //             child: Text(
  //               'تأكيد',
  //               style: TextStyle(fontFamily: 'Cairo'),
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );

  //   if (result != null) {
  //     // Handle the selected texts, for example, you can use them in your application logic.
  //     print('Selected Texts: $result');
  //   }
  // }
}

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );
  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}
