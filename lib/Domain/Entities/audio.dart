import 'package:equatable/equatable.dart';

class Audio extends Equatable {
  final String id;
  final String sheikhAr;
  final String sheikhEn;
  final String url;

  Audio({
    required this.id,
    required this.sheikhAr,
    required this.sheikhEn,
    required this.url,
  });

  Audio copyWith({
    String? id,
    String? sheikhAr,
    String? sheikhEn,
    String? url,
  }) =>
      Audio(
        id: id ?? this.id,
        sheikhAr: sheikhAr ?? this.sheikhAr,
        sheikhEn: sheikhEn ?? this.sheikhEn,
        url: url ?? this.url,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sheikhAr': sheikhAr,
      'sheikhEn': sheikhEn,
      'url': url,
    };
  }

  @override
  List<Object?> get props => [
        id,
        sheikhAr,
        sheikhEn,
        url,
      ];
}
