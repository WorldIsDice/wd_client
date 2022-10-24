import 'package:flutter/cupertino.dart';

class SplashLoader with ChangeNotifier {
  double loadedPercentage = 0;

  void updateLoader(double percentage) {
    loadedPercentage = percentage;
    notifyListeners();
  }
}
