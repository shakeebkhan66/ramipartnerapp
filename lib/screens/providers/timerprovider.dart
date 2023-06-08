import 'dart:async';

import 'package:flutter/foundation.dart';

class TimerProvider extends ChangeNotifier {
  Timer? _timer;
  void startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 3), (timer) {
      // Perform any necessary operations here
      // This will be executed every 3 minutes
      notifyListeners();
    });
  }

  void cancelTimer() {
    _timer?.cancel();
  }
}
