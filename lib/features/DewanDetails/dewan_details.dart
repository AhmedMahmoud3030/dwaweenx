import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/features/KasydaDetails/kasyda_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/utils.dart';
import '../../core/widgets/customTextFormField.dart';
import '../../generated/assets.dart';
import '../provider.dart';

class DewanDetailsPage extends StatefulWidget {
  DewanDetailsPage({super.key});

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
                decoration: BoxDecoration(
                  color: Constants.bgColor,
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
                          color: Colors.transparent,
                          height: 9.h,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 2.w,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' ${'dewan'.tr()} ${provider.DewanDetailsScreenData[provider.dewanIndex!].nameT}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    // fontFamily: "Cairo",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  ' ${'number_of_poems'.tr()} ${provider.DewanDetailsScreenData[provider.dewanIndex!].kasaed.length} ${'poem'.tr()}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    // fontFamily: "Cairo",
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                provider.setKafyaIndex(null);
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                          ],
                        ),
                        Container(
                          height: 2.h,
                        ),
                        CustomTextFormFiled(
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
                        SizedBox(
                          height: 25.h,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: 90.w,
                          height: 17.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(
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
                                height: 2.h,
                                child: Row(
                                  children: [
                                    Text(
                                      'brief_about_dewan'.tr(),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Constants.primary,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: .5,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Utils().hasTextOverflow(
                                      provider
                                          .DewanDetailsScreenData[
                                              provider.dewanIndex!]
                                          .dec,
                                      TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 3,
                                      maxWidth: 20.w,
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
                                                        padding: EdgeInsets.all(
                                                            16.0),
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
                                    style: TextStyle(
                                      fontSize: 13.sp,
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          height: 4.h,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsIcKafya,
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                'kwafy'.tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Constants.primary2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              SizedBox(
                                width: .6.w,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: .6,
                                  width: double.infinity,
                                  color: Constants.primary2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 18.h,
                          width: 90.w,
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 6,
                              childAspectRatio: 1.8,
                            ),
                            itemCount: provider.kafya.length,
                            itemBuilder: (context, indexGrid) {
                              return Padding(
                                padding: EdgeInsets.all(3.0),
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
                                          : Color(0xffE9E9E9),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 0.1.h,
                                    width: 0.1.w,
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
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          height: 4.h,
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                Assets.iconsIcKsaed,
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                'poems'.tr(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Constants.primary2,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              SizedBox(
                                width: .6.w,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: .6,
                                  width: double.infinity,
                                  color: Constants.primary2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 31.5.h,
                          width: 100.h,
                          child: provider.dewanBodyLoading
                              ? SizedBox(
                                  width: 100.w,
                                  height: 100.h,
                                  child: Center(
                                    child: SpinKitCircle(
                                      color: Constants.primary,
                                    ),
                                  ),
                                )
                              : provider.KasaedDetailsScreenData.isEmpty
                                  ? Container(
                            width: 100.w,
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 3.33.w,
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
                                            alignment: Alignment.topRight,
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
                                    )
                                  : ListView.builder(
                            padding: EdgeInsets.zero,
                                      physics: BouncingScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: provider
                                          .KasaedDetailsScreenData.length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return InkWell(
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                horizontal: 2.5.w,
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
                                                    height: 6.25.w,
                                                    width: 6.25.w,
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.all(
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
                                                            fontSize: 5.w,
                                                            fontFamily: 'Cairo',
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.only(
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
                                                                TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      12.sp,
                                                                  fontFamily:
                                                                      'Cairo',
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 6.w,
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
                                                                TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize:
                                                                      12.sp,
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
