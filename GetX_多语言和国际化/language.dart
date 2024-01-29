import 'package:get/get.dart';

class Messages extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        'zh_CN': {
          'hello': '你好',
          'title': '标题',
        },
        'de_DE': {
          'hello': 'Hallo',
          'title': 'tiitlle',
        },
        'en_US': {
          'hello': 'Hello',
          'title': 'Title',
        }
      };
}
