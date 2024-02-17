import 'package:dwaweenx/Domain/Entities/note.dart';
import 'package:hive/hive.dart';

class DatabaseHelperNotes {
  final String boxName = 'notes_bodies';

  Future<Box<Map<dynamic, dynamic>>> _openBox() async {
    return await Hive.openBox<Map<dynamic, dynamic>>(boxName);
  }

  Future<void> saveNoteBody(NoteBody noteBody) async {
    final box = await _openBox();
    await box.put(noteBody.title, noteBody.toMap());
  }

  Future<List<NoteBody>> getAllNotesBodies() async {
    final Box<Map<dynamic, dynamic>> box = await _openBox();

    final List<NoteBody> notesBodies =
        box.values.map((map) => NoteBody.fromMap(map)).toList();

    return notesBodies;
  }

  Future<bool> containsNoteBody(String id) async {
    final box = await _openBox();
    return box.containsKey(id);
  }

  Future<void> deleteNoteBody(String id) async {
    final box = await _openBox();
    await box.delete(id);
  }
}
