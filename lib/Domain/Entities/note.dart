import 'package:dwaweenx/Domain/Entities/kasedaBody.dart';

class NoteBody {
  final String title;
  final String content;
  final KasydaBody kasydaBody;

  NoteBody({
    required this.title,
    required this.content,
    required this.kasydaBody,
  });

  factory NoteBody.fromJson(Map<dynamic, dynamic> json) {
    return NoteBody(
      title: json['title'],
      content: json['content'],
      kasydaBody: KasydaBody.fromMap(json['kasydaBody']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'kasydaBody': kasydaBody.toMap(),
    };
  }

  factory NoteBody.fromMap(Map<dynamic, dynamic> map) {
    return NoteBody(
      title: map['title'],
      content: map['content'],
      kasydaBody: KasydaBody.fromMap(map['kasydaBody']),
    );
  }
}
