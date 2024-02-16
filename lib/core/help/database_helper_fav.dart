import 'package:dwaweenx/Domain/Entities/kasedaBody.dart';
import 'package:hive/hive.dart';

class DatabaseHelperFav {
  final String boxName = 'kasyda_bodies';

  Future<Box<Map<dynamic, dynamic>>> _openBox() async {
    return await Hive.openBox<Map<dynamic, dynamic>>(boxName);
  }

  Future<void> saveKasydaBody(KasydaBody kasydaBody) async {
    final box = await _openBox();
    await box.put(kasydaBody.id, kasydaBody.toMap());
  }

  Future<List<KasydaBody>> getAllKasydaBodies() async {
    final Box<Map<dynamic, dynamic>> box = await _openBox();

    final List<KasydaBody> kasydaBodies =
        box.values.map((map) => KasydaBody.fromMap(map)).toList();

    return kasydaBodies;
  }

  Future<bool> containsKasydaBody(String id) async {
    final box = await _openBox();
    return box.containsKey(id);
  }

  Future<void> deleteKasydaBody(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
