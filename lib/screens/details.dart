import 'package:flutter/material.dart';
import '../models/exam_model.dart';
import '../widgets/detail_data.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exam = ModalRoute.of(context)!.settings.arguments as Exam;

    final formattedDate =DateFormat('dd/MM/yyyy – hh:mm a').format(exam.dateTime);



    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(exam.predmet.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              exam.predmet,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              formattedDate,
              style: const TextStyle(fontSize: 18, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            DetailData(exam: exam),
          ],
        ),
      ),
    );
  }
}
