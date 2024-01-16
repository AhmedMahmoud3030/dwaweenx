// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dwaweenx/Data/Models/dewan_body_model.dart';
import 'package:dwaweenx/Domain/Entities/audio.dart';
import 'package:dwaweenx/Domain/Entities/dewan.dart';
import 'package:dwaweenx/Domain/Entities/dewanBody.dart';
import 'package:dwaweenx/Domain/Entities/groupByPurpose.dart';
import 'package:dwaweenx/Domain/Entities/kasedaBody.dart';
import 'package:dwaweenx/Models/FavModel.dart';
import 'package:dwaweenx/core/constants.dart';
import 'package:dwaweenx/core/help/database_helper_fav.dart';
import 'package:dwaweenx/core/help/database_helper_notification.dart';
import 'package:dwaweenx/core/widgits/audio_card.dart';
import 'package:dwaweenx/features/About/about.dart';
import 'package:dwaweenx/features/Dwaween/view.dart';
import 'package:dwaweenx/features/Home/view.dart';
import 'package:dwaweenx/services/cloud_firestore_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:screenshot/screenshot.dart';

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
              Audio(sheikhAr: 'sheikhAr', sheikhEn: 'sheikhEn', url: 'url')
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
              Audio(sheikhAr: 'sheikhAr', sheikhEn: 'sheikhEn', url: 'url')
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
      print("Error adding kasyda to dawawen: $error");
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

    dewanBody = await DawawenBodyModel.fromJson(loadedData);
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
      String text, DawawenBody dewanBody) {
    List<Dawawen> filteredDawawen = [];

    dewanBody.dawawen.forEach((dawawen) {
      List<KasydaBody> matchingKasyda = dawawen.kasaed
          .where((kenashat) =>
              (kenashat.kaseyda.toLowerCase().contains(text.toLowerCase())) ||
              kenashat.purpose.toLowerCase().contains(text.toLowerCase()))
          .toList();
      if (matchingKasyda.isNotEmpty) {
        // Create a new copy of the Dawawen object with the matching KasydaBody objects
        Dawawen filteredDawawenCopy = Dawawen(
            id: dawawen.id,
            name: dawawen.name,
            nameT: dawawen.nameT,
            dec: dawawen.dec,
            type: dawawen.type,
            kasaed: matchingKasyda);

        filteredDawawen.add(filteredDawawenCopy);
      }
    });
    return filteredDawawen;
  }

  //?============================AboutScreen=================================================
  TextEditingController aboutController = TextEditingController();
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
    print(kafyaIndex);

    KasaedDetailsScreenData = filterKasydaBodies(
      DewanDetailsScreenData[dewanIndex!].kasaed,
      kaseyda: kafyaController.text.isEmpty
          ? null
          : kafyaController.text.toLowerCase(),
      letter: kafyaIndex == null ? null : kafya[kafyaIndex!],
    );

    print("KasaedDetailsScreenData.length ${KasaedDetailsScreenData.length}");

    notifyListeners();
  }

  List<KasydaBody> filterKasydaBodies(List<KasydaBody> kasydaBodies,
      {String? kaseyda, String? letter}) {
    print('comming here ');

    if (kaseyda == null && letter == null) {
      print('nothing appear ');
      return kasydaBodies;
    }

    return kasydaBodies.where((kasydaBody) {
      print('something appear ');

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
  KasydaBody? _KasydaDetailsBody;
  KasydaBody? get KasydaDetailsBody => _KasydaDetailsBody;

  Future<void> setKasydaDetailsBody(KasydaBody? value) async {
    _KasydaDetailsBody = value;
  }

  List<String> K = [];
  List<String> KT = [];

    double _fontSize=20;

  double get fontSize => _fontSize;

  setFontSize(double value) {
    _fontSize = value;
  }


  Color _fontColor = Colors.black;

  Color get fontColor => _fontColor;

  setFontColor(Color value) {
    _fontColor = value;
    notifyListeners();
  }


  Color _BGColor = Constants.bgColor;

  Color get BGColor => _BGColor;

  setBGColor(Color value) {
    _BGColor = value;
    notifyListeners();
  }

  //////////////////////////////////////////////

  int _audioIndex = 0;
  int get audioIndex => _audioIndex;

  setAudioIndex(int value) {
    _audioIndex = value;
    notifyListeners();
  }

  bool isPlaying = false;
  DatabaseHelperNotificarion dbNotify = new DatabaseHelperNotificarion();
  DatabaseHelperFavourite dbFav = new DatabaseHelperFavourite();

  AudioPlayer _audioPlayer = AudioPlayer()..setAsset('assets/tone10.mp3');
  Stream<PositionData> get postionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer.positionStream,
          _audioPlayer.bufferedPositionStream,
          _audioPlayer.durationStream,
          (position, bufferedPosition, duration) => PositionData(
                position,
                bufferedPosition,
                duration ?? Duration.zero,
              ));

  String color = "";

  TextEditingController tc_title = TextEditingController();
  TextEditingController tc_body = TextEditingController();
  Color textcolor = Colors.teal;
  Color backColor = Color.fromARGB(255, 253, 253, 234);
  double textsize = 20;
  bool loobMode = false;

  ScreenshotController screenshotController = ScreenshotController();
  List<FavModel> allFav = <FavModel>[];
  FavModel favModel = FavModel('', '', '', '');

  List<String> allTexts = [];

  List<String> selectedTexts = [];

  splitKasyda() {
    K = KasydaDetailsBody!.kaseyda.toString().split(".");
    KT = KasydaDetailsBody!.kaseydaT.toString().split(".");
    notifyListeners();
  }

  // void saveNote(String title, String body, String kName, String kasyeda,
  //     String kNameT, String kasyedaT) async {
  //   await dbNotify.saveDuaa(NoteModel(
  //       "$title", "$body", "$kName", "$kasyeda", "$kNameT", "$kasyedaT"));
  // }

  void saveFav(
      String kName, String kasyeda, String kNameT, String kasyedaT) async {
    await dbFav.saveFav(FavModel("$kName", "$kasyeda", "$kNameT", "$kasyedaT"));
  }

  void deleteFav(FavModel currentNote) async {
    await dbFav.deleteFav(currentNote.id);
    // getAllData();
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  searchKasydaDetails() {
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
          .where((element) =>
              element.purpose.toLowerCase().contains(lowerCaseSearchValue))
          .toList();
    } else {
      groupedBy[groupByPurposeIndex].kenshat;
    }
    notifyListeners();
  }

  //!----------------------------------------------------------------------------
}
