// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'favourite.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class FavouriteAdapter extends TypeAdapter<Favourite> {
//   @override
//   final int typeId = 1;
//
//   @override
//   Favourite read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Favourite(
//       Dname: fields[0] as String,
//       Kname: fields[1] as String,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, Favourite obj) {
//     writer
//       ..writeByte(2)
//       ..writeByte(0)
//       ..write(obj.Dname)
//       ..writeByte(1)
//       ..write(obj.Kname);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//       other is FavouriteAdapter &&
//           runtimeType == other.runtimeType &&
//           typeId == other.typeId;
// }
