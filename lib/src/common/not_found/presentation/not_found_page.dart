import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(child: Text('page_not_found'.tr)),
    );
  }
}
