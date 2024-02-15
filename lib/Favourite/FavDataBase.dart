import 'package:dwaweenx/Models/FavModel.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/help/database_helper_fav.dart';
import 'package:dwaweenx/core/nav.dart';
import 'package:dwaweenx/features/KasydaDetails/kasyda_details.dart';
import 'package:dwaweenx/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavDataBase extends StatefulWidget {
  const FavDataBase({super.key});

  @override
  State<FavDataBase> createState() => _FavDataBaseState();
}

String SearchValue = '';
var filtared;
var items;

final scaffoldKey = GlobalKey<ScaffoldState>();

TextEditingController controllerTitle = TextEditingController();
TextEditingController controllerDesc = TextEditingController();

class _FavDataBaseState extends State<FavDataBase> {
  DatabaseHelperFavourite dbFav = DatabaseHelperFavourite();
  List<FavModel> allFav = <FavModel>[];

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  getAllData() async {
    allFav = <FavModel>[];
    await dbFav.getAllFav().then((duaaModels) {
      setState(() {
        duaaModels.forEach((duaaModel) {
          allFav.add(FavModel.fromMap(duaaModel));
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 250, 250, 234),
          child: Stack(
            children: [
              Stack(
                children: [
                  SvgPicture.asset(
                    Assets.paintingsImgHeadHome,
                    alignment: Alignment.topCenter,
                    width: MediaQuery.of(context).size.width * 4,
                    height: MediaQuery.of(context).size.height / 2,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 210,
                      ),
                      Container(
                        height: 60,
                        width: width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, spreadRadius: 0.3),
                          ],
                        ),
                        child: Text(
                          'قائمة المفضلة',
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: width / 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 250,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: allFav.length,
                      itemBuilder: (BuildContext context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: Container(
                              color: Colors.white,
                              child: ListTile(
                                onTap: () {
                                  navigateTo(
                                    context,
                                    KasydaDetails(),
                                  );
                                },
                                leading: const Icon(
                                  Icons.book,
                                  color: Constants.primary,
                                ),
                                title: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    allFav[index].kName,
                                    style: const TextStyle(
                                      color: Colors.teal,
                                      fontFamily: 'Cairo',
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                subtitle: Text(
                                  allFav[index].kNameT,
                                  style: const TextStyle(
                                    color: Colors.teal,
                                    fontFamily: 'Cairo',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                                trailing: SizedBox(
                                  width: width / 6,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          deleteFav(allFav[index]);
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
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
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void deleteFav(FavModel currentNote) async {
    await dbFav.deleteFav(currentNote.id);
    // displayToastMessage("تم الحذف");
    getAllData();
  }
}
