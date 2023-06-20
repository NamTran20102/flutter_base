import 'dart:async';

class TimerService {
  late Timer _timer;
  List<Function> _callbacks = [];

  TimerService({
    required List<Function> callbacks,
    required Duration periodic,
  }) {
    _callbacks = callbacks;
    _timer = Timer.periodic(periodic, (_) => _executeCallbacks());
  }

  void _executeCallbacks() {
    for (var callback in _callbacks) {
      callback();
    }
  }

  void stopTimer() {
    _timer.cancel();
  }
}
