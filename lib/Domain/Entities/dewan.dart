import 'package:dwaweenx/Domain/Entities/kasedaBody.dart';
import 'package:equatable/equatable.dart';

class Dawawen extends Equatable {
  final String id;
  final String name;
  final String nameT;
  final String dec;
  final String type;
  final List<KasydaBody> kasaed;

  Dawawen({
    required this.id,
    required this.name,
    required this.nameT,
    required this.dec,
    required this.type,
    required this.kasaed,
  });

  Dawawen copyWith({
    String? id,
    String? name,
    String? nameT,
    String? dec,
    String? type,
    List<KasydaBody>? kasaed,
  }) =>
      Dawawen(
        id: id ?? this.id,
        name: name ?? this.name,
        nameT: nameT ?? this.nameT,
        dec: dec ?? this.dec,
        type: type ?? this.type,
        kasaed: kasaed ?? this.kasaed,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'nameT': nameT,
      'dec': dec,
      'type': type,
      'kasaed': kasaed.map((x) => x.toMap()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        name,
        nameT,
        dec,
        type,
        kasaed,
      ];
}
