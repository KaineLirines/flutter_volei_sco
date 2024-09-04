import 'package:signals/signals.dart';

class Points {
  var _counterA = signal(0);
  var _counterB = signal(0);
  var _setA = signal(0);
  var _setB = signal(0);

  void _resetPontos() {
    effect(() {
      _counterA = signal(0);
      _counterB = signal(0);
    });
  }

  void _resetSet() {
    effect(() {
      _setA = signal(0);
      _setB = signal(0);
    });
  }

  void _incrementCounterA() {
    effect(() {
      _counterA.value++;
    });
  }

  void _decrementCounterA() {
    effect(() {
      if (_counterA.value > 0) {
        _counterA.value--;
      } else {
        _counterA;
      }
    });
  }

  void _incrementsetA() {
    effect(() {
      _setA.value++;
    });
  }

  void _decrementsetA() {
    effect(() {
      if (_setA == 0) {
        _setA;
      } else {
        _setA.value--;
      }
    });
  }

  void _incrementCounterB() {
    effect(() {
      _counterB.value++;
    });
  }

  void _decrementCounterB() {
    effect(() {
      if (_counterB.value > 0) {
        _counterB.value--;
      } else {
        _counterB;
      }
    });
  }

  void _incrementsetB() {
    effect(() {
      _setB.value++;
    });
  }

  void _decrementsetB() {
    effect(() {
      if (_setB.value > 0) {
        _setB.value--;
      } else {
        _setB;
      }
    });
  }
}