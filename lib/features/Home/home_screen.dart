import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgets/customTextFormField.dart';
import 'package:dwaweenx/features/DewanDetails/dewan_details.dart';
import 'package:dwaweenx/features/KasayedByCategory/kasayed_by_category.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Stack(
        children: [
          Container(
            width: 100.0.w,
            height: 30.0.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  scale: 5.0,
                  image: AssetImage(Assets.logo_home),
                ),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(70),
                ),
                color: Constants.primary),
          ),
          Consumer<BaseProvider>(
            builder: (BuildContext context, provider, Widget? child) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: Colors.transparent,
                  height: 25.h,
                ),
                CustomTextFormFiled(
                  textEditingController: provider.homeController,
                  onChanged: (value) {
                    provider.searchHomeMethod(searchValue: value);
                  },
                  searchText: 'search_in_dwaween',
                  onPressed: () {
                    provider.homeController.clear();
                    provider.searchHomeMethod(searchValue: '');
                  },
                  onFieldSubmitted: (value) {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: provider.dewanBodyLoading
                        ? Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: 50.h,
                              ),
                              width: 100.w,
                              height: 100.h,
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
                                    ? 2.h
                                    : 0,
                              ),
                              Visibility(
                                visible: provider.homeController.text.isEmpty,
                                child: Consumer<BaseProvider>(
                                  builder: (
                                    BuildContext context,
                                    provider,
                                    Widget? child,
                                  ) =>
                                      StreamBuilder<Duration>(
                                    stream:
                                        provider.cardAudioPlayer.positionStream,
                                    builder: (context, snapshot) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xff51DECF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: 24.6305419.h,
                                        width: 92.w,
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(
                                              Assets.paintings1,
                                              height: 24.3902439.h,
                                              width: 92.w,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 20,
                                                vertical: 10,
                                              ),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Audible_poems'
                                                                .tr(),
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  'Cairo',
                                                            ),
                                                          ),
                                                          Text(
                                                            context.locale
                                                                        .languageCode ==
                                                                    'ar'
                                                                ? provider
                                                                        .cardData
                                                                        ?.titleAr ??
                                                                    ''
                                                                : provider
                                                                        .cardData
                                                                        ?.titleEn ??
                                                                    '',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontFamily:
                                                                  'Cairo',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Spacer(),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: ProgressBar(
                                                          barHeight: 2,
                                                          baseBarColor:
                                                              Colors.grey[600],
                                                          bufferedBarColor:
                                                              Colors.white,
                                                          progressBarColor:
                                                              Colors.teal[600],
                                                          thumbColor:
                                                              Colors.white,
                                                          thumbGlowRadius: 8,
                                                          thumbGlowColor:
                                                              Colors.teal[600],
                                                          thumbRadius: 5,
                                                          timeLabelTextStyle:
                                                          TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                          progress: provider
                                                              .cardAudioPlayer
                                                              .position,
                                                          buffered: provider
                                                              .cardAudioPlayer
                                                              .bufferedPosition,
                                                          total: provider
                                                                  .cardAudioPlayer
                                                                  .duration ??
                                                              Duration.zero,
                                                          onSeek: provider
                                                              .cardAudioPlayer
                                                              .seek,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 0.1.h,
                                                  ),
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        child: Text(
                                                          context.locale
                                                                      .languageCode ==
                                                                  'ar'
                                                              ? provider
                                                                      .cardData
                                                                      ?.sheikhAr ??
                                                                  ''
                                                              : provider
                                                                      .cardData
                                                                      ?.sheikhEn ??
                                                                  '',
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Spacer(),
                                                      IconButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onPressed: () {
                                                          if (provider
                                                              .cardIsPlaying) {
                                                            provider
                                                                .pauseCardAudio();
                                                          } else {
                                                            provider
                                                                .playCardAudio();
                                                          }
                                                        },
                                                        icon: provider
                                                                .cardIsPlaying
                                                            ? SvgPicture.asset(
                                                                Assets
                                                                    .iconsIcPause,
                                                                width: 40,
                                                                height: 40,
                                                              )
                                                            : SvgPicture.asset(
                                                                Assets
                                                                    .iconsIcPlay,
                                                                width: 40,
                                                                height: 40,
                                                              ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              SizedBox(
                                height: 7.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    SvgPicture.asset(
                                      Assets.iconsIcDwawenTit,
                                      height: 8.33333333.w,
                                      width: 8.33333333.w,
                                    ),
                                    Text(
                                      'dwaween'.tr(),
                                      style: TextStyle(
                                        color: Color(0xff1C7F88),
                                        fontSize: 4.w,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 47.6190476.w,
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
                                        'view_all'.tr(),
                                        style: TextStyle(
                                          color: Color(0xff1C7F88),
                                          fontSize: 4.w,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: mediaQuery.height * .000001,
                              // ),
                              Visibility(
                                visible: provider.HomeScreenData.isNotEmpty
                                    ? false
                                    : true,
                                child: Container(
                                  width: 100.w,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 3.33333333.w,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
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
                                            fontSize: 16.sp,
                                            color: Colors.teal,
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: provider.HomeScreenData.isNotEmpty
                                    ? true
                                    : false,
                                child: ListView.builder(
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
                                        onTap: provider.HomeScreenData[index]
                                                .kasaed.isNotEmpty
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
                                                  'there_is_no_Kasayed'.tr(),
                                                );
                                              },
                                        child: Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              color: Colors.white,
                                            ),
                                            child: ListTile(
                                              leading: SvgPicture.asset(
                                                Assets.iconsIcKsaed,
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
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    'number_of_poems'.tr(),
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                  Text('  '),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom: 4.0,
                                                    ),
                                                    child: Text(
                                                      context.locale
                                                                  .languageCode ==
                                                              'ar'
                                                          ? Utils()
                                                              .convertToArabicNumber(
                                                              provider
                                                                  .HomeScreenData[
                                                                      index]
                                                                  .kasaed
                                                                  .length
                                                                  .toString(),
                                                            )
                                                          : provider
                                                              .HomeScreenData[
                                                                  index]
                                                              .kasaed
                                                              .length
                                                              .toString(),
                                                      style: TextStyle(
                                                        color: Colors.grey,
                                                        fontFamily: 'Cairo',
                                                      ),
                                                    ),
                                                  ),
                                                  Text('  '),
                                                  Text(
                                                    'poem'.tr(),
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: provider.HomeScreenData.length > 15
                                      ? 15
                                      : provider.HomeScreenData.length,
                                ),
                              ),
                              // SizedBox(
                              //   height: 0.1.h,
                              // ),
                              SizedBox(
                                height: 3.5.h,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    SvgPicture.asset(
                                      Assets.iconsIcKsaed,
                                      height: 8.33333333.w,
                                      width: 8.33333333.w,
                                    ),
                                    Text(
                                      'poems'.tr(),
                                      style: TextStyle(
                                        color: Color(0xff1C7F88),
                                        fontSize: 4.w,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 47.6190476.w,
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
                                        'view_all'.tr(),
                                        style: TextStyle(
                                          color: Color(0xff1C7F88),
                                          fontSize: 4.w,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: provider.groupedBy.isNotEmpty
                                    ? false
                                    : true,
                                child: Container(
                                  width: 100.w,
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 3.33333333.w,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
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
                                            fontSize: 16.sp,
                                            color: Colors.teal,
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: provider.groupedBy.isNotEmpty
                                    ? true
                                    : false,
                                child: GridView.builder(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 3.33333333.w,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 2,
                                  ),
                                  itemCount: provider.groupedBy.length > 15
                                      ? 15
                                      : provider.groupedBy.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      margin: EdgeInsets.all(6),
                                      child: InkWell(
                                        onTap: provider.groupedBy[index].kenshat
                                                .isNotEmpty
                                            ? () {
                                                provider.setGroupByPurposeIndex(
                                                  index,
                                                );
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        KasaedByCategoryScreen(),
                                                  ),
                                                );
                                              }
                                            : null,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 0.15.h,
                                              ),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 6,
                                                  ),
                                                  SvgPicture.asset(
                                                    Assets.iconsIcKsaed,
                                                    height: 25,
                                                    width: 25,
                                                  ),
                                                  SizedBox(
                                                    width: 0.1.w,
                                                  ),
                                                  Text(
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    provider.groupedBy[index]
                                                        .purpose,
                                                    style: TextStyle(
                                                      color: Colors.teal,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: .5.h,
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  right: 22,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber(provider.groupedBy[index].kenshat.length.toString()) : provider.groupedBy[index].kenshat.length}  ${'poem'.tr()}",
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: 'Cairo',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
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
