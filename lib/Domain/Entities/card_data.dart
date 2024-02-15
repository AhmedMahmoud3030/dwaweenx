import 'package:equatable/equatable.dart';

class CardData extends Equatable {
  const CardData(
      {required this.titleAr,
      required this.titleEn,
      required this.sheikhAr,
      required this.sheikhEn,
      required this.url});

  final String titleAr;
  final String titleEn;

  final String sheikhAr;
  final String sheikhEn;
  final String url;

  @override
  List<Object?> get props => [titleAr, titleEn, sheikhAr, sheikhEn, url];
}
