# CatFlow
flutter super lightweight state management

## Features

* lightweight
* Non-intrusive state management
* easy to use

## Getting started

#### install
```yaml
dependencies:
  cat_flow: version
```
#### import
```dart
import 'package:cat_flow/cat.dart';
```

## Usage

```dart
import 'package:cat_flow/cat.dart';

// controller
class MyController extends CatController {
  CatRx<int> count = CatRx<int>(0);

  void changeCount() {
    count.value++;
    count.update();
  }
}

// view
// ...
Widget build(BuildContext context) {
  //...
  CatView.render(controller.count, () {
    return Text(
      controller.count.value.toString(),
    );
  });
  //...
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      controller.changeCount();
    },
    tooltip: 'Increment',
    child: const Icon(Icons.add),
  );
  //...
}
// ...
```

## Document

#### CatRx

Initialization data
```dart
CatRx<int> count = CatRx<int>(0);
CatRx<bool> isLoading = CatRx<bool>(false);
```

update date and view
```dart
count.value += 1;
count.update();
```

update date only
```dart
count.value += 1;
```

#### CatView
Listen for data changes and respond to data to the view
```dart
CatView.render(controller.count, () {
  return Text(
    controller.count.value.toString(),
  );
})
```

#### CatController
a simple controller
```dart
class MyController extends CatController {
  CatRx<int> count = CatRx<int>(0);
  
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
```

`onClose` and `onInit` not actively called, it's just an overload. You can call these two methods in `initState` and `dispose` of the page respectively

```dart

class TemplatePageState extends State<TemplatePage> {
  MyController controller = MyController();
  
  @override
  void initState() {
    super.initState();
    
    controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("xxxx"),
      ),
    );
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
    controller.onClose();
  }
}
```
