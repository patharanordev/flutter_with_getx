import 'package:flutter/material.dart';
import 'package:flutter_with_getx/src/common/languages/domain/languages.dart';
import 'package:flutter_with_getx/src/common/not_found/presentation/not_found_page.dart';
import 'package:flutter_with_getx/src/features/counter/presentation/counter_page.dart';
import 'package:flutter_with_getx/src/features/other/presentation/other_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Using GetX HoC for state management
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CounterPage(),

      // Route management
      unknownRoute:
          GetPage(name: '/notfound', page: () => const NotFoundPage()),
      initialRoute: '/counter',
      getPages: [
        GetPage(name: '/counter', page: () => const CounterPage()),
        GetPage(name: '/other', page: () => OtherPage())
      ],
      routingCallback: (routing) {
        switch (routing?.current) {
          case '/counter':
            print('accessed to counter page...');
            break;
          case '/other':
            print('accessed to other page...');
            break;
          default:
            break;
        }
      },

      // Set language/translation
      translations: Languages(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
