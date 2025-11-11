class Exam {
  int id;
  String predmet;
  DateTime dateTime;
  List<String> prostorii;

  Exam({
    required this.id,
    required this.predmet,
    required this.dateTime,
    required this.prostorii,
  });

  Exam.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        predmet = data['predmet'][0].toUpperCase() +
            data['predmet'].substring(1),
        dateTime = DateTime.parse(data['dateTime']),
        prostorii = List<String>.from(data['prostorii']);

  Map<String, dynamic> toJson() => {
    'id': id,
    'predmet': predmet,
    'dateTime': dateTime.toIso8601String(),
    'prostorii': prostorii,
  };
}