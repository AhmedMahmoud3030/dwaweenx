// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwaweenx/Data/Models/dewan_body_model.dart';
import 'package:dwaweenx/Domain/Entities/dewan.dart';
import 'package:dwaweenx/Domain/Entities/dewanBody.dart';
import 'package:dwaweenx/Domain/Entities/groupByPurpose.dart';
import 'package:dwaweenx/Domain/Entities/kasedaBody.dart';
import 'package:dwaweenx/features/About/about.dart';
import 'package:dwaweenx/features/Dwaween/view.dart';
import 'package:dwaweenx/features/Home/view.dart';
import 'package:dwaweenx/services/cloud_firestore_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'Kasaed/kasaed.dart';

class BaseProvider extends ChangeNotifier {
  //?============================GlobalData=================================================
  FirestoreService service = FirestoreService(FirebaseFirestore.instance);

  List<groupByPurpose> groupedBy = [];

  DawawenBody? dewanBody;

  bool dewanBodyLoading = true;

  Future<void> readDwaweenData() async {
    dewanBodyLoading = true;
    notifyListeners();

    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('dwaween')
        .doc('5CoLOJ5JvPGc25c9dHUU')
        .get();

    final loadedData = snapshot.data() as Map<String, dynamic>;

    dewanBody = await DawawenBodyModel.fromJson(loadedData);
    HomeScreenData = dewanBody!.dawawen;

    dewanBodyLoading = false;
    groupByPurposeMethod(dewanBody!.dawawen);
    notifyListeners();
  }

  void groupByPurposeMethod(List<Dawawen> dawawenList) {
    Map<String, List<KasydaBody>> grouped = {};

    for (var dawawen in dawawenList) {
      for (var kaseda in dawawen.kasaed) {
        grouped.putIfAbsent(kaseda.purpose, () => []);
        grouped[kaseda.purpose]!.add(kaseda);
      }
    }

    groupedBy = grouped.entries.map((entry) {
      return groupByPurpose(
        purpose: entry.key,
        kenshat: entry.value,
      );
    }).toList();

    notifyListeners();
  }

  //?============================BaseScreen=================================================
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;

  List<Widget> screens = [
    HomeScreen(),
    DwaweenScreen(),
    KasaedScreen(),
    AboutScreen()
  ];

  void setSelectedIndex({required int index}) {
    selectedIndex = index;
    notifyListeners();
  }

  //?============================HomeScreen=================================================
  TextEditingController homeController = TextEditingController();
  int? _dewanIndex;
  int _groupByPurposeIndex = 0;

  List<Dawawen> HomeScreenData = [];

  List<String> _kafya = [];

  int? get dewanIndex => _dewanIndex;
  List<String> get kafya => _kafya;
  int get groupByPurposeIndex => _groupByPurposeIndex;

  setDewanIndex(int? value) {
    _dewanIndex = value;
    notifyListeners();
  }

  setkafya(List<String> value) {
    _kafya = value;
    notifyListeners();
  }

  setGroupByPurposeIndex(int value) {
    _groupByPurposeIndex = value;
    notifyListeners();
  }

  searchHomeMethod({
    required String searchValue,
  }) {
    if (searchValue.isNotEmpty) {
      String lowerCaseSearchValue = (searchValue).toLowerCase();
      HomeScreenData =
          searchDewanBodyByNameAndKaseyda(lowerCaseSearchValue, dewanBody!);
      groupByPurposeMethod(HomeScreenData);
    } else {
      HomeScreenData = dewanBody!.dawawen;
      groupByPurposeMethod(dewanBody!.dawawen);
    }
    notifyListeners();
  }

  List<Dawawen> searchDewanBodyByNameAndKaseyda(
      String query, DawawenBody dewanBody) {
    return dewanBody.dawawen.where((dawawen) {
      return dawawen.name.contains(query) ||
          dawawen.kasaed.any((kasyda) => kasyda.kaseyda.contains(query));
    }).toList();
  }

  calculateKafyaList(int index) {
    _kafya.clear();
    for (var element in dewanBody!.dawawen[index].kasaed) {
      if (!_kafya.contains(element.letter)) {
        _kafya.add(element.letter);
      }
    }
    notifyListeners();
  }

  //!----------------------------------------------------------------------------

  int? kafyaIndex;

  //!----------------------------------------------------------------------------

//!----------------------------------------------------------------------------
  //!-----------------------AboutScreen-------------------------------------------
  TextEditingController aboutController = TextEditingController();

  //!----------------------------------------------------------------------------
  //!-----------------------DewanScreen-------------------------------------------
  TextEditingController dewanController = TextEditingController();

  searchDewanMethod({
    required String searchValue,
  }) {
    if (searchValue.isNotEmpty) {
      String lowerCaseSearchValue = (searchValue).toLowerCase();
      HomeScreenData = searchDewanBodyByName(lowerCaseSearchValue, dewanBody!);
      groupByPurposeMethod(HomeScreenData);
    } else {
      HomeScreenData = dewanBody!.dawawen;
      groupByPurposeMethod(dewanBody!.dawawen);
    }
    notifyListeners();
  }

  List<Dawawen> searchDewanBodyByName(String query, DawawenBody dewanBody) {
    return dewanBody.dawawen.where((dawawen) {
      return dawawen.name.contains(query);
    }).toList();
  }

  //!----------------------------------------------------------------------------
  //!-----------------------KasayedScreen-------------------------------------------
  TextEditingController kasayedController = TextEditingController();

  searchKasayedMethod({
    required String searchValue,
  }) {
    if (searchValue.isNotEmpty) {
      String lowerCaseSearchValue = (searchValue).toLowerCase();

      List<Dawawen> filterKaseydaByTextOrPurposeList =
          filterKaseydaByTextOrPurpose(lowerCaseSearchValue);
      if (filterKaseydaByTextOrPurposeList.length > 0) {
        dewanBody!.dawawen.clear();

        // dewanBody!.dawawen = filterKaseydaByTextOrPurposeList;
      } else {
        dewanBody!.dawawen.clear();
      }
    } else {
      // restJson();
    }
    groupByPurposeMethod(dewanBody!.dawawen);
    notifyListeners();
  }

  List<Dawawen> filterKaseydaByTextOrPurpose(String text) {
    dewanBody!.dawawen.forEach((dawawen) {
      dawawen.kasaed
          .where((kenashat) =>
              (kenashat.kaseyda.toLowerCase().contains(text.toLowerCase())) ||
              kenashat.purpose.toLowerCase().contains(text.toLowerCase()))
          .toList();
    });

    return dewanBody!.dawawen;
  }

  TextEditingController kasayedByGategoryController = TextEditingController();

  searchKasayedByGategoryMethod({
    required String? searchValue,
  }) {
    // restJson();
    String lowerCaseSearchValue = (searchValue ?? '').toLowerCase();
    if (lowerCaseSearchValue.isNotEmpty) {
      groupedBy[groupByPurposeIndex]
          .kenshat
          .where((element) =>
              element.purpose.toLowerCase().contains(lowerCaseSearchValue))
          .toList();
    } else {
      groupedBy[groupByPurposeIndex].kenshat;
    }
    notifyListeners();
  }

  //!----------------------------------------------------------------------------

  TextEditingController searchController = TextEditingController();
  String searchValue = "";

  void changeLang({required BuildContext context}) {
    print('changeLang');
    print(context.locale.languageCode);
    if (context.locale.languageCode == 'ar') {
      EasyLocalization.of(context)!.setLocale(Locale('en'));
    } else {
      EasyLocalization.of(context)!.setLocale(Locale('ar'));
    }
    notifyListeners();
  }

  setKafyaIndex(int? index) {
    if (index != null) {
      kafyaIndex = index;
    } else {
      kafyaIndex = null;
    }
    print("kafyaIndex $kafyaIndex");
    notifyListeners();
  }

  TextEditingController kafyaController = TextEditingController();

  String _kasydaScreenText = "";

  String get kasydaScreenText => _kasydaScreenText;

  setkasydaScreenText(String value) {
    _kasydaScreenText = value;
    notifyListeners();
  }

  filterByKasyda() {
    String lowerCaseSearchValue = (_kasydaScreenText).toLowerCase();

    if ((lowerCaseSearchValue.isEmpty) && kafyaIndex == null) {
      // restJson();
    }
    if ((lowerCaseSearchValue.isNotEmpty) || kafyaIndex != null) {
      List<Dawawen> filterKaseydaByLetterOrTextList =
          filterKaseydaByLetterOrText(
              text: lowerCaseSearchValue, index: kafyaIndex);
      if (filterKaseydaByLetterOrTextList.length > 0) {
        dewanBody!.dawawen.clear();

        // dewanBody!.dawawen = filterKaseydaByLetterOrTextList;
      } else {
        dewanBody!.dawawen.clear();
      }
    }
    notifyListeners();
  }

  List<Dawawen> filterKaseydaByLetterOrText({String? text, int? index}) {
    if (text != null) {
      dewanBody!.dawawen[dewanIndex!].kasaed
          .where((kenashat) => (kenashat.kaseyda.toLowerCase().contains(text)))
          .toList();
    }

    if (index != null) {
      dewanBody!.dawawen[dewanIndex!].kasaed
          .where((kenashat) => (kenashat.letter
              .toLowerCase()
              .contains(kafya[index].toLowerCase())))
          .toList();
    }
    // Use 1 as the index to access the first element in the list

    return dewanBody!.dawawen;
  }
}
