import 'package:flutter/material.dart';
import 'package:flutter_with_getx/src/features/counter/presentation/counter_controller.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(context) {
    final CounterController c = Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Obx(() => Text('Click: ${c.count}'))),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('hello'.trParams({'name': 'Bom'})),
          ElevatedButton(
            child: const Text('Go to other'),
            onPressed: () => Get.toNamed('/other'),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
          onPressed: c.increment, child: const Icon(Icons.add)),
    );
  }
}
