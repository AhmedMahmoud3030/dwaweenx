import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/features/KasydaDetails/kasyda_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/utils.dart';
import '../../core/widgets/customTextFormField.dart';
import '../../generated/assets.dart';
import '../provider.dart';

class DewanDetailsPage extends StatefulWidget {
  const DewanDetailsPage({super.key});

  @override
  State<DewanDetailsPage> createState() => _DewanDetailsPageState();
}

class _DewanDetailsPageState extends State<DewanDetailsPage> {
  @override
  void initState() {
    var x = Provider.of<BaseProvider>(context, listen: false);
    x.KasaedDetailsScreenData = x.DewanDetailsScreenData[x.dewanIndex!].kasaed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) {
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  color: Constants.bgColor,
                  image: DecorationImage(
                    image: AssetImage(Assets.paintingsBG),
                    fit: BoxFit.cover,
                  ),
                ),
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
                              width: 20,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' ${'dewan'.tr()} ${provider.DewanDetailsScreenData[provider.dewanIndex!].nameT}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    // fontFamily: "Cairo",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  ' ${'number_of_poems'.tr()} ${provider.DewanDetailsScreenData[provider.dewanIndex!].kasaed.length} ${'poem'.tr()}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    // fontFamily: "Cairo",
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                provider.setKafyaIndex(null);
                              },
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Container(
                          height: 20,
                        ),
                        CustomTextFormFiled(
                          mediaQuery: mediaQuery,
                          textEditingController: provider.kafyaController,
                          onChanged: (value) {
                            provider.filterByKasyda();
                          },
                          searchText: 'search_in_poems',
                          onPressed: () {
                            provider.kafyaController.clear();
                            provider.filterByKasyda();
                          },
                          onFieldSubmitted: (value) {},
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          height: 220,
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          width: mediaQuery.width * .9,
                          height: mediaQuery.height * .17,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                  0,
                                  3,
                                ), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                                child: Row(
                                  children: [
                                    Text(
                                      'brief_about_dewan'.tr(),
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Constants.primary,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        height: .5,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Utils().hasTextOverflow(
                                      provider
                                          .DewanDetailsScreenData[
                                              provider.dewanIndex!]
                                          .dec,
                                      const TextStyle(
                                        fontSize: 13,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 3,
                                      maxWidth: 200,
                                    )
                                        ? showDialog(
                                            context: context,
                                            builder: (context) {
                                              return Center(
                                                child: Hero(
                                                  tag: provider
                                                      .DewanDetailsScreenData[
                                                          provider.dewanIndex!]
                                                      .dec,
                                                  child: SimpleDialog(
                                                    backgroundColor:
                                                        Colors.white,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Text(
                                                          provider
                                                              .DewanDetailsScreenData[
                                                                  provider
                                                                      .dewanIndex!]
                                                              .dec,
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : null;
                                  },
                                  child: Text(
                                    provider
                                        .DewanDetailsScreenData[
                                            provider.dewanIndex!]
                                        .dec,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          height: 40,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsIcKafya,
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                'kwafy'.tr(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Constants.primary2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: .6,
                                  width: double.infinity,
                                  color: Constants.primary2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          // padding: EdgeI nsets.symmetric(horizontal: 8, vertical: 6),
                          height: mediaQuery.height * .18,
                          width: mediaQuery.width * .9,
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              childAspectRatio: 1.8,
                            ),
                            itemCount: provider.kafya.length,
                            itemBuilder: (context, indexGrid) {
                              return Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: GestureDetector(
                                  onTap: () {
                                    provider.setKafyaIndex(
                                      provider.kafyaIndex == indexGrid
                                          ? null
                                          : indexGrid,
                                    );
                                    provider.filterByKasyda();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: indexGrid == provider.kafyaIndex
                                          ? Constants.primary
                                          : const Color(0xffE9E9E9),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 10,
                                    width: 10,
                                    child: Center(
                                      child: Text(
                                        provider.kafya[indexGrid],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color:
                                              indexGrid == provider.kafyaIndex
                                                  ? Colors.white
                                                  : Constants.primary2,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          height: 40,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsIcKsaed,
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                'poems'.tr(),
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Constants.primary2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  height: .6,
                                  width: double.infinity,
                                  color: Constants.primary2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaQuery.height / 1.55,
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
                              : provider.KasaedDetailsScreenData.isEmpty
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
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            color: Colors.white,
                                          ),
                                          child: Align(
                                            alignment: Alignment.topRight,
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
                                      physics: const BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: provider
                                          .KasaedDetailsScreenData.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal:
                                                    mediaQuery.width / 40,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    Assets.iconsIcKsaed,
                                                    height:
                                                        mediaQuery.width / 16,
                                                    width:
                                                        mediaQuery.width / 16,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                      8.0,
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                          provider
                                                              .KasaedDetailsScreenData[
                                                                  index]
                                                              .nameT,
                                                          style: TextStyle(
                                                            color: Constants
                                                                .primary2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: mediaQuery
                                                                    .width /
                                                                20,
                                                            fontFamily: 'Cairo',
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                            top: 8.0,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                textScaleFactor:
                                                                    .9,
                                                                Utils()
                                                                    .splitToGetFirstTwoWords(
                                                                      provider
                                                                          .KasaedDetailsScreenData[
                                                                              index]
                                                                          .kaseydaT,
                                                                    )
                                                                    .first,
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: mediaQuery
                                                                        .width *
                                                                    .06,
                                                              ),
                                                              Text(
                                                                textScaleFactor:
                                                                    .9,
                                                                Utils()
                                                                    .splitToGetFirstTwoWords(
                                                                      provider
                                                                          .KasaedDetailsScreenData[
                                                                              index]
                                                                          .kaseydaT,
                                                                    )
                                                                    .last,
                                                                style:
                                                                    const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                ),
                                                              ),
                                                            ],
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
                                                  provider.KasaedDetailsScreenData[
                                                      index],
                                                  context.locale.languageCode,
                                                )
                                                .then(
                                                  (value) =>
                                                      provider.splitKasyda(),
                                                );
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    KasydaDetails(),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                        ),
                      ],
                    ),
                    //
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
