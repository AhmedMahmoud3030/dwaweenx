import 'package:equatable/equatable.dart';

import 'kasedaBody.dart';

class KasydaBody extends Equatable {
   String id;
   String purpose;
   String type;
   String name;
   String nameT;
   String kaseyda;
   String kaseydaT;
   String letter;

  KasydaBody({
    required this.id,
    required this.purpose,
    required this.type,
    required this.name,
    required this.nameT,
    required this.kaseyda,
    required this.kaseydaT,
    required this.letter,
  });

  KasydaBody copyWith({
     String? id,
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
        purpose,
        type,
        name,
        nameT,
        kaseyda,
        kaseydaT,
        letter,
      ];
}
