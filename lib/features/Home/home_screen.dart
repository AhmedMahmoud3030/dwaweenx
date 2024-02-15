import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgits/customTextFormField.dart';
import 'package:dwaweenx/features/DewanDetails/view.dart';
import 'package:dwaweenx/features/KasayedByCategory/kasayed_by_category.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:dwaweenx/generated/assets.dart';
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
            Assets.paintingsImgHeadHome,
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
                  onFieldSubmitted: (value) {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: provider.dewanBodyLoading
                        ? Center(
                            child: Container(
                              padding: EdgeInsets.only(
                                bottom: mediaQuery.height / 2,
                              ),
                              width: mediaQuery.width,
                              height: mediaQuery.height,
                              child: const Center(
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
                                          color: const Color(0xff51DECF),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        height: mediaQuery.height / 4.06,
                                        width: mediaQuery.width * .92,
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(
                                              Assets.paintings1,
                                              height: mediaQuery.height / 4.1,
                                              width: mediaQuery.width * .92,
                                              fit: BoxFit.fill,
                                            ),
                                            Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                            style:
                                                                const TextStyle(
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
                                                            style:
                                                                const TextStyle(
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
                                                  const Spacer(),
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
                                                              const TextStyle(
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
                                                  const SizedBox(
                                                    height: 10,
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
                                                          style:
                                                              const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      const Spacer(),
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
                                height: mediaQuery.height * .02,
                              ),
                              SizedBox(
                                height: mediaQuery.height * .07,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: mediaQuery.width / 25,
                                    ),
                                    SvgPicture.asset(
                                      Assets.iconsIcDwawenTit,
                                      height: mediaQuery.width / 12,
                                      width: mediaQuery.width / 12,
                                    ),
                                    Text(
                                      'dwaween'.tr(),
                                      style: TextStyle(
                                        color: const Color(0xff1C7F88),
                                        fontSize: mediaQuery.width / 25,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: mediaQuery.width / 2.1,
                                      child: const Divider(
                                        color: Colors.teal,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    const Spacer(),
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
                                          color: Colors.teal,
                                          fontSize: mediaQuery.width / 25,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                visible: provider.HomeScreenData.isNotEmpty
                                    ? false
                                    : true,
                                child: Container(
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
                                ),
                              ),
                              Visibility(
                                visible: provider.HomeScreenData.isNotEmpty
                                    ? true
                                    : false,
                                child: ListView.builder(
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
                                          padding: const EdgeInsets.all(4.0),
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
                                                  style: const TextStyle(
                                                    color: Colors.teal,
                                                    fontFamily: 'Cairo',
                                                  ),
                                                ),
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    'number_of_poems'.tr(),
                                                    style: const TextStyle(
                                                      color: Colors.teal,
                                                    ),
                                                  ),
                                                  const Text('  '),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
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
                                                      style: const TextStyle(
                                                        color: Colors.teal,
                                                        fontFamily: 'Cairo',
                                                      ),
                                                    ),
                                                  ),
                                                  const Text('  '),
                                                  Text(
                                                    'poem'.tr(),
                                                    style: const TextStyle(
                                                      color: Colors.teal,
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
                              //   height: 10,
                              // ),
                              SizedBox(
                                height: 35,
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: mediaQuery.width / 25,
                                    ),
                                    SvgPicture.asset(
                                      Assets.iconsIcKsaed,
                                      height: mediaQuery.width / 12,
                                      width: mediaQuery.width / 12,
                                    ),
                                    Text(
                                      'poems'.tr(),
                                      style: TextStyle(
                                        color: Colors.teal,
                                        fontSize: mediaQuery.width / 20,

                                        // fontFamily: "Cairo",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    SizedBox(
                                      width: mediaQuery.width / 2.1,
                                      child: const Divider(
                                        color: Colors.teal,
                                        thickness: 1.5,
                                      ),
                                    ),
                                    const Spacer(),
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
                                          color: Colors.teal,
                                          fontSize: mediaQuery.width / 25,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: mediaQuery.width / 25,
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: provider.groupedBy.isNotEmpty
                                    ? false
                                    : true,
                                child: Container(
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
                                ),
                              ),
                              Visibility(
                                visible: provider.groupedBy.isNotEmpty
                                    ? true
                                    : false,
                                child: GridView.builder(
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
                                    return Card(
                                      margin: const EdgeInsets.all(6),
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
                                                        const KasaedByCategoryScreen(),
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
                                              const SizedBox(
                                                height: 15,
                                              ),
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
                                                  Text(
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    provider.groupedBy[index]
                                                        .purpose,
                                                    style: const TextStyle(
                                                      color: Colors.teal,
                                                      fontFamily:
                                                          'Amiri Regular',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  right: 22,
                                                ),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Text(
                                                    "${context.locale.languageCode == 'ar' ? Utils().convertToArabicNumber(provider.groupedBy[index].kenshat.length.toString()) : provider.groupedBy[index].kenshat.length}  ${'poem'.tr()}",
                                                    style: const TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily:
                                                          'Amiri Regular',
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
