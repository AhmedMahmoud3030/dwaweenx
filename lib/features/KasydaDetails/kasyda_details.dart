import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dwaweenx/Domain/Entities/note.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgets/customTextFormField.dart';
import 'package:dwaweenx/features/Favorite/favorite_screen.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';

class KasydaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) => Screenshot(
        controller: provider.screenshotController,
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              color: provider.BGColors[provider.BGColorIndex],
              image: DecorationImage(
                image: AssetImage(Assets.paintingsBG),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
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
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Row(
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
                                      fontSize: 16.sp,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "${"number_of_verses".tr()} ${provider.KT.length} ${"verse".tr()}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 0.1.w,
                                      ),
                                      Text(
                                        "${"kafya".tr()} (${provider.KasydaDetailsBody!.letter})",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
                        provider.searchKasayedByGategoryMethod(searchValue: '');
                      },
                      onFieldSubmitted: (value) {},
                    ),
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: provider.KT.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
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
                      height: 20.h,
                      width: double.infinity,
                      color: Constants.primary,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierColor: Colors.transparent,
                                    context: context,
                                    builder: (context) =>
                                        VocalistList(provider: provider),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: Text(
                                    "${"vocalist".tr()} ${provider.sheikh}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.sp,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Future(
                                    () => showDialog(
                                      barrierColor: Colors.transparent,
                                      context: context,
                                      builder: (context) => MenuModel(),
                                    ),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  Assets.iconsIcMenu,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 90.w,
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
                                      timeLabelTextStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      progress: provider.audioPlayer.position,
                                      buffered:
                                          provider.audioPlayer.bufferedPosition,
                                      total: provider.audioPlayer.duration ??
                                          Duration.zero,
                                      onSeek: provider.audioPlayer.seek,
                                    );
                                  },
                                ),
                              ),
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
                                      Assets.iconsIcForward30,
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
                                        provider.audioPlayer.seek(
                                          Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds +
                                                10,
                                          ),
                                        );
                                      }
                                    },
                                    icon: SvgPicture.asset(
                                      width: 30,
                                      height: 30,
                                      Assets.iconsIcForward10,
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
                                        provider.audioPlayer.seek(
                                          Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                provider.audioPlayer.position
                                                    .inSeconds,
                                          ),
                                        );
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
                                      Assets.iconsIcBack10,
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
                                        provider.audioPlayer.seek(
                                          Duration(
                                            seconds: provider.audioPlayer
                                                    .position.inSeconds -
                                                provider.audioPlayer.position
                                                    .inSeconds,
                                          ),
                                        );
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
                                      Assets.iconsIcBack30,
                                    ),
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
                                    builder: (context) => FavoriteScreen(),
                                  );
                                },
                                icon: SvgPicture.asset(
                                  width: 30,
                                  height: 30,
                                  Assets.iconsIcDownlod,
                                ),
                              ),
                            ],
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
      ),
    );
  }
}

class VocalistList extends StatelessWidget {
  VocalistList({super.key, required this.provider});

  final BaseProvider provider;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 20.h,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            width: 100.w,
            height: 25.h,
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
                        fontSize: 6.25.w,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 0.1.w,
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Constants.primary2,
                      ),
                    ),
                    SizedBox(
                      width: 0.1.w,
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: provider.KasydaDetailsBody?.audio.length ?? 0,
                    itemBuilder: (context, index) {
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
                                fontSize: 5.w,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              width: 0.1.w,
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
                              width: 0.1.w,
                            ),
                          ],
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
    );
  }
}

class MenuModel extends StatelessWidget {
  MenuModel({super.key, required});
  @override
  Widget build(BuildContext context) {
    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) => Stack(
        children: [
          Positioned(
            bottom: 20.h,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              width: 100.w,
              height: 60.h,
              child: Padding(
                padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Provider.of<BaseProvider>(context, listen: false)
                            .saveDataToDataBase(
                          kasydaBody: Provider.of<BaseProvider>(
                            context,
                            listen: false,
                          ).KasydaDetailsBody!,
                        );
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcAddFav,
                              width: 35,
                              height: 35,
                            ),
                            Text(
                              'Favourite'.tr(),
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationStyle: TextDecorationStyle.wavy,
                                color: Constants.primary2,
                                fontSize: 18.sp,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: .5,
                      width: 80.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        // show simple dialog with yes or no buttons and two textfield one for title and one for content
                        Future(
                          () {
                            return showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) {
                                return FractionallySizedBox(
                                  widthFactor: .8,
                                  heightFactor: .5,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Constants.primary,
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      border: Border.fromBorderSide(
                                        BorderSide(
                                          width: 5,
                                          color: Constants.primary,
                                        ),
                                      ),
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      height: 50.h,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 4.h,
                                            width: double.infinity,
                                            color: Constants.primary,
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                            width: 100.w,
                                            child: Material(
                                              child: TextFormField(
                                                cursorRadius:
                                                    Radius.circular(10),
                                                controller: provider
                                                    .titleNoteController,
                                                cursorColor: Constants.primary,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'add_note_title'.tr(),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusColor: Constants.primary,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  hintStyle: TextStyle(
                                                    color: Color(0xff8C8C8C),
                                                    fontFamily: 'Cairo',
                                                  ),
                                                  suffixIcon: Visibility(
                                                    visible: provider
                                                            .titleNoteController
                                                            .text
                                                            .length >
                                                        0,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Constants.primary,
                                                      ),
                                                      onPressed: () {
                                                        provider
                                                            .titleNoteController
                                                            .clear();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 21.h,
                                            width: 100.w,
                                            child: Material(
                                              child: TextFormField(
                                                maxLines: 5,
                                                cursorRadius:
                                                    Radius.circular(10),
                                                controller: provider
                                                    .contentNoteController,
                                                cursorColor: Constants.primary,
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'add_note_content'.tr(),
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusColor: Constants.primary,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 3,
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  hintStyle: TextStyle(
                                                    color: Color(0xff8C8C8C),
                                                    fontFamily: 'Cairo',
                                                  ),
                                                  suffixIcon: Visibility(
                                                    visible: provider
                                                            .contentNoteController
                                                            .text
                                                            .length >
                                                        0,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.clear,
                                                        color:
                                                            Constants.primary,
                                                      ),
                                                      onPressed: () {
                                                        provider
                                                            .contentNoteController
                                                            .clear();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 9.h,
                                            color: Constants.primary,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: 30.w,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      if (provider
                                                          .titleNoteController
                                                          .text
                                                          .isEmpty) {
                                                        Utils()
                                                            .displayToastMessage(
                                                          'add_note_title'.tr(),
                                                        );
                                                        return;
                                                      }

                                                      if (provider
                                                          .contentNoteController
                                                          .text
                                                          .isEmpty) {
                                                        Utils()
                                                            .displayToastMessage(
                                                          'add_note_content'
                                                              .tr(),
                                                        );
                                                        return;
                                                      }

                                                      if (provider
                                                              .titleNoteController
                                                              .text
                                                              .isNotEmpty &&
                                                          provider
                                                              .contentNoteController
                                                              .text
                                                              .isNotEmpty) {
                                                        Navigator.of(context)
                                                            .pop();

                                                        provider
                                                            .saveNotesDataToDataBase(
                                                          noteBody: NoteBody(
                                                              title: provider
                                                                  .titleNoteController
                                                                  .text,
                                                              content: provider
                                                                  .contentNoteController
                                                                  .text,
                                                              kasydaBody:
                                                                  Provider.of<
                                                                      BaseProvider>(
                                                                context,
                                                                listen: false,
                                                              ).KasydaDetailsBody!),
                                                        );
                                                        provider
                                                            .titleNoteController
                                                            .clear();
                                                        provider
                                                            .contentNoteController
                                                            .clear();
                                                      }
                                                    },
                                                    child: Text(
                                                      'add_note'.tr(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.sp,
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        Constants.primary,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 30.w,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      provider
                                                          .titleNoteController
                                                          .clear();
                                                      provider
                                                          .contentNoteController
                                                          .clear();
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text(
                                                      'cancel'.tr(),
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.sp,
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                        Constants.primary,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      },
                      child: Container(
                        color: Colors.white,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              Assets.iconsIcAddComment,
                              width: 35,
                              height: 35,
                            ),
                            Text(
                              'Notes_add'.tr(),
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                decorationStyle: TextDecorationStyle.wavy,
                                color: Constants.primary2,
                                fontSize: 18.sp,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 0.1.h,
                    // ),
                    // Container(
                    //   height: .5,
                    //   width: 80.w,
                    //   color: Colors.grey,
                    // ),
                    // SizedBox(
                    //   height: 0.1.h,
                    // ),
                    // Row(
                    //   children: [
                    //     SvgPicture.asset(
                    //       Assets.iconsIcDownlodGreen,
                    //       width: 35,
                    //       height: 0.35.h,
                    //     ),
                    //     Text(
                    //       'download_without_internet'.tr(),
                    //       style: TextStyle(
                    //         decoration: TextDecoration.none,
                    //         decorationStyle: TextDecorationStyle.wavy,
                    //         color: Constants.primary2,
                    //         fontSize: 18.sp,
                    //         fontFamily: 'Cairo',
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: .5,
                      width: 80.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();

                        Future(
                          () {
                            return showDialog(
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (context) => FractionallySizedBox(
                                widthFactor: .9,
                                heightFactor: .55,
                                child: ShareDialog(),
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            Assets.iconsIcShareSet,
                            width: 35,
                            height: 35,
                          ),
                          Text(
                            'share_kasyda'.tr(),
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              decorationStyle: TextDecorationStyle.wavy,
                              color: Constants.primary2,
                              fontSize: 18.sp,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: .5,
                      width: 80.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'font_size'.tr(),
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            decorationStyle: TextDecorationStyle.wavy,
                            color: Constants.primary2,
                            fontSize: 18.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.primary,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
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
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Consumer<BaseProvider>(
                          builder:
                              (BuildContext context, provider, Widget? child) =>
                                  Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: provider.fontTransactionEffect
                                  ? Colors.white
                                  : Constants.primary2,
                              border: Border.all(
                                color: Constants.primary2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: provider.fontTransactionEffect
                                ? Center(
                                    child: Text(
                                      provider.fontSize.toString().toString(),
                                      style: TextStyle(
                                        fontSize: 20.sp,
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
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Container(
                          width: 70,
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Constants.primary,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
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
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      height: .5,
                      width: 80.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.h,
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
                            fontSize: 18.sp,
                            fontFamily: 'Cairo',
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
                                  SizedBox(
                            height: 3.5.h,
                            width: 70.w,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.fontColors.length,
                              itemBuilder: (_, i) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    provider.setFontColor(i);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: .3,
                                        color: Colors.grey,
                                      ),
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
                      height: 1.h,
                    ),
                    Container(
                      height: .5,
                      width: 80.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.h,
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
                            fontSize: 18.sp,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Container(
                          height: 20,
                          width: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 3.5.h,
                          width: 65.w,
                          child: Consumer<BaseProvider>(
                            builder: (
                              BuildContext context,
                              provider,
                              Widget? child,
                            ) =>
                                ListView.builder(
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemCount: provider.BGColors.length,
                              itemBuilder: (_, i) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: GestureDetector(
                                  onTap: () {
                                    provider.setBGColor(i);
                                  },
                                  child: Container(
                                    height: 35,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: .3,
                                        color: Colors.grey,
                                      ),
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
                      height: 1.h,
                    ),
                    Container(
                      height: .5,
                      width: 80.w,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ShareDialog extends StatelessWidget {
  ShareDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 0.14.h,
          ),
          Text(
            textAlign: TextAlign.center,
            'add_verses_to_share'.tr(),
            style: TextStyle(
              decoration: TextDecoration.none,
              decorationStyle: TextDecorationStyle.wavy,
              color: Constants.primary2,
              fontSize: 18.sp,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 0.1.h,
          ),
          Container(
            color: Colors.grey,
            height: .5,
            width: 80.w,
          ),
          SizedBox(
            height: 0.1.h,
          ),
          Expanded(
            child: Center(
              child: Consumer<BaseProvider>(
                builder: (BuildContext context, provider, Widget? child) =>
                    ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.KT.length,
                  itemBuilder: (_, i) => GestureDetector(
                    onTap: () {
                      provider.setVersesToShareList(provider.KT[i]);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
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
                          fontSize: 16.sp,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 0.1.h,
          ),
          Container(
            color: Colors.grey,
            height: .5,
            width: 80.w,
          ),
          SizedBox(
            height: 0.1.h,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Consumer<BaseProvider>(
                    builder: (BuildContext context, provider, Widget? child) =>
                        TextButton(
                      onPressed: () {
                        if (provider.versesToShareList.isEmpty) {
                          Utils().displayToastMessage(
                            'select_some_verses_to_share'.tr(),
                          );
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
                                  child: ShareDialog2(),
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
                            fontSize: 18.sp,
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
            height: 0.1.h,
          ),
        ],
      ),
    );
  }
}

class ShareDialog2 extends StatelessWidget {
  ShareDialog2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Consumer<BaseProvider>(
        builder: (BuildContext context, provider, Widget? child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.14.h,
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
                        fontSize: 20.sp,
                        fontFamily: 'Cairo',
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
                    decoration: BoxDecoration(
                      color: provider.shareDialogIndex == 1
                          ? Constants.primary
                          : Colors.white,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Constants.primary2),
                    ),
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'share_as_image'.tr(),
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        decorationStyle: TextDecorationStyle.wavy,
                        color: provider.shareDialogIndex == 1
                            ? Colors.white
                            : Constants.primary2,
                        fontSize: 20.sp,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 0.1.h,
            ),
            provider.shareDialogIndex == 0
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: provider.versesToShareList.length,
                              itemBuilder: (_, i) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 6),
                                child: Text(
                                  textAlign: TextAlign.center,
                                  provider.versesToShareList[i],
                                  style: TextStyle(
                                    decoration: TextDecoration.none,
                                    decorationStyle: TextDecorationStyle.wavy,
                                    color: Constants.shareTextColor,
                                    fontSize: 20.sp,
                                    fontFamily: 'Cairo',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'name_of_app'.tr(),
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Image.asset(
                                Assets.iconsNameApp,
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                'name_of_company'.tr(),
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 4,
                          child: SizedBox(
                            width: 90.w,
                            child: CarouselSlider(
                              carouselController: provider.carouselController,
                              options: CarouselOptions(
                                initialPage: provider.carouselIndex,
                                onPageChanged: (index, reason) {
                                  provider.setCarouselIndex(index);
                                },
                                enlargeFactor: 0,
                                enableInfiniteScroll: false,
                                viewportFraction: .6,
                              ),
                              items: Assets.paintingsShare.map((i) {
                                bool isSelected = (Assets.paintingsShare[
                                        provider.carouselIndex] ==
                                    i);
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        provider.carouselController
                                            .animateToPage(
                                          Assets.paintingsShare.indexOf(i),
                                        );
                                        provider.setCarouselIndex(
                                          Assets.paintingsShare.indexOf(i),
                                        );
                                      },
                                      child: Opacity(
                                        opacity: isSelected ? 1.0 : 0.5,
                                        // adjust the opacity based on selection
                                        child: Padding(
                                            padding: EdgeInsets.all(6.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    6,
                                                  ),
                                                  border: Border.all(
                                                    width: .5,
                                                    color: Constants.primary2,
                                                  ),
                                                ),
                                                child: Image.asset(
                                                  i,
                                                  fit: BoxFit.cover,
                                                ))),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),

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
                            itemCount: provider.versesToShareList.length,
                            itemBuilder: (_, i) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                textAlign: TextAlign.center,
                                provider.versesToShareList[i],
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  color: Constants.shareTextColor,
                                  fontSize: 20.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'name_of_app'.tr(),
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              Image.asset(
                                Assets.iconsNameApp,
                                width: 40,
                                height: 40,
                              ),
                              Text(
                                'name_of_company'.tr(),
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  decorationStyle: TextDecorationStyle.wavy,
                                  color: Colors.grey,
                                  fontSize: 12.sp,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
            SizedBox(
              height: 0.1.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        if (provider.shareDialogIndex == 0) {
                          provider.shareText(context);
                        } else {
                          provider.captureScreenShot(
                            context,
                            Assets.paintingsShare[provider.carouselIndex],
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
                            fontSize: 18.sp,
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
    );
  }
}
