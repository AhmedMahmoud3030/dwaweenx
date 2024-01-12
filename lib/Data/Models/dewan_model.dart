

import 'package:dwaweenx/Data/Models/kaseda_body_model.dart';
import 'package:dwaweenx/Domain/Entities/dewan.dart';


class DawawenModel extends Dawawen {
  DawawenModel({required super.id, required super.name, required super.nameT, required super.dec, required super.type, required super.kasaed});
factory DawawenModel.fromJson(Map<String, dynamic> json) => DawawenModel(
        id: json["id"],
        name: json["name"],
        nameT: json["nameT"],
        dec: json["dec"],
        type: json["type"],
        kasaed: List<KasydaBodyModel>.from(
            json["kasaed"].map((x) => KasydaBodyModel.fromJson(x))),
      );

}




