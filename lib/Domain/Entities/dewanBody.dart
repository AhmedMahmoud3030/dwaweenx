import 'package:dwaweenx/Domain/Entities/dewan.dart';
import 'package:equatable/equatable.dart';

class DawawenBody extends Equatable {
 final   List<Dawawen> dawawen;

  DawawenBody({
    required this.dawawen,
  });

  DawawenBody copyWith({
    List<Dawawen>? dawawen,
  }) =>
      DawawenBody(
        dawawen: dawawen ?? this.dawawen,
      );

  @override
  List<Object?> get props => [dawawen];
}
