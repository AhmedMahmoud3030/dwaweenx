import 'package:equatable/equatable.dart';

class Audio extends Equatable {
   final String sheikhAr;
   final String sheikhEn;
   final String url;

  Audio({
    required this.sheikhAr,
    required this.sheikhEn,
    required this.url,
  });

  Audio copyWith({
    String? sheikhAr,
    String? sheikhEn,
    String? url,
  }) =>
      Audio(
        sheikhAr: sheikhAr ?? this.sheikhAr,
        sheikhEn: sheikhEn ?? this.sheikhEn,
        url: url ?? this.url,
      );

  @override
  List<Object?> get props => [
        sheikhAr,
        sheikhEn,
        url,
      ];
}
