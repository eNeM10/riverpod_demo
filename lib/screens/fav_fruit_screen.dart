import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/utils/counter_provider.dart';
import 'package:riverpod_demo/utils/fav_fruit_provider.dart';

class FavFruitScreen extends ConsumerStatefulWidget {
  const FavFruitScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavFruitScreenState();
}

class _FavFruitScreenState extends ConsumerState<FavFruitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Fav Fruit'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                child: const Text('Apple'),
                onPressed: () {
                  ref.read(favFruitProvider).changeFavFruit('Apple');
                },
              ),
              MaterialButton(
                child: const Text('Orange'),
                onPressed: () {
                  ref.read(favFruitProvider).changeFavFruit('Orange');
                },
              ),
              MaterialButton(
                child: const Text('Banana'),
                onPressed: () {
                  ref.read(favFruitProvider).changeFavFruit('Banana');
                },
              ),
            ],
          ),
        ),
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
              child: Consumer(builder: (context, ref, _) {
                final String food = ref.watch(favFruitProvider).favFruit;
                return Text(
                  'Your favourite fruit is: $food',
                  textAlign: TextAlign.center,
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
