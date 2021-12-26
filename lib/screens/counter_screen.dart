import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/utils/counter_provider.dart';
import 'package:riverpod_demo/utils/fav_fruit_provider.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.state).state++;
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Consumer(builder: (context, ref, _) {
              String favFruit = ref.watch(favFruitProvider).favFruit;
              int counter = ref.watch(counterProvider.state).state;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Favourite Fruit: $favFruit'),
                  Text('Counter: $counter'),
                ],
              );
            }),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'You have pushed the button this many times:',
                    textAlign: TextAlign.center,
                  ),
                  Consumer(builder: (context, ref, _) {
                    final int count = ref.watch(counterProvider.state).state;
                    return Text(
                      count.toString(),
                      style: const TextStyle(
                        fontSize: 48,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
