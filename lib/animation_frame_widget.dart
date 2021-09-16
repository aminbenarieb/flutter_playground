import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationFrameWidget extends StatelessWidget {
  AnimationFrameWidget({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // theme: ThemeData(brightness: Brightness.dark),
      navigationBar: CupertinoNavigationBar(
        middle: Text('Fade Demo'),
      ),
      child: SafeArea(child: MyFadeTest()),
      //actions: [IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved)]
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key? key}) : super(key: key);

  @override
  _MyFadeTest createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  late AnimationController controller;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
              child: FadeTransition(
                  opacity: curve,
                  child: FlutterLogo(
                    size: 100.0,
                  )))),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }
}
