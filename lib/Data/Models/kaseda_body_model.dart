import 'package:dwaweenx/Data/Models/audioo_model.dart';
import 'package:dwaweenx/Domain/Entities/kasedaBody.dart';

class KasydaBodyModel extends KasydaBody {
  KasydaBodyModel(
      {required super.id,
      required super.purpose,
      required super.type,
      required super.name,
      required super.nameT,
      required super.kaseyda,
      required super.kaseydaT,
      required super.letter,
      required super.audio});

  factory KasydaBodyModel.fromJson(Map<String, dynamic> json) =>
      KasydaBodyModel(
        id: json['id'],
        audio: List<AudioModel>.from(
            json['audio'].map((x) => AudioModel.fromJson(x))),
        purpose: json['purpose'],
        type: json['type'],
        name: json['name'],
        nameT: json['nameT'],
        kaseyda: json['kaseyda'],
        kaseydaT: json['kaseydaT'],
        letter: json['letter'],
      );

  
}
