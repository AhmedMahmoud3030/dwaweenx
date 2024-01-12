import 'package:dwaweenx/core/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../core/utils.dart';
import '../../core/widgits/customTextFormField.dart';
import '../provider.dart';

class DewanDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

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
                    image: AssetImage('assets/images/paintings/BG.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/img/banner2.svg",
                      alignment: Alignment.topCenter,
                      width: MediaQuery.of(context).size.width * 4,
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                    Column(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: mediaQuery.size.height * .09,
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
                                  ' ${'dewan'.tr()} ${provider.dewanBody!.dawawen[provider.dewanIndex!].nameT}',
                                  style: TextStyle(
                                    fontSize: 14,
                                    // fontFamily: "Cairo",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                    ' ${'number_of_poems'.tr()} ${provider.dewanBody!.dawawen[provider.dewanIndex!].kasaed.length} ${'poem'.tr()}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      // fontFamily: "Cairo",
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                provider.setKafyaIndex(null);
                                provider.filterByKasyda();
                              },
                              child: Icon(
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
                            provider.setkasydaScreenText(value);
                            provider.filterByKasyda();
                          },
                          searchText: 'search_in_poems',
                          onPressed: () {
                            provider.kafyaController.clear();
                            provider.setkasydaScreenText('');
                            provider.filterByKasyda();
                          },
                          onFieldSubmitted: (String) {},
                        ),
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 220,
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          width: mediaQuery.size.width * .9,
                          height: mediaQuery.size.height * .17,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 20,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${'brief_about_dewan'.tr()}",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Constants.primary,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Cairo"),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin: EdgeInsets.only(top: 10),
                                        height: .5,
                                        width: double.infinity,
                                        color: Colors.grey,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Utils().hasTextOverflow(
                                      provider
                                              .dewanBody!
                                              .dawawen[provider.dewanIndex!]
                                              .dec,
                                      TextStyle(
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
                                                          .dewanBody!
                                                          .dawawen[provider
                                                              .dewanIndex!]
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
                                                                  .dewanBody!
                                                                  .dawawen[provider
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
                                            .dewanBody!
                                            .dawawen[provider.dewanIndex!]
                                            .dec,
                                    style: TextStyle(
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
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/ic_kafya.svg",
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                "${'kwafy'.tr()}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Constants.primary2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo"),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: .6,
                                  width: double.infinity,
                                  color: Constants.primary2,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          // padding: EdgeI nsets.symmetric(horizontal: 8, vertical: 6),
                          height: mediaQuery.size.height * .18,
                          width: mediaQuery.size.width * .9,
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
                                            : Color(0xffE9E9E9),
                                        borderRadius: BorderRadius.circular(5)),
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
                                                  : Constants.primary2),
                                    )),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 25),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/ic_ksaed.svg",
                                height: 30,
                                width: 30,
                              ),
                              Text(
                                "${'poems'.tr()}",
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Constants.primary2,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo"),
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: .6,
                                  width: double.infinity,
                                  color: Constants.primary2,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: mediaQuery.size.height / 1.55,
                          width: mediaQuery.size.height,
                          child: provider.dewanBodyLoading
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                      child: SpinKitCircle(
                                    color: Constants.primary,
                                  )),
                                )
                              : provider
                                      .dewanBody!
                                      .dawawen[provider.dewanIndex!]
                                      .kasaed
                                      .isEmpty
                                  ? Container(
                                      width: mediaQuery.size.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal:
                                              mediaQuery.size.width / 30),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
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
                                                fontSize: 16,
                                                color: Colors.teal,
                                                fontFamily: "Cairo",
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
                                          .dewanBody!
                                          .dawawen[provider.dewanIndex!]
                                          .kasaed
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal:
                                                      mediaQuery.size.width /
                                                          40),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SvgPicture.asset(
                                                    "assets/images/icons/ic_ksaed.svg",
                                                    height:
                                                        mediaQuery.size.width /
                                                            16,
                                                    width:
                                                        mediaQuery.size.width /
                                                            16,
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                  .dewanBody!
                                                                  .dawawen[provider
                                                                      .dewanIndex!]
                                                                  .kasaed[index]
                                                                  .nameT,
                                                          style: TextStyle(
                                                            color: Constants
                                                                .primary2,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: mediaQuery
                                                                    .size
                                                                    .width /
                                                                20,
                                                            fontFamily: "Cairo",
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 8.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                textScaleFactor:
                                                                    .9,
                                                                Utils()
                                                                    .splitToGetFirstTwoWords(provider
                                                                        .dewanBody!
                                                                        .dawawen[provider
                                                                            .dewanIndex!]
                                                                        .kasaed[
                                                                            index]
                                                                        .kaseydaT)
                                                                    .first,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "Cairo",
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: mediaQuery
                                                                        .size
                                                                        .width *
                                                                    .06,
                                                              ),
                                                              Text(
                                                                textScaleFactor:
                                                                    .9,
                                                                Utils()
                                                                    .splitToGetFirstTwoWords(provider
                                                                        .dewanBody!
                                                                        .dawawen[provider
                                                                            .dewanIndex!]
                                                                        .kasaed[
                                                                            index]
                                                                        .kaseydaT)
                                                                    .last,
                                                                style:
                                                                    TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      "Cairo",
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            // provider.setKafya(index);
                                          },
                                        );
                                      },
                                    ),
                        ),
                      ],
                    )
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

// class ExpandableText extends StatefulWidget {
//   const ExpandableText(
//     this.text, {
//     Key? key,
//     this.trimLines = 2,
//   }) : super(key: key);

//   final String text;
//   final int trimLines;

//   @override
//   ExpandableTextState createState() => ExpandableTextState();
// }

// class ExpandableTextState extends State<ExpandableText> {
//   bool _readMore = true;
//   void _onTapLink() {
//     setState(() => _readMore = !_readMore);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final colorClickableText = Colors.blue;
//     final widgetColor = Colors.black;
//     TextSpan link = TextSpan(
//         text: _readMore ? "... اقرأ المزيد" : "  اقرأ أقل",
//         style: TextStyle(color: colorClickableText, fontFamily: "Cairo"),
//         recognizer: TapGestureRecognizer()..onTap = _onTapLink);
//     Widget result = LayoutBuilder(
//       builder: (BuildContext context, BoxConstraints constraints) {
//         assert(constraints.hasBoundedWidth);
//         final double maxWidth = constraints.maxWidth;
//         // Create a TextSpan with data
//         final text = TextSpan(
//           text: widget.text,
//         );
//         // Layout and measure link
//         TextPainter textPainter = TextPainter(
//           text: link,
//           maxLines: widget.trimLines,
//           ellipsis: '...',
//         );
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         final linkSize = textPainter.size;
//         // Layout and measure text
//         textPainter.text = text;
//         textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
//         final textSize = textPainter.size;
//         // Get the endIndex of data
//         int endIndex;
//         final pos = textPainter.getPositionForOffset(Offset(
//           textSize.width - linkSize.width,
//           textSize.height,
//         ));
//         endIndex = textPainter.getOffsetBefore(pos.offset)!;
//         var textSpan;
//         if (textPainter.didExceedMaxLines) {
//           textSpan = TextSpan(
//             text: _readMore ? widget.text.substring(0, endIndex) : widget.text,
//             style: TextStyle(color: widgetColor, fontFamily: "Cairo"),
//             children: <TextSpan>[link],
//           );
//         } else {
//           textSpan = TextSpan(
//             text: widget.text,
//           );
//         }
//         return RichText(
//           softWrap: true,
//           overflow: TextOverflow.clip,
//           text: textSpan,
//           textAlign: TextAlign.right,
//         );
//       },
//     );
//     return result;
//   }
// }
