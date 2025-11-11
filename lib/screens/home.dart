import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/exam_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final List<Exam> _exams;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadExamList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExamList(exams: _exams),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Број на испити: ${_exams.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  void _loadExamList() async {
    const jsonData = '''
    [
      {"id":1, "predmet":"Мобилни информациски системи", "dateTime":"2025-12-15T09:00:00", "prostorii":["лаб. 3"]},
      {"id":2, "predmet":"Дискретна математика", "dateTime":"2025-11-20T14:00:00", "prostorii":["лаб. 138"]},
      {"id":3, "predmet":"Веб програмирање", "dateTime":"2025-11-21T09:00:00", "prostorii":["лаб. 13"]},
      {"id":4, "predmet":"Бази на податоци", "dateTime":"2025-11-19T11:00:00", "prostorii":["лаб. 2"]},
      {"id":5, "predmet":"Вовед во наука на податоци", "dateTime":"2025-11-29T09:00:00", "prostorii":["лаб. 200а"]},
      {"id":6, "predmet":"Дизајн и архитектура на софтвер", "dateTime":"2025-11-28T13:00:00", "prostorii":["лаб. 3"]},
      {"id":7, "predmet":"Програмирање на видео игри", "dateTime":"2025-11-18T10:00:00", "prostorii":["лаб. 215"]},
      {"id":8, "predmet":"Администрација на системи", "dateTime":"2025-11-18T09:00:00", "prostorii":["лаб. 2"]},
      {"id":9, "predmet":"Веројатност и статистика", "dateTime":"2025-11-19T13:00:00", "prostorii":["лаб. 3"]},
      {"id":10, "predmet":"Напредно програмирање", "dateTime":"2025-11-05T15:00:00", "prostorii":["лаб. 138"]}
    ]
    ''';

    final List data = json.decode(jsonData);
    final exams = data.map((item) => Exam.fromJson(item)).toList()
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    setState(() {
      _exams = exams;
      _isLoading = false;
    });
  }
}
