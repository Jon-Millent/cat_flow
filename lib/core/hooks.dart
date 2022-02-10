import 'package:cat_flow/core/rx.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_value_listenable_builder/multi_value_listenable_builder.dart';

typedef CatBuilder = Widget Function();

class CatHook {
  static Widget useEffect(CatBuilder builder, List<CatRx> value) {
    final List<ValueNotifier> list = value.map((item) {
      return item.key;
    }).toList();
    return MultiValueListenableBuilder(
      valueListenables: list,
      builder: (BuildContext context, List<dynamic> values, _) {
        return builder();
      },
    );
  }
}