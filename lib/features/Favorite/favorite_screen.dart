import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants.dart';
import '../../core/utils.dart';
import '../../core/widgets/customTextFormField.dart';
import '../../features/KasydaDetails/kasyda_details.dart';
import '../../features/provider.dart';
import '../../generated/assets.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    Provider.of<BaseProvider>(context, listen: false).readDataFromDataBase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
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
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Favourite'.tr(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 4.w,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: .10.h,
                  ),
                  Consumer<BaseProvider>(
                    builder: (BuildContext context, provider, Widget? child) {
                      return CustomTextFormFiled(
                        textEditingController: provider.favoriteController,
                        onChanged: (value) {},
                        searchText: 'search_in_dwaween',
                        onPressed: () {
                          provider.favoriteController.clear();
                        },
                        onFieldSubmitted: (value) {
                          provider.favoriteController.clear();
                          provider.dewanController.text = value;

                          provider.setSelectedIndex(index: 1);
                          provider.searchDewanMethod(searchValue: value);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: .20.h,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 25),
                        width: 85.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Constants.primary,
                          border: Border.all(
                            color: Constants.primary,
                            width: .5,
                          ),
                        ),
                      ),
                      Container(
                        width: 75.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          border: Border.all(
                            color: Constants.primary,
                            width: .5,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: 80.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                          border: Border.all(
                            color: Constants.primary,
                            width: .5,
                          ),
                        ),
                      ),
                      Consumer<BaseProvider>(
                        builder: (context, provider, child) {
                          return Container(
                            margin: EdgeInsets.only(top: 20),
                            width: 85.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Colors.white,
                              border: Border.all(
                                color: Constants.primary,
                                width: .5,
                              ),
                            ),
                            child: Column(
                              children: [
                                provider.favoriteListData.isEmpty
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.iconsIcKsaed,
                                              width: 30,
                                              height: 20,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              'no_data_in_favorite'.tr(),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 4.w,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : ListView.separated(
                                        shrinkWrap: true,
                                        itemCount:
                                            provider.favoriteListData.length,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, i) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: SvgPicture.asset(
                                                Assets.iconsIcKsaed,
                                                width: 35,
                                                height: 35,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: GestureDetector(
                                                onTap: () {
                                                  if (provider.favoriteListData
                                                      .isNotEmpty) {
                                                    provider
                                                        .setKasydaDetailsBody(
                                                      provider
                                                          .favoriteListData[i],
                                                      context
                                                          .locale.languageCode,
                                                    )
                                                        .whenComplete(() {
                                                      provider.splitKasyda();
                                                    }).whenComplete(
                                                      () =>
                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              KasydaDetails(),
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Center(
                                                  child: Text(
                                                    provider.favoriteListData[i]
                                                        .nameT,
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 4.w,
                                                      fontFamily: 'Cairo',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Center(
                                                child: IconButton(
                                                  onPressed: () {
                                                    provider
                                                        .deleteDataFromDataBase(
                                                      id: provider
                                                          .favoriteListData[i]
                                                          .id,
                                                    )
                                                        .whenComplete(
                                                      () {
                                                        Utils()
                                                            .displayToastMessage(
                                                          'kasyda_deleted_successfully'
                                                              .tr(),
                                                        );
                                                      },
                                                    );
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        separatorBuilder:
                                            (BuildContext context, int index) =>
                                                Container(
                                          margin: EdgeInsets.only(
                                            left: .10.w,
                                            right: .10.w,
                                          ),
                                          height: .5,
                                          color: Colors.grey,
                                        ),
                                      ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
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
