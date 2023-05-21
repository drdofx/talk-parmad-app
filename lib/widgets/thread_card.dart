import 'package:flutter/material.dart';
import 'package:talk_parmad/models/thread.dart';

class ThreadCard extends StatelessWidget {
  final Thread thread;

  const ThreadCard({super.key, required this.thread});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(thread.title),
        subtitle: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(thread.description),
              const SizedBox(height: 8.0),
              Text(
                'Created by: ${thread.createdBy}',
                style: const TextStyle(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
