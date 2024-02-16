import 'package:dwaweenx/Features/provider.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/features/KasydaDetails/kasyda_details.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../core/widgets/customTextFormField.dart';
import '../../generated/assets.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (BuildContext context) => BaseProvider(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: mediaQuery.height,
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
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Favourite'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaQuery.width / 25,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Consumer<BaseProvider>(
                      builder: (BuildContext context, provider, Widget? child) {
                        return CustomTextFormFiled(
                          mediaQuery: mediaQuery,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: mediaQuery.width * .85,
                          height: mediaQuery.height * .6,
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
                          width: mediaQuery.width * .75,
                          height: mediaQuery.height * .6,
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
                          margin: const EdgeInsets.only(top: 10),
                          width: mediaQuery.width * .8,
                          height: mediaQuery.height * .6,
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
                          builder: (context, provider, child) => Container(
                            margin: const EdgeInsets.only(top: 20),
                            width: mediaQuery.width * .85,
                            height: mediaQuery.height * .6,
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
                                ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: provider.favoriteListData.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) => Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          provider
                                              .setKasydaDetailsBody(
                                                provider.favoriteListData[i],
                                                context.locale.languageCode,
                                              )
                                              .whenComplete(
                                                () => Navigator.of(context)
                                                    .pushReplacement(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        KasydaDetails(),
                                                  ),
                                                ),
                                              );
                                        },
                                        child: Expanded(
                                          flex: 8,
                                          child: Center(
                                            child: Text(
                                              provider
                                                  .favoriteListData[i].nameT,
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: mediaQuery.width / 25,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.bold,
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
                                                    .favoriteListData[i].id,
                                              )
                                                  .then(
                                                (value) {
                                                  if (value) {
                                                    Utils().displayToastMessage(
                                                      'kasyda_deleted_successfully'
                                                          .tr(),
                                                    );
                                                  }
                                                },
                                              );
                                            },
                                            icon: const Icon(
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
                                    margin: const EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    height: .5,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
