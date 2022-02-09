import 'package:flutter/cupertino.dart';

class CatRx<T> {
  ValueNotifier<int> key = ValueNotifier(0);
  void update() {
    key.value ++;
  }
  T value;

  CatRx(this.value);
}
