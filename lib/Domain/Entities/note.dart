class NoteBody {
  final String title;
  final String content;

  NoteBody({
    required this.title,
    required this.content,
  });

  factory NoteBody.fromJson(Map<dynamic, dynamic> json) {
    return NoteBody(
      title: json['title'],
      content: json['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
    };
  }

  factory NoteBody.fromMap(Map<dynamic, dynamic> map) {
    return NoteBody(
      title: map['title'],
      content: map['content'],
    );
  }
}
