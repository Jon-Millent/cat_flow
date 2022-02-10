import 'package:cat_flow/core/hooks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'controller.dart';

class Test1Page extends StatefulWidget  {
  const Test1Page({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Test1PageState();
}

class _Test1PageState extends State<Test1Page> {

  Test1PageController controller = Test1PageController();

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
        title: const Text("test1"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            CatHook.useEffect(() {
              print("count change");
              return Column(
                children: [
                  Text(
                    controller.count.value.toString(),
                    style: TextStyle(
                        fontSize: 80
                    ),
                  ),
                  Text(
                    controller.age.value.toString(),
                    style: TextStyle(
                        fontSize: 80
                    ),
                  )
                ],
              );
            }, [controller.count, controller.people, controller.age]),

            CupertinoButton(
              onPressed: () {
                controller.changePeople();
              },
              child: const Text("change people"),
            ),
            CupertinoButton(
              onPressed: () {
                controller.changeAge();
              },
              child: const Text("change age"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.changeCount();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
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

