import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../core/widgets/customTextFormField.dart';
import '../provider.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Consumer<BaseProvider>(
      builder: (BuildContext context, provider, Widget? child) =>
          GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
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
                      width: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'shikkh'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaQuery.width / 25,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'shikkh_name'.tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: mediaQuery.width / 25,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  height: mediaQuery.height * .02,
                ),
                CustomTextFormFiled(
                  mediaQuery: mediaQuery,
                  textEditingController: provider.aboutController,
                  onChanged: (value) {},
                  searchText: 'search_in_dwaween',
                  onPressed: () {
                    provider.aboutController.clear();
                  },
                  onFieldSubmitted: (value) {
                    provider.aboutController.clear();
                    provider.dewanController.text = value;

                    provider.setSelectedIndex(index: 1);
                    provider.searchDewanMethod(searchValue: value);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'his_birth_and_upbringing'.tr(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Constants.primary2,
                                      fontSize: 18,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  Container(
                                    width: double.infinity,
                                    height: .8,
                                    color: Constants.primary2,
                                  ),
                                  Text(
                                    'brief_about_him'.tr(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Image.asset(
                                Assets.paintingsShikh,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'his_elders'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.primary2,
                                fontSize: 18,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: .8,
                              color: Constants.primary2,
                            ),
                            Text(
                              'his_elders_brief'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'scholars_granted_him_permission'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.primary2,
                                fontSize: 18,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: .8,
                              color: Constants.primary2,
                            ),
                            Text(
                              'there_are_very_many'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_1'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_2'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_3'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_4'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_5'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_6'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_7'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_8'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_9'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_10'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_11'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_12'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_13'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            Text(
                              'scholars_14'.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ],
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
