import 'package:flutter/material.dart';
import 'package:flutter_with_getx/src/features/counter/presentation/counter_controller.dart';
import 'package:get/get.dart';

class OtherPage extends StatelessWidget {
  OtherPage({super.key});

  final CounterController c = Get.find();

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
          child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('${c.count}'),
                ElevatedButton(
                  onPressed: () => Get.updateLocale(const Locale('th', 'TH')),
                  child: const Text('เปลี่ยนเป็นภาษาไทย'),
                ),
                ElevatedButton(
                  onPressed: () => Get.updateLocale(const Locale('en', 'US')),
                  child: const Text('Change language to English'),
                ),
                ElevatedButton(
                    onPressed: () => Get.toNamed('/counter'),
                    child: const Icon(Icons.arrow_back_rounded))
              ]),
        ],
      )),
    );
  }
}
