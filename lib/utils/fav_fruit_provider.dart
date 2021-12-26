import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favFruitProvider =
    ChangeNotifierProvider((ref) => FavoriteFoodProvider());

class FavoriteFoodProvider extends ChangeNotifier {
  String favFruit = 'none';

  void changeFavFruit(String favFruit) {
    this.favFruit = favFruit;
    notifyListeners();
  }
}
