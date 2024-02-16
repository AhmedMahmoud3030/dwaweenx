// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwaweenx/Data/Models/card_data_model.dart';
import 'package:dwaweenx/Data/Models/dewan_body_model.dart';
import 'package:dwaweenx/Domain/Entities/audio.dart';
import 'package:dwaweenx/Domain/Entities/card_data.dart';
import 'package:dwaweenx/Domain/Entities/dewan.dart';
import 'package:dwaweenx/Domain/Entities/dewanBody.dart';
import 'package:dwaweenx/Domain/Entities/groupByPurpose.dart';
import 'package:dwaweenx/Domain/Entities/kasedaBody.dart';
import 'package:dwaweenx/core/help/database_helper_fav.dart';
import 'package:dwaweenx/core/utils.dart';
import 'package:dwaweenx/features/About/about.dart';
import 'package:dwaweenx/features/Dwaween/dawaween_screen.dart';
import 'package:dwaweenx/features/Home/home_screen.dart';
import 'package:dwaweenx/features/KasydaDetails/kasydaShareScreen.dart';
import 'package:dwaweenx/services/cloud_firestore_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'Kasaed/kasaed.dart';

class BaseProvider extends ChangeNotifier {
  DawawenBody uploadData = DawawenBody(
    dawawen: [
      Dawawen(
        id: 'D1',
        name: 'العروة الوثقى في الاستغاثة بسيد الورى',
        nameT: 'العروة الوثقى في الاستغاثة بسيد الورى',
        dec:
            'أحد الدواوين الستة المشهورة للشيخ في المديح النبوي المخصصة لمدح سيد البشر رسول الله ﷺ',
        type: 'Dewan',
        kasaed: [
          KasydaBody(
            id: 'K1',
            audio: [
              Audio(
                sheikhAr: 'Youssra1',
                sheikhEn: 'Youssra1en',
                url:
                    'https://firebasestorage.googleapis.com/v0/b/dwaween-8ede4.appspot.com/o/Youssra%20El%20Hawary%20-%20Bas%20Kollo%20Yehoon%20%EF%BD%9C%20%D9%8A%D8%B3%D8%B1%D8%A7%20%D8%A7%D9%84%D9%87%D9%88%D8%A7%D8%B1%D9%8A%20-%20%D8%A8%D8%B3%20%D9%83%D9%8F%D9%84%D9%91%D9%87%20%D9%8A%D9%87%D9%88%D9%86.mp3?alt=media&token=55690100-9dd6-442c-b402-3adbede98486',
                id: 'audio1.mp3',
              ),
              Audio(
                sheikhAr: 'Aziz1',
                sheikhEn: 'sAzizen1',
                url:
                    'https://firebasestorage.googleapis.com/v0/b/dwaween-8ede4.appspot.com/o/Aziz%20Maraka%20-%20Miganinani%20%EF%BD%9C%20Official%20Music%20Video%20-%202023%20%EF%BD%9C%20%D8%B9%D8%B2%D9%8A%D8%B2%20%D9%85%D8%B1%D9%82%D8%A9%20-%20%D9%85%D8%AC%D9%86%D9%86%D8%A7%D9%86%D9%8A.mp3?alt=media&token=536db9c2-9751-4bd7-9bbc-a75332897033',
                id: 'audio1.mp3',
              ),
            ],
            purpose: 'purpose',
            type: 'Kasyda',
            name: ' كفيت صحابي في الطريق غناء',
            nameT: ' كفيت صحابي في الطريق غناء',
            kaseyda:
                'كفيت صحابي في الطريق عناء. فكلهم بالجذب نال مناء. ولم يك للأقطاب قبلي مثل ما. لذا العبد من فيض يروق سناء. وأشكر ربي ليس سري عاقرا. فأصغر أتباعي أنيل فناء. وذلك من حب الرسول وسره. بسردي له الأمداح حزت لواء. فإكسير هذا العبد حب محمد. وكنزي أن أثنى عليه ثناء. وذلك جيشي وهو درعي ومغفري. وإن مسني داء أجده دواء. وذا طاعتي دهري وصومي وحجتي  . وفيه صلاتي منه نلت غناء. وذلك حرثي وهو بيعي وثروتي  . وأكلي وشربي منه نلت رواء. فلم أرج مخلوقا سوى البدر سيدي. محمد الماحي المنيل ولاء. وقد شد فقري واغترابي وفاقتي  . ولم أطمعن من غير طه عطاء. عليه صلاة الله ثم سلامه. صلاة بها أجني جنى وجداء. عليه صلاة الله ثم سلامه. صلاة بها يعطي الأمين حباء. عليه صلاة الله ثم سلامه. صلاة بها لم ألق بعد عناء. عليه صلاة الله ثم سلامه. صلاة ينال القلب منها جلاء. عليه صلاة الله ثم سلامه. لسقمي وأمراضي تكون شفاء. عليه صلاة الله ثم سلامه. صلاة على الهادي تكون جزاء. عليه صلاة الله ثم سلامه. صلاة بها روحي ينال غذاء. عليه صلاة الله ثم سلامه. وآل وصحب مصطفين صفاء ',
            kaseydaT:
                'كَفَيْتُ صِحَابِي فِي الطَّرِيقِ عَنَاءَ. فَكُلُّهُمُ بِالْجَذْبِ نَالَ مُنَاءَ. وَلَمْ يَكُ لِلْأَقْطَابِ قَبْلِيَ مِثْلَ مَا. لِذَا الْعَبْدِ مِنْ فَيْضٍ يَرُوقُ سَنَاءَ. وَأَشْكُرُ رَبِّي لَيْسَ سِرِّيَ عَاقِرًا. فَأَصْغَرُ أَتْبَاعِي أُنِيلَ فَنَاءَ. وَذَلِكَ مِنْ حُبِّ الرَّسُولِ وَسِرِّهِ. بِسَرْدِي لَهُ الْأَمْدَاحَ حُزْتُ لِوَاءَ. فَإكْسِيرُ هَذَا الْعَبْدِ حُبُّ مُحَمَّدٍ. وَكَنْزِيَ أَنْ أُثْنِى عَلَيْهِ ثَنَاءَ. وَذَلِكَ جَيْشِي وَهْوَ دِرْعِي وَمِغْفَرِي. وَإنْ مَسَّنِي دَاءٌ أَجِدْهُ دَوَاءَ. وَذَا طَاعَتِي دَهْرِي وَصَوْمِي وَحَجَّتِي . وَفِيهِ صَلَاتِي مِنْهُ نِلْتُ غِنَاءَ. وَذَلِكَ حَرْثِي وَهْوَ بَيْعِي وَثَرْوَتِي  . وَأَكْلِي وَشُرْبِي مِنْهُ نِلْتُ رِوَاءَ. فَلَمْ أَرْجُ مَخْلُوقًا سِوَى الْبَدْرِ سَيِّدِي. مُحَمَّدٍ الْمَاحِي الْمُنِيلِ وَلَاءَ. وَقَدْ شَدَّ فَقْرِي وَاغْتِرَابِي وَفَاقَتِي. وَلَمْ أَطْمَعَنْ مِنْ غَيْرِ طَهَ عَطَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. صَلَاةً بِهَا أَجْنِي جَنًى وَجَدَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. صَلَاةً بِهَا يُعْطِي الْأَمِينُ حِبَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. صَلَاةً بِهَا لَمْ أَلْقَ بَعْدُ عَنَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. صَلَاةً يَنَالُ الْقَلْبُ مِنْهَا جَلَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. لِسُقْمِي وَأَمْرَاضِي تَكُونُ شِفَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. صَلَاةً عَلَى الْهَادِي تَكُونُ جَزَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. صَلَاةً بِهَا رُوحِي يَنَالُ غِذَاءَ. عَلَيْهِ صَلَاةُ اللهِ ثُمَّ سَلَامُهُ. وَآلٍ وَصَحْبٍ مُصْطَفَيْنَ صَفَاءَ ',
            letter: 'ء',
          ),
          KasydaBody(
            id: 'K2',
            audio: [
              Audio(
                sheikhAr: 'sheikhAr',
                sheikhEn: 'sheikhEn',
                url:
                    'https://firebasestorage.googleapis.com/v0/b/dwaween-8ede4.appspot.com/o/Aziz%20Maraka%20-%20Miganinani%20%EF%BD%9C%20Official%20Music%20Video%20-%202023%20%EF%BD%9C%20%D8%B9%D8%B2%D9%8A%D8%B2%20%D9%85%D8%B1%D9%82%D8%A9%20-%20%D9%85%D8%AC%D9%86%D9%86%D8%A7%D9%86%D9%8A.mp3?alt=media&token=536db9c2-9751-4bd7-9bbc-a75332897033',
                id: 'audio1.mp3',
              ),
            ],
            purpose: 'purpose',
            type: 'Kasyda',
            name: ' دعوت مذ عمنا الكرب',
            nameT: ' دعوت مذ عمنا الكرب',
            kaseyda:
                'دعوت رسول الله مذ عمنا الكرب. وسيان في هذاكم الشرق والغرب. ولم يك عند الخلق حام سواؤه. ولم ينفعن بعد ولم ينفعن قرب. فلم أر حصنا مانعا يقصدونه. سوى ظل خير الخلق إذ جاءنا الرعب. فزحزح عنا كل كرب أنالنا. منالا به قد قر عيني والقلب. وشاد لنا مجدا تقاعس دونه. أكاسر فرس والقياصرة النجب. ولا غرو أن المصطفى القرم جوده. به سعد الكونان والعجم والعرب. ولا غرو أن المصطفى القرم جوده  . به نزل الفرقان والعلم والخصب. به آدم قد تاب من بعد وحشة. ونال مقاما دونه انحطت الشهب. ويشكر إذ ناداه والبحر زاخر. أتاه سلام بان عن أهله الريب. كذلك إبراهيم قد نال خلة. وموسى كلاما دونه العقل واللب. كذلك روح الله عيسى وإنه  . ترفع للمولى وإن جاءنا نربو. فيا رب هب لي بالأمين وراثة  . لهم كلهم بالمصطفى قضي النحب. وتورثني يا رب منك خلافة. وعلما وجودا دون أنمله السحب. وتجعل مصري هذه مطمئنة. تسوس بلاد الله لم ينحها كرب. وتقضي إلهي ما أتاك مطالبا. من العبد إبراهيم ولياته الجلب. وترزقه التكوين يا خير سيد. ويذهب عني الهم والشك والعيب. صلاة وتسليم على النور سرمدا. كذا الآل والأولاد والأهل والصحب ',
            kaseydaT:
                'دعوت رسول الله مذ عمنا الكرب. وسيان في هذاكم الشرق والغرب. وَلَمْ يَكُ عِنْدَ الْخَلْقِ حَامٍ سِوَاؤُهُ. وَلَمْ يَنْفَعَنْ بُعْدٌ وَلَمْ يَنْفَعَنْ قُرْبُ.فَلَمْ أَرَ حِصْنًا مَانِعًا يَقْصِدُونَهُ.سِوَى ظِلِّ خَيْرِ الْخَلْقِ إذْ جَاءَنَا الرُّعْبُ. فَزَحْزَحَ عَنَّا كُلَّ كَرْبٍ أَنَالَنَا. مَنَالًا بِهِ قَدْ قَرَّ عَيْنِيَ وَالْقَلْبُ.وَشَادَ لَنَا مَجْدًا تَقَاعَسَ دُونَهُ. أَكَاسِرُ فُرْسٍ وَالْقَيَاصِرَةُ النُّجْبُ. وَلَا غَرْوَ أَنَّ الْمُصْطَفَى الْقَرْمَ جُودُهُ .بِهِ سَعِدَ الْكَوْنَانِ وَالْعُجْمُ وَالْعُرْبُ. وَلَا غَرْوَ أَنَّ الْمُصْطَفَى الْقَرْمَ جُودُهُ  .بِهِ نَزَلَ الْفُرْقَانُ وَالْعِلْمُ وَالْخِصْبُ. بِهِ آدَمٌ قَدْ تَابَ مِنْ بَعْدِ وَحْشَةٍ.وَنَالَ مَقَامًا دُونَهُ انْحَطَّتِ الشُّهْبُ. وَيَشْكُرُ إذْ نَادَاهُ وَالْبَحْرُ زَاخِرٌ.أَتَاهُ سَلَامٌ بَانَ عَنْ أَهْلِهِ الرَّيْبُ. كَذَلِكَ إبْرَاهِيمُ قَدْ نَالَ خُلَّةً.وَمُوسَى كَلَامًا دُونَهُ الْعَقْلُ وَاللُّبُّ. كَذَلِكَ رُوحُ اللهِ عِيسَى وَإنَّهُ.تَرَفَّعَ لِلْمَوْلَى وَإنْ جَاءَنَا نَرْبُو. فَيَا رَبِّ هَبْ لِي بِالْأَمِينِ وِرَاثَةً .لَهُمْ كُلِّهِمْ بِالْمُصْطَفَى قُضِيَ النَّحْبُ. وَتُورِثُنِي يَا رَبِّ مِنْكَ خِلَافَةً.وَعِلْمًا وَجُودًا دُونَ أَنْمُلِهِ السُّحْبُ. وَتَجْعَلُ مِصْرِي هَذِهِ مُطْمَئِنَّةً.تَسُوسُ بِلَادَ اللهِ لَمْ يَنْحُهَا كَرْبُ. وَتَقْضِي إلَهِي مَا أَتَاكَ مُطالِبًا.مِنَ الْعَبْدِ إبْرَاهِيمَ وَلْيَاتِهِ الْجَلْبُ. وَتَرْزُقُهُ التَّكْوِينَ يَا خَيْرَ سَيِّدٍ.وَيَذْهَبُ عَنِّي الْهَمُّ وَالشَّكُّ وَالْعَيْبُ. صَلَاةٌ وَتَسْلِيمٌ عَلَى النُّورِ سَرْمَدًا.كَذَا الْآلُ وَالْأَوْلَادُ وَالْأَهْلُ وَالصَّحْبُ ',
            letter: 'ب',
          ),
        ],
      ),
    ],
  );

  uploadDataMethod() async {
    await FirebaseFirestore.instance
        .collection('dwaween')
        .doc('5CoLOJ5JvPGc25c9dHUU')
        .update(uploadData.toMap())
        .catchError((error) {
      // Handle any errors here
    });
  }

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

    dewanBody = DawawenBodyModel.fromJson(loadedData);
    HomeScreenData = dewanBody!.dawawen;
    DewanScreenData = dewanBody!.dawawen;
    KasayedScreenData = dewanBody!.dawawen;
    DewanDetailsScreenData = dewanBody!.dawawen;

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
    AboutScreen(),
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
    String query,
    DawawenBody dewanBody,
  ) {
    return dewanBody.dawawen.where((dawawen) {
      return dawawen.name.contains(query) ||
          dawawen.kasaed.any((kasyda) => kasyda.name.contains(query));
    }).map((dawawen) {
      if (dawawen.name.contains(query)) {
        return Dawawen(
          id: dawawen.id,
          name: dawawen.name,
          nameT: dawawen.nameT,
          dec: dawawen.dec,
          type: dawawen.type,
          kasaed: dawawen.kasaed,
        );
      } else {
        return Dawawen(
          id: dawawen.id,
          name: dawawen.name,
          nameT: dawawen.nameT,
          dec: dawawen.dec,
          type: dawawen.type,
          kasaed: dawawen.kasaed
              .where((kasyda) => kasyda.name.contains(query))
              .toList(),
        );
      }
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

  //?============================DewanScreen=================================================
  TextEditingController dewanController = TextEditingController();
  List<Dawawen> DewanScreenData = [];

  searchDewanMethod({
    required String searchValue,
  }) {
    if (searchValue.isNotEmpty) {
      String lowerCaseSearchValue = (searchValue).toLowerCase();
      DewanScreenData = searchDewanBodyByName(lowerCaseSearchValue, dewanBody!);
      groupByPurposeMethod(DewanScreenData);
    } else {
      DewanScreenData = dewanBody!.dawawen;
      groupByPurposeMethod(dewanBody!.dawawen);
    }
    notifyListeners();
  }

  List<Dawawen> searchDewanBodyByName(String query, DawawenBody dewanBody) {
    return dewanBody.dawawen.where((dawawen) {
      return dawawen.name.contains(query);
    }).toList();
  }

  //?============================KasayedScreen=================================================

  TextEditingController kasayedController = TextEditingController();
  List<Dawawen> KasayedScreenData = [];

  searchKasayedMethod({
    required String searchValue,
  }) {
    if (searchValue.isNotEmpty) {
      String lowerCaseSearchValue = (searchValue).toLowerCase();

      KasayedScreenData =
          filterKaseydaByTextOrPurpose(lowerCaseSearchValue, dewanBody!);

      groupByPurposeMethod(KasayedScreenData);
    } else {
      KasayedScreenData = dewanBody!.dawawen;
      groupByPurposeMethod(dewanBody!.dawawen);
    }
    notifyListeners();
  }

  List<Dawawen> filterKaseydaByTextOrPurpose(
    String text,
    DawawenBody dewanBody,
  ) {
    List<Dawawen> filteredDawawen = [];

    dewanBody.dawawen.forEach((dawawen) {
      List<KasydaBody> matchingKasyda = dawawen.kasaed
          .where(
            (kenashat) =>
                (kenashat.kaseyda.toLowerCase().contains(text.toLowerCase())) ||
                kenashat.purpose.toLowerCase().contains(text.toLowerCase()),
          )
          .toList();
      if (matchingKasyda.isNotEmpty) {
        // Create a new copy of the Dawawen object with the matching KasydaBody objects
        Dawawen filteredDawawenCopy = Dawawen(
          id: dawawen.id,
          name: dawawen.name,
          nameT: dawawen.nameT,
          dec: dawawen.dec,
          type: dawawen.type,
          kasaed: matchingKasyda,
        );

        filteredDawawen.add(filteredDawawenCopy);
      }
    });
    return filteredDawawen;
  }

  //?============================AboutScreen=================================================
  TextEditingController aboutController = TextEditingController();
  TextEditingController favoriteController = TextEditingController();

  void changeLang({required BuildContext context}) {
    if (context.locale.languageCode == 'ar') {
      EasyLocalization.of(context)!.setLocale(const Locale('en'));
    } else {
      EasyLocalization.of(context)!.setLocale(const Locale('ar'));
    }
    notifyListeners();
  }

  //?============================DewanDetailsScreen=================================================
  int? kafyaIndex;

  TextEditingController kafyaController = TextEditingController();
  List<Dawawen> DewanDetailsScreenData = [];
  List<KasydaBody> KasaedDetailsScreenData = [];

  setKafyaIndex(int? index) {
    kafyaIndex = index;

    notifyListeners();
  }

  // kafya[kafyaIndex ?? 0]
  // kafyaController.text.toLowerCase()
  filterByKasyda() {
    KasaedDetailsScreenData = filterKasydaBodies(
      DewanDetailsScreenData[dewanIndex!].kasaed,
      kaseyda: kafyaController.text.isEmpty
          ? null
          : kafyaController.text.toLowerCase(),
      letter: kafyaIndex == null ? null : kafya[kafyaIndex!],
    );

    notifyListeners();
  }

  List<KasydaBody> filterKasydaBodies(
    List<KasydaBody> kasydaBodies, {
    String? kaseyda,
    String? letter,
  }) {
    if (kaseyda == null && letter == null) {
      return kasydaBodies;
    }

    return kasydaBodies.where((kasydaBody) {
      if (kaseyda != null) {
        return kasydaBody.kaseyda.toLowerCase().contains(kaseyda.toLowerCase());
      }
      if (letter != null) {
        return kasydaBody.letter.contains(letter);
      }
      return false;
    }).toList();
  }

  //?============================KasydaDetailsScreen=================================================
  TextEditingController KasydaDetailsController = TextEditingController();
  ScreenshotController screenshotController = ScreenshotController();

  FirebaseStorage storage = FirebaseStorage.instance;

  KasydaBody? _KasydaDetailsBody;

  KasydaBody? get KasydaDetailsBody => _KasydaDetailsBody;

  Future<void> setKasydaDetailsBody(KasydaBody? value, String local) async {
    _KasydaDetailsBody = value;
    _audioPlayer.setUrl(_KasydaDetailsBody!.audio.first.url);
    _sheikh = local == 'ar'
        ? _KasydaDetailsBody!.audio.first.sheikhAr
        : _KasydaDetailsBody!.audio.first.sheikhEn;

    notifyListeners();
  }

  List<String> K = [];
  List<String> KT = [];

  int _fontSize = 20;

  int get fontSize => _fontSize;

  increaseFontSize() {
    fontTransactionEffect = true;
    notifyListeners();

    if (_fontSize < 98) {
      _fontSize = _fontSize + 2;
      notifyListeners();
    }

    Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => fontTransactionEffect = false)
        .then((value) => notifyListeners());
  }

  decreaseFontSize() {
    fontTransactionEffect = true;
    notifyListeners();

    if (_fontSize > 12) {
      _fontSize = _fontSize - 2;
      notifyListeners();
    }

    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => fontTransactionEffect = false)
        .then((value) => notifyListeners());
  }

  setFontSize(int value) {
    fontTransactionEffect = true;
    notifyListeners();

    _fontSize = value;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => fontTransactionEffect = false)
        .then((value) => notifyListeners());
  }

  bool fontTransactionEffect = false;

  List<Color> fontColors = [
    Colors.black,
    const Color(0xff1AA386),
    const Color(0xff0E264C),
    const Color(0xff0E264C),
    const Color(0xff51DECF),
  ];

  List<Color> BGColors = [
    Colors.white,
    const Color(0xffFFF8E9),
    const Color(0xffDFDFDF),
    const Color(0xffE6DBD0),
    const Color(0xffDBEDF1),
  ];

  int _fontColorIndex = 0;
  int _BGColorIndex = 1;

  int get fontColorIndex => _fontColorIndex;

  int get BGColorIndex => _BGColorIndex;

  setFontColor(int index) {
    _fontColorIndex = index;
    notifyListeners();
  }

  setBGColor(int index) {
    _BGColorIndex = index;
    notifyListeners();
  }

  List<String> versesToShareList = [];

  setVersesToShareList(String value) {
    if (versesToShareList.contains(value)) {
      versesToShareList.remove(value);
    } else {
      if (versesToShareList.length < 4) {
        versesToShareList.add(value);
      } else {
        Utils().displayToastMessage('limit_verses'.tr());
      }
    }

    notifyListeners();
  }

  int _shareDialogIndex = 0;

  int get shareDialogIndex => _shareDialogIndex;

  setShareDialogIndex(int value) {
    _shareDialogIndex = value;

    notifyListeners();
  }

  final CarouselController carouselController = CarouselController();

  int _carouselIndex = 0;

  int get carouselIndex => _carouselIndex;

  setCarouselIndex(int value) {
    _carouselIndex = value;

    notifyListeners();
  }

  ListResult? result;
  List<String> urls = [];
  List<Future<String>> xurls = [];

  getListOfImages() async {
    var directoryRef = storage.ref().child('imagesToShare/');

    result = await directoryRef.listAll();

    if (result != null) {
      xurls = result!.items.map((item) {
        return item.getDownloadURL();
      }).toList();
    }

    urls = await Future.wait(xurls);
  }

  AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;

  int _audioIndex = 0;

  int get audioIndex => _audioIndex;

  String _sheikh = '';

  String get sheikh => _sheikh;

  setVocalist({required int audioIndex, required String local}) {
    _audioIndex = audioIndex;
    _audioPlayer.dispose();
    setIsPlaying(false);

    _audioPlayer = AudioPlayer()
      ..setUrl(_KasydaDetailsBody!.audio[audioIndex].url);
    _audioPlayer.play();
    setIsPlaying(true);
    _sheikh = local == 'ar'
        ? _KasydaDetailsBody!.audio[audioIndex].sheikhAr
        : _KasydaDetailsBody!.audio[audioIndex].sheikhEn;

    notifyListeners();
  }

  int _loobMode = 0;

  int get loobMode => _loobMode;

  setLoobMode(int value) {
    _loobMode = value;
    notifyListeners();
  }

  bool _isPlaying = false;

  bool get isPlaying => _isPlaying;

  setIsPlaying(bool value) {
    _isPlaying = value;
    notifyListeners();
  }

  shareText(BuildContext context) async {
    final box = context.findRenderObject() as RenderBox;
    await Share.share(
      versesToShareList.join('\n'),
      subject: KasydaDetailsBody?.name ?? '',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
    );
  }

  void captureScreenShot(
    BuildContext context,
    String image,
    String text,
  ) async {
    final directory = await getTemporaryDirectory();
    Uint8List? imageBytes = await screenshotController.captureFromWidget(
      KasydaShareScreen(
        image: image,
        text: text,
      ),
    );
    String dateTime = DateTime.now().year.toString() +
        DateTime.now().month.toString() +
        DateTime.now().day.toString() +
        DateTime.now().hour.toString() +
        DateTime.now().minute.toString() +
        DateTime.now().second.toString();
    String filePath = '${directory.path}/screenshot$dateTime.png';
    await File(filePath).writeAsBytes(imageBytes);
    // File tempFile = File(filePath);
    await Share.shareXFiles([XFile(filePath)], text: '', subject: '');
    // saveImageToGallery(context,imageBytes);
  }

  splitKasyda() {
    K = KasydaDetailsBody!.kaseyda.toString().split('.');
    KT = KasydaDetailsBody!.kaseydaT.toString().split('.');
    notifyListeners();
  }

  Future<void> downloadFile() async {
    try {} catch (e) {
      throw e;
    }

    notifyListeners();
  }

  //?============================KasayedByCategoryScreen=================================================

  TextEditingController kasayedByGategoryController = TextEditingController();

  searchKasayedByGategoryMethod({
    required String? searchValue,
  }) {
    // restJson();
    String lowerCaseSearchValue = (searchValue ?? '').toLowerCase();
    if (lowerCaseSearchValue.isNotEmpty) {
      groupedBy[groupByPurposeIndex]
          .kenshat
          .where(
            (element) =>
                element.purpose.toLowerCase().contains(lowerCaseSearchValue),
          )
          .toList();
    } else {
      groupedBy[groupByPurposeIndex].kenshat;
    }
    notifyListeners();
  }

//!----------------------------------------------------------------------------
  bool _cardDataLoading = true;

  bool get cardDataLoading => _cardDataLoading;
  AudioPlayer _cardAudioPlayer = AudioPlayer();

  AudioPlayer get cardAudioPlayer => _cardAudioPlayer;

  bool _cardIsPlaying = false;

  bool get cardIsPlaying => _cardIsPlaying;

  CardData? _cardData;

  CardData? get cardData => _cardData;

  void playCardAudio() {
    _cardAudioPlayer.play();
    _cardIsPlaying = true;
    notifyListeners();
  }

  void pauseCardAudio() {
    _cardAudioPlayer.pause();
    _cardIsPlaying = false;
    notifyListeners();
  }

  Future<void> readCardData() async {
    _cardDataLoading = true;
    notifyListeners();

    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('dwaween')
        .doc('kibIWBlgZ3ML7YeziVnH')
        .get();

    final loadedData = snapshot.data() as Map<String, dynamic>;

    _cardData = CardDataModel.fromJson(loadedData['homeCard']);

    _cardAudioPlayer = AudioPlayer()..setUrl(_cardData!.url);

    _cardDataLoading = false;
    notifyListeners();
  }

  //?============================FavoriteScreen=================================================
  List<KasydaBody> favoriteListData = [];

  Future<void> readDataFromDataBase() async {
    favoriteListData = await DatabaseHelperFav().getAllKasydaBodies();
    notifyListeners();
  }

  deleteDataFromDataBase({required String id}) async {
    await DatabaseHelperFav().deleteKasydaBody(id).whenComplete(() async {
      favoriteListData = await DatabaseHelperFav().getAllKasydaBodies();
    });
    notifyListeners();
  }

  saveDataToDataBase({required KasydaBody kasydaBody}) async {
    if (await DatabaseHelperFav().containsKasydaBody(kasydaBody.id)) {
      Utils().displayToastMessage('kasyda_already_added'.tr());
    } else {
      await DatabaseHelperFav()
          .saveKasydaBody(kasydaBody)
          .whenComplete(() async {
        favoriteListData = await DatabaseHelperFav().getAllKasydaBodies();
      });

      Utils().displayToastMessage('kasyda_added_successfully'.tr());
    }

    notifyListeners();
  }
}
