# CatFlow
Flutter 超轻量级状态管理

## 特性

* 轻量
* 无侵入
*使用简单

## 开始

#### 安装
```yaml
dependencies:
  cat_flow: version
```
#### 引入
```dart
import 'package:cat_flow/cat.dart';
```

## 使用

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

## 文档

#### CatRx

初始化状态
```dart
CatRx<int> count = CatRx<int>(0);
CatRx<bool> isLoading = CatRx<bool>(false);
```

更新数据和视图
```dart
count.value += 1;
count.update();
```

仅仅更新视图
```dart
count.value += 1;
```

#### CatView
监听数据变化并响应数据到视图
```dart
CatView.render(controller.count, () {
  return Text(
    controller.count.value.toString(),
  );
})
```

#### CatController
简单的控制器
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
`onClose` 和 `onInit` 没有被主动调用，它只是一个重载。 你可以分别在页面的`initState`和`dispose`中调用这两个方法
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

## 开源协议
MIT