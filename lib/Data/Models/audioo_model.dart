import '../../Domain/Entities/audio.dart';
//
class AudioModel extends Audio {
  AudioModel(
      {required super.id,
      required super.sheikhAr,
      required super.sheikhEn,
      required super.url});

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        id: json["id"] ?? '',
        sheikhAr: json["sheikhAr"],
        sheikhEn: json["sheikhEn"],
        url: json["url"],
      );
}
