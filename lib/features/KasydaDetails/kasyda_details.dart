import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgits/customTextFormField.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/shimmer.dart';

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
              color: provider.BGColors[provider.BGColorIndex],
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
                                      fontSize: provider.fontSize.toDouble(),
                                      color: provider
                                          .fontColors[provider.fontColorIndex],
                                    ),
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
                                onPressed: () {
                                  Future(() => showDialog(
                                        barrierColor: Colors.transparent,
                                        context: context,
                                        builder: (context) => MenuModel(
                                          mediaQuery: mediaQuery,
                                        ),
                                      ));
                                },
                                icon: Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          ////////
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: mediaQuery.width * .9,
                                child: StreamBuilder<Duration>(
                                    stream: provider.audioPlayer.positionStream,
                                    builder: (context, snapshot) {
                                      return ProgressBar(
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
                                        buffered: provider
                                            .audioPlayer.bufferedPosition,
                                        total: provider.audioPlayer.duration ??
                                            Duration.zero,
                                        onSeek: provider.audioPlayer.seek,
                                      );
                                    }),
                              )
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              IconButton(
                                iconSize: 25,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  if (provider.loobMode == 0) {
                                    provider.audioPlayer
                                        .setLoopMode(LoopMode.one);
                                    provider.setLoobMode(1);
                                  } else if (provider.loobMode == 1) {
                                    provider.audioPlayer
                                        .setLoopMode(LoopMode.all);
                                    provider.setLoobMode(2);
                                  } else if (provider.loobMode == 2) {
                                    provider.audioPlayer
                                        .setLoopMode(LoopMode.off);
                                    provider.setLoobMode(0);
                                  }
                                },
                                icon: Icon(
                                  provider.loobMode == 0
                                      ? Icons.repeat
                                      : provider.loobMode == 1
                                          ? Icons.repeat_on_outlined
                                          : Icons.repeat_one_on_outlined,
                                  color: provider.loobMode == 0
                                      ? Colors.white
                                      : Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      if (provider.audioPlayer.position
                                                  .inSeconds +
                                              60 <=
                                          provider.audioPlayer.duration!
                                              .inSeconds) {
                                        provider.audioPlayer.seek(
                                          Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds +
                                                60,
                                          ),
                                        );
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      width: 30,
                                      height: 30,
                                      "assets/img/ic_nspeed.svg",
                                    ),
                                  ),
                                  IconButton(
                                    padding: EdgeInsets.zero,
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
                                      width: 30,
                                      height: 30,
                                      "assets/img/ic_next.svg",
                                    ),
                                  ),
                                  IconButton(
                                    iconSize: 30,
                                    padding: EdgeInsets.zero,
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
                                  IconButton(
                                    iconSize: 30,
                                    padding: EdgeInsets.zero,
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
                                        provider.audioPlayer.seek(
                                          Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                10,
                                          ),
                                        );
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      width: 30,
                                      height: 30,
                                      "assets/img/ic_p.svg",
                                    ),
                                  ),
                                  IconButton(
                                    iconSize: 30,
                                    padding: EdgeInsets.zero,
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
                                        provider.audioPlayer.seek(
                                          Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                60,
                                          ),
                                        );
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                        width: 30,
                                        height: 30,
                                        "assets/img/ic_pspeed.svg"),
                                  ),
                                ],
                              ),
                              IconButton(
                                iconSize: 30,
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (context) => VocalistList(
                                      mediaQuery: mediaQuery,
                                      provider: provider,
                                    ),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  width: 30,
                                  height: 30,
                                  "assets/img/ic_downlod.svg",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: TextButton(
                    onPressed: () {
                      provider.downloadFile();
                    },
                    child: Text(
                      'helllllllllo',
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
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
                    itemBuilder: (context, index) {
                      print("index: ${index}");
                      print("provider.audioIndex: ${provider.audioIndex}");

                      return GestureDetector(
                        onTap: () {
                          provider.setVocalist(
                            audioIndex: index,
                            local: context.locale.languageCode,
                          );
                          Navigator.of(context).pop();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                height: .5,
                                color: provider.audioIndex == index
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            IconButton(
                              iconSize: 25,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                //todo download
                              },
                              icon: Icon(
                                Icons.cloud_download_outlined,
                                color: Constants.primary,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      );
                    },
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
              height: mediaQuery.height * .25,
            ),
          ),
        ],
      ),
    );
  }
}

class MenuModel extends StatelessWidget {
  const MenuModel({
    super.key,
    required this.mediaQuery,
  });

  final Size mediaQuery;

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
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/ic_add_fav.svg',
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'Favourite'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Constants.primary2,
                            fontSize: 18,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: mediaQuery.width * .8,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/ic_add_comment.svg',
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'Notes_add'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Constants.primary2,
                            fontSize: 18,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: mediaQuery.width * .8,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/ic_downlod_setting.svg',
                          width: 35,
                          height: 35,
                        ),
                        Text(
                          'download_without_internet'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Constants.primary2,
                            fontSize: 18,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: mediaQuery.width * .8,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();

                        Future(
                          () {
                            Provider.of<BaseProvider>(context, listen: false)
                                .getListOfImages();
                            return showDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) => FractionallySizedBox(
                                widthFactor: .9,
                                heightFactor: .55,
                                child: ShareDialog(
                                  mediaQuery: mediaQuery,
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/ic_share_set.svg',
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            'share_kasyda'.tr(),
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              decorationStyle: TextDecorationStyle.wavy,
                              color: Constants.primary2,
                              fontSize: 18,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: mediaQuery.width * .8,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          'font_size'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Constants.primary2,
                            fontSize: 18,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Provider.of<BaseProvider>(context, listen: false)
                                  .increaseFontSize();
                            },
                            color: Constants.primary,
                            icon: Icon(
                              Icons.add,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Consumer<BaseProvider>(
                          builder:
                              (BuildContext context, provider, Widget? child) =>
                                  Container(
                            width: 70,
                            height: 30,
                            child: provider.fontTransactionEffect
                                ? Center(
                                    child: Text(
                                      provider.fontSize.toString().toString(),
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  )
                                : IconButton(
                                    padding: EdgeInsets.zero,
                                    onPressed: () {
                                      provider.setFontSize(20);
                                    },
                                    color: Colors.white,
                                    icon: Icon(
                                      Icons.drag_handle,
                                    ),
                                  ),
                            decoration: BoxDecoration(
                              color: provider.fontTransactionEffect
                                  ? Colors.white
                                  : Constants.primary2,
                              border: Border.all(
                                color: Constants.primary2,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Provider.of<BaseProvider>(context, listen: false)
                                  .decreaseFontSize();
                            },
                            color: Constants.primary,
                            icon: Icon(
                              Icons.remove,
                            ),
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.primary,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: mediaQuery.width * .8,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'font_color'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Constants.primary2,
                            fontSize: 18,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Consumer<BaseProvider>(
                          builder:
                              (BuildContext context, provider, Widget? child) =>
                                  Container(
                            height: 35,
                            width: mediaQuery.width * .7,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.fontColors.length,
                              itemBuilder: (_, i) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    provider.setFontColor(i);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: provider.fontColors[i],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: provider.fontColorIndex == i
                                        ? Icon(
                                            size: 30,
                                            Icons.done,
                                            color: Colors.white,
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: mediaQuery.width * .8,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'bg_color'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Constants.primary2,
                            fontSize: 18,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey,
                        ),
                        Container(
                          height: 35,
                          width: mediaQuery.width * .7,
                          child: Consumer<BaseProvider>(
                            builder: (BuildContext context, provider,
                                    Widget? child) =>
                                ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.BGColors.length,
                              itemBuilder: (_, i) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    provider.setBGColor(i);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: provider.BGColors[i],
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: provider.BGColorIndex == i
                                        ? Icon(
                                            size: 30,
                                            Icons.done,
                                            color: Colors.black,
                                          )
                                        : SizedBox(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: .5,
                      width: mediaQuery.width * .8,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
              width: mediaQuery.width,
              height: mediaQuery.height * .6,
            ),
          ),
        ],
      ),
    );
  }
}

class ShareDialog extends StatelessWidget {
  const ShareDialog({
    super.key,
    required this.mediaQuery,
  });

  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      // width: double.infinity,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 14,
            ),
            Text(
              textAlign: TextAlign.center,
              'add_verses_to_share'.tr(),
              style: TextStyle(
                decoration: TextDecoration.none,
                decorationStyle: TextDecorationStyle.wavy,
                color: Constants.primary2,
                fontSize: 18,
                fontFamily: "Cairo",
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey,
              height: .5,
              width: mediaQuery.width * .8,
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Center(
                child: Container(
                  child: Consumer<BaseProvider>(
                    builder: (BuildContext context, provider, Widget? child) =>
                        ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: provider.KT.length,
                      itemBuilder: (_, i) => GestureDetector(
                        onTap: () {
                          provider.setVersesToShareList(provider.KT[i]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            textAlign: TextAlign.center,
                            provider.KT[i],
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              decorationStyle: TextDecorationStyle.wavy,
                              color: provider.versesToShareList
                                      .contains(provider.KT[i])
                                  ? Constants.primary2
                                  : Colors.grey,
                              fontSize: 16,
                              fontFamily: "Cairo",
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.grey,
              height: .5,
              width: mediaQuery.width * .8,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Consumer<BaseProvider>(
                      builder:
                          (BuildContext context, provider, Widget? child) =>
                              TextButton(
                        onPressed: () {
                          if (provider.versesToShareList.isEmpty) {
                            Utils().displayToastMessage(
                                'select_some_verses_to_share'.tr());
                          } else {
                            Future(
                              () {
                                Navigator.of(context).pop();
                                return showDialog(
                                  barrierColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => FractionallySizedBox(
                                    widthFactor: .9,
                                    heightFactor: .8,
                                    child: ShareDialog2(
                                      mediaQuery: mediaQuery,
                                    ),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Constants.primary,
                        ),
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Text(
                            'continue'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ShareDialog2 extends StatelessWidget {
  const ShareDialog2({
    super.key,
    required this.mediaQuery,
  });

  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 300,
      // width: double.infinity,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: Consumer<BaseProvider>(
          builder: (BuildContext context, provider, Widget? child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      provider.setShareDialogIndex(0);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: provider.shareDialogIndex == 0
                            ? Constants.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Constants.primary2,
                        ),
                      ),
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'share_as_text'.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: provider.shareDialogIndex == 0
                              ? Colors.white
                              : Constants.primary2,
                          fontSize: 20,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      provider.setShareDialogIndex(1);
                    },
                    child: Container(
                      child: Text(
                        'share_as_image'.tr(),
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          decorationStyle: TextDecorationStyle.wavy,
                          color: provider.shareDialogIndex == 1
                              ? Colors.white
                              : Constants.primary2,
                          fontSize: 20,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: provider.shareDialogIndex == 1
                            ? Constants.primary
                            : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Constants.primary2),
                      ),
                      padding: EdgeInsets.all(8),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              provider.shareDialogIndex == 0
                  ? Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 9,
                            child: Center(
                              child: Container(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: provider.versesToShareList.length,
                                  itemBuilder: (_, i) => Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 6),
                                    child: Text(
                                      textAlign: TextAlign.center,
                                      provider.versesToShareList[i],
                                      style: TextStyle(
                                        decoration: TextDecoration.none,
                                        decorationStyle:
                                            TextDecorationStyle.wavy,
                                        color: Constants.shareTextColor,
                                        fontSize: 20,
                                        fontFamily: "Cairo",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "name_of_app".tr(),
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      decorationStyle: TextDecorationStyle.wavy,
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/icons/name_app.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    "name_of_company".tr(),
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      decorationStyle: TextDecorationStyle.wavy,
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    )
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                  width: mediaQuery.width * .9,
                                  child: CarouselSlider(
                                    carouselController:
                                        provider.carouselController,
                                    options: CarouselOptions(
                                      initialPage: provider.carouselIndex,
                                      onPageChanged: (index, reason) {
                                        provider.setCarouselIndex(index);
                                      },
                                      enlargeFactor: 0,
                                      aspectRatio: 16 / 9,
                                      enableInfiniteScroll: false,
                                      viewportFraction: .6,
                                    ),
                                    items: provider.urls.map((i) {
                                      bool isSelected = (provider
                                              .urls[provider.carouselIndex] ==
                                          i);
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return GestureDetector(
                                            onTap: () {
                                              provider.carouselController
                                                  .animateToPage(
                                                provider.urls.indexOf(i),
                                              );
                                              provider.setCarouselIndex(
                                                  provider.urls.indexOf(i));
                                            },
                                            child: Opacity(
                                              opacity: isSelected ? 1.0 : 0.5,
                                              // adjust the opacity based on selection
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(6.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6),
                                                    border: Border.all(
                                                      width: .5,
                                                      color: Constants.primary2,
                                                    ),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: i,
                                                    placeholder:
                                                        (context, url) =>
                                                            Shimmer.fromColors(
                                                      baseColor: Colors.white,
                                                      highlightColor:
                                                          Constants.primary,
                                                      child: Container(
                                                        child: Image.asset(
                                                            "assets/images/paintings/shikh.png",
                                                            fit: BoxFit.fill),
                                                        width:
                                                            mediaQuery.width *
                                                                .5,
                                                      ),
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                        horizontal:
                                                            mediaQuery.width *
                                                                .22,
                                                      ),
                                                      child: Icon(
                                                        Icons.error,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    }).toList(),
                                  ))

                              // ListView.builder(
                              //   scrollDirection: Axis.horizontal,
                              //   physics: BouncingScrollPhysics(),
                              //   itemCount: provider.urls?.length ?? 0,
                              //   itemBuilder: (_, i) => ,
                              // ),
                              ),
                          Expanded(
                            flex: 5,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: provider.versesToShareList.length,
                              itemBuilder: (_, i) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  provider.versesToShareList[i],
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    color: Constants.shareTextColor,
                                    fontSize: 20,
                                    fontFamily: "Cairo",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "name_of_app".tr(),
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      decorationStyle: TextDecorationStyle.wavy,
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Image.asset(
                                    'assets/images/icons/name_app.png',
                                    width: 40,
                                    height: 40,
                                  ),
                                  Text(
                                    "name_of_company".tr(),
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      decorationStyle: TextDecorationStyle.wavy,
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontFamily: "Cairo",
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ]),
                          )
                        ],
                      ),
                    ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          if (provider.shareDialogIndex == 0) {
                            provider.shareText(context);
                          } else {
                            provider.captureScreenShot(
                              context,
                              provider.urls[provider.carouselIndex],
                              provider.versesToShareList.join('\n'),
                            );
                          }

                          provider.versesToShareList = [];
                        },
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Constants.primary,
                        ),
                        child: Container(
                          padding: EdgeInsets.zero,
                          child: Text(
                            'share'.tr(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
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
