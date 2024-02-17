import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/core/widgets/customTextFormField.dart';
import 'package:dwaweenx/features/provider.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
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
                        'Notes'.tr(),
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
                    height: 0.1.h,
                  ),
                  Consumer<BaseProvider>(
                    builder: (BuildContext context, provider, Widget? child) {
                      return CustomTextFormFiled(
                        textEditingController: provider.noteController,
                        onChanged: (value) {},
                        searchText: 'search_in_dwaween',
                        onPressed: () {
                          provider.noteController.clear();
                        },
                        onFieldSubmitted: (value) {
                          provider.noteController.clear();
                          provider.dewanController.text = value;

                          provider.setSelectedIndex(index: 1);
                          provider.searchDewanMethod(searchValue: value);
                        },
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
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
                                provider.notesListData.isEmpty
                                    ? Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              Assets.iconsIcAddComment,
                                              width: 30.w,
                                              height: 20.h,
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              'no_data_in_notes'.tr(),
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
                                            provider.notesListData.length,
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
                                                Assets.iconsIcAddComment,
                                                width: 35,
                                                height: 0.35.h,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 6,
                                              child: GestureDetector(
                                                child: Center(
                                                  child: Text(
                                                    provider.notesListData[i]
                                                        .content,
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
                                                        .deleteNotesDataFromDataBase(
                                                      id: provider
                                                          .notesListData[i]
                                                          .title,
                                                    )
                                                        .whenComplete(
                                                      () {
                                                        Utils()
                                                            .displayToastMessage(
                                                          'notes_deleted_successfully'
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
                                            left: 10,
                                            right: 10,
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
