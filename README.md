# **Cheat sheet : Flutter with GetX**

## **State management**

Firstly, wrap your application widget with `GetMaterialApp` to be HoC instead of `MaterialApp`.

```dart
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
        // ...
    )
  }
}
```

### **Usage in your feature**

> ---
> **Assume** : our feature is `counter`
>
> ---

Create controller for the feature :

```dart
import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  increment() => count++;
}
```

then initial your state with observer `.obs`:

```dart
var count = 0.obs;
```

Then

- get the controller and set to `c` in page widget.
- automate re-render value by using `Obx(() => c.count})`.
- in case you don't want re-render on change just use `c.count`.

```dart
class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(context) {
    final CounterController c = Get.put(CounterController());

    // Or auto-select state's controller by itself
    // final CounterController c = Get.find();

    return Scaffold(
        appBar: AppBar(title: Obx(() => Text('Click: ${c.count}'))),
        body: Text('${c.count}')
    )
  }
}
```

## **Route management**

Get page widget in `GetX`, we using `GetPage()` to load page into memory:

```dart
GetPage(name: '/notfound', page: () => const NotFoundPage())
```

To declare route in `GetX`, start from initial route(s) in `App` widget :

```dart
GetMaterialApp(
    // ...

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
)
```

By:

- `unknownRoute` -- fallback route/page
- `initialRoute` -- start from this route/page
- `getPages` -- list of route/page in this app
- `routingCallback` -- reaction after route is called

## **Change language**

1. Prepare your content/message into `Languages` domain in `lib/src/common/languages/domain` directory, it looks like dictionary. You can declare by using data type `Map<String, Map<String, String>>` :

    ```dart
    import 'package:get/get.dart';

    class Languages extends Translations {
    @override
    Map<String, Map<String, String>> get keys => {
            'en_US': {'hello': 'Hello @name', 'page_not_found': 'Page not found.'},
            'th_TH': {
            'hello': 'สวัสดี @name',
            'page_not_found': 'ไม่พบหน้า ที่ต้องการ'
            }
        };
    }
    ```

2. In main app, initial your translation :

    ```dart
    class MainApp extends StatelessWidget {
        @override
        Widget build(context) {
            return GetMaterialApp(
                // ...

                // Set translater
                translation: Languages(),
                // Get default language from device
                locale: Get.deviceLocale,
                // Set default language to be English
                fallbackLocale: const Locale('en', 'US')
            )
        }
    }
    ```

3. Usage

    3.1. Rendering

    For simple, just adding content key into `Text()`

    ```dart
    Text('page_not_found'.tr)

    // output
    // ไม่พบหน้า ที่ต้องการ
    ```

    Or pass some parameter(s), please change `tr` to `trParams` :

    ```dart
    Text('hello'.trParams({'name': 'Bom'}))

    // output
    // สวัสดี Bom
    ```

    3.2. Change language:

    ```dart
    Stack(
        alignment: Alignment.center,
        children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                    ElevatedButton(
                        onPressed: () => Get.updateLocale(const Locale('th', 'TH')),
                        child: const Text('เปลี่ยนเป็นภาษาไทย'),
                    ),
                    ElevatedButton(
                        onPressed: () => Get.updateLocale(const Locale('en', 'US')),
                        child: const Text('Change language to English'),
                    )
                ]
            )
        ]
    )
    ```
