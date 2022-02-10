import 'package:cat_flow/cat.dart';

class SomeMode {
  String name = "";
  int age = 10;
}

class Test1PageController extends CatController {
  CatRx<int> count = CatRx<int>(0);
  CatRx<int> age = CatRx<int>(12);
  CatRx<SomeMode> people = CatRx<SomeMode>(SomeMode());

  void changeAge() {
    age.value++;
  }

  void changeCount() {
    count.value++;
  }

  void changePeople() {
    people.value.name += "1";
    people.value.age += 1;

    people.update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    print("close");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print("init");
  }
}