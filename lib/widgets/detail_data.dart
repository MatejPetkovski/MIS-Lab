import 'package:flutter/material.dart';
import '../models/exam_model.dart';

class DetailData extends StatelessWidget {
  final Exam exam;

  const DetailData({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours.remainder(24);
    final timeLeft = diff.isNegative
        ? 'Испитот е завршен'
        : '$days дена, $hours часа';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Детали за испитот',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _infoRow('Предмет:', exam.predmet),
          _infoRow('Просторија:', exam.prostorii.join(', ')),
          _infoRow('Преостанато време:', timeLeft),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey, fontSize: 18)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
