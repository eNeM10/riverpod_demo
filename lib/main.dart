import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_demo/screens/counter_screen.dart';
import 'package:riverpod_demo/screens/fav_fruit_screen.dart';
import 'package:riverpod_demo/utils/counter_provider.dart';
import 'package:riverpod_demo/utils/fav_fruit_provider.dart';

Future<void> main() async {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Riverpod Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Demo'),
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
                children: [
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CounterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      'Counter',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width / 2,
                    height: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const FavFruitScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Favorite Fruit',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
