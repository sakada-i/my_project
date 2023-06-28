import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_project/main.dart';

class Help extends ConsumerWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${ref.watch(countProvider)}',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 80,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(countProvider.notifier).state++;
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      )
    );
  }
}