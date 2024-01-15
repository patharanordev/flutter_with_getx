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
