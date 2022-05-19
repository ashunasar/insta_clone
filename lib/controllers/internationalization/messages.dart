import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        //* defining messages for en_us
        'en_US': {
          'title': 'Hello',
          'message': 'how are you?',
        },

        //* defining messages for hi_IN
        'hi_IN': {
          'title': 'नमस्ते',
          'message': 'आप कैसे हैं',
        }
      };
}
