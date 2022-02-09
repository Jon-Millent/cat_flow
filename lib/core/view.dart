import 'package:cat_flow/core/rx.dart';
import 'package:flutter/cupertino.dart';

typedef CatBuilder = Widget Function();

class CatView {
  static Widget render(CatRx value, CatBuilder builder) {
    return ValueListenableBuilder(
      builder: (BuildContext context, value, Widget? child) {
        return builder();
      },
      valueListenable: value.key,
    );
  }
}