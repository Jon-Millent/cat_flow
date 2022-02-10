import 'package:flutter/cupertino.dart';

class CatRx<T> {
  ValueNotifier<int> key = ValueNotifier(0);
  void update() {
    key.value ++;
  }

  late T _value;

  T get value => _value;

  set value (T newVal) {
    _value = newVal;
    update();
  }

  CatRx (T value) {
    _value = value;
  }
}
