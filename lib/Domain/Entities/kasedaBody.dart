import 'package:equatable/equatable.dart';

import 'audio.dart';

class KasydaBody extends Equatable {
  final String id;
  final List<Audio> audio;
  final String purpose;
  final String type;
  final String name;
  final String nameT;
  final String kaseyda;
  final String kaseydaT;
  final String letter;

  KasydaBody({
    required this.id,
    required this.audio,
    required this.purpose,
    required this.type,
    required this.name,
    required this.nameT,
    required this.kaseyda,
    required this.kaseydaT,
    required this.letter,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'audio': audio.map((audio) => audio.toMap()).toList(),
      'purpose': purpose,
      'type': type,
      'name': name,
      'nameT': nameT,
      'kaseyda': kaseyda,
      'kaseydaT': kaseydaT,
      'letter': letter,
    };
  }

  KasydaBody copyWith({
    String? id,
    List<Audio>? audio,
    String? purpose,
    String? type,
    String? name,
    String? nameT,
    String? kaseyda,
    String? kaseydaT,
    String? letter,
  }) =>
      KasydaBody(
        id: id ?? this.id,
        audio: audio ?? this.audio,
        purpose: purpose ?? this.purpose,
        type: type ?? this.type,
        name: name ?? this.name,
        nameT: nameT ?? this.nameT,
        kaseyda: kaseyda ?? this.kaseyda,
        kaseydaT: kaseydaT ?? this.kaseydaT,
        letter: letter ?? this.letter,
      );

  @override
  List<Object?> get props => [
        id,
        audio,
        purpose,
        type,
        name,
        nameT,
        kaseyda,
        kaseydaT,
        letter,
      ];
}
