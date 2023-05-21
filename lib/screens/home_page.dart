import 'package:flutter/material.dart';
import 'package:talk_parmad/models/thread.dart';
import 'package:talk_parmad/widgets/thread_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Thread> threads = [
    Thread(
      title: 'Thread 1',
      description: 'This is the first thread',
      createdBy: 'User 1',
    ),
    Thread(
      title: 'Thread 2',
      description: 'This is the second thread',
      createdBy: 'User 2',
    ),
    Thread(
      title: 'Thread 3',
      description: 'This is the third thread',
      createdBy: 'User 3',
    ),
    Thread(
      title: 'Thread 3',
      description: 'This is the third thread',
      createdBy: 'User 3',
    ),
    Thread(
      title: 'Thread 3',
      description: 'This is the third thread',
      createdBy: 'User 3',
    ),
    Thread(
      title: 'Thread 3',
      description: 'This is the third thread',
      createdBy: 'User 3',
    ),
    Thread(
      title: 'Thread 3',
      description: 'This is the third thread',
      createdBy: 'User 3',
    ),
    Thread(
      title: 'Thread 3',
      description: 'This is the third thread',
      createdBy: 'User 3',
    ),
    Thread(
      title: 'Thread 3',
      description: 'This is the third thread',
      createdBy: 'User 3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talk Parmad'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        ],
      ),
      body: ListView.builder(
        itemCount: threads.length,
        itemBuilder: (BuildContext context, int index) {
          final thread = threads[index];
          return ThreadCard(
            thread: thread,
          );
        },
      ),
    );
  }
}
