import 'package:dwaweenx/Domain/Entities/card_data.dart';

class CardDataModel extends CardData {
  const CardDataModel(
      {required super.titleAr,
      required super.titleEn,
      required super.sheikhAr,
      required super.sheikhEn,
      required super.url});

  factory CardDataModel.fromJson(Map<String, dynamic> json) {
    return CardDataModel(
      titleAr: json['titleAr'],
      titleEn: json['titleEn'],
      sheikhAr: json['sheikhAr'],
      sheikhEn: json['sheikhEn'],
      url: json['url'],
    );
  }

  factory CardDataModel.fromMap(Map<String, dynamic> map) {
    return CardDataModel(
      titleAr: map['titleAr'],
      titleEn: map['titleEn'],
      sheikhAr: map['sheikhAr'],
      sheikhEn: map['sheikhEn'],
      url: map['url'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'titleAr': titleAr,
      'titleEn': titleEn,
      'sheikhAr': sheikhAr,
      'sheikhEn': sheikhEn,
      'url': url,
    };
  }
}
