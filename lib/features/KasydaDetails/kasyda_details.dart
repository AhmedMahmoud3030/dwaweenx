import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/widgits/customTextFormField.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
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
                      height: mediaQuery.height * .2,
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
                                    builder: (context) => VocalistList(
                                      mediaQuery: mediaQuery,
                                      provider: provider,
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "${"vocalist".tr()} ${provider.sheikh}",
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
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: mediaQuery.width * .9,
                                child: ProgressBar(
                                  timeLabelPadding: 10,
                                  barHeight: 4,
                                  baseBarColor: Color(0xff51DECF),
                                  bufferedBarColor: Color(0xff51DECF),
                                  progressBarColor: Colors.white,
                                  thumbColor: Colors.white,
                                  timeLabelTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  progress: provider.audioPlayer.position,
                                  buffered:
                                      provider.audioPlayer.bufferedPosition,
                                  total: provider.audioPlayer.duration ??
                                      Duration.zero,
                                  onSeek: provider.audioPlayer.seek,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: 45,
                                width: 45,
                              ),
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      if (provider.audioPlayer.position
                                                  .inSeconds >=
                                              0 &&
                                          provider.audioPlayer.position
                                                  .inSeconds <
                                              60) {
                                        provider.audioPlayer.seek(Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                provider.audioPlayer.position
                                                    .inSeconds));
                                      } else {
                                        provider.audioPlayer.seek(Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                60));
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/img/ic_pspeed.svg")),
                              ),
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      if (provider.audioPlayer.position
                                                  .inSeconds >=
                                              0 &&
                                          provider.audioPlayer.position
                                                  .inSeconds <
                                              10) {
                                        provider.audioPlayer.seek(Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                provider.audioPlayer.position
                                                    .inSeconds));
                                      } else {
                                        provider.audioPlayer.seek(Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                10));
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/img/ic_p.svg")),
                              ),
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                  onPressed: () {
                                    if (provider.isPlaying == false) {
                                      provider.audioPlayer.play();
                                      provider.setIsPlaying(true);
                                    } else {
                                      provider.audioPlayer.pause();
                                      provider.setIsPlaying(false);
                                    }
                                  },
                                  icon: !provider.isPlaying
                                      ? Icon(
                                          Icons.play_circle_outline,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.pause_circle_outline,
                                          color: Colors.white,
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      if (provider.audioPlayer.position
                                                  .inSeconds +
                                              10 <=
                                          provider.audioPlayer.duration!
                                              .inSeconds) {
                                        provider.audioPlayer.seek(Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds +
                                                10));
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/img/ic_next.svg")),
                              ),
                              SizedBox(
                                height: 45,
                                width: 45,
                                child: IconButton(
                                    onPressed: () {
                                      if (provider.audioPlayer.position
                                                  .inSeconds +
                                              60 <=
                                          provider.audioPlayer.duration!
                                              .inSeconds) {
                                        provider.audioPlayer.seek(Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds +
                                                60));
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                        "assets/img/ic_nspeed.svg")),
                              ),
                              SizedBox(
                                height: 55,
                                width: 55,
                                child: IconButton(
                                    onPressed: () {
                                      if (!provider.loobMode) {
                                        provider.audioPlayer
                                            .setLoopMode(LoopMode.all);
                                        provider.setLoobMode(true);
                                      } else {
                                        provider.audioPlayer
                                            .setLoopMode(LoopMode.off);
                                        provider.setLoobMode(false);
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      "assets/img/ic_repeat.svg",
                                      color: provider.loobMode
                                          ? Colors.amber
                                          : Colors.white,
                                    )),
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

class VocalistList extends StatelessWidget {
  const VocalistList({
    super.key,
    required this.mediaQuery,
    required this.provider,
  });

  final Size mediaQuery;
  final BaseProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      // width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            bottom: mediaQuery.height * .2,
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        'vocalists'.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: Constants.primary2,
                          fontSize: mediaQuery.width / 16,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Constants.primary2,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  Expanded(
                      child: ListView.builder(
                    itemCount: provider.KasydaDetailsBody?.audio.length ?? 0,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        provider.setVocalist(
                          audioIndex: index,
                          local: context.locale.languageCode,
                        );
                        Navigator.of(context).pop();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            context.locale.languageCode == 'ar'
                                ? (provider.KasydaDetailsBody?.audio[index]
                                        .sheikhAr ??
                                    '')
                                : (provider.KasydaDetailsBody?.audio[index]
                                        .sheikhEn ??
                                    ''),
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              decorationStyle: TextDecorationStyle.wavy,
                              color: Constants.primary,
                              fontSize: mediaQuery.width / 20,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ))
                ],
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              width: mediaQuery.width,
              height: mediaQuery.height * .3,
            ),
          ),
        ],
      ),
    );
  }
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
