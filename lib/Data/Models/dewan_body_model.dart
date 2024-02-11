
import 'package:dwaweenx/Data/Models/dewan_model.dart';
import 'package:dwaweenx/Domain/Entities/dewanBody.dart';


class DawawenBodyModel extends DawawenBody {
  DawawenBodyModel({required super.dawawen});
  factory DawawenBodyModel.fromJson(Map<String, dynamic> json) => DawawenBodyModel(
        dawawen:
            List<DawawenModel>.from(json['Dawawen'].map((x) => DawawenModel.fromJson(x))),
      );
   
}
