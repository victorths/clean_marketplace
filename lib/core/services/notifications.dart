import 'package:clean_marketplace/core/theme/theme.dart';
import 'package:get/get.dart';

abstract class Notifications {
  static void error({
    String title = 'An error occurred.',
    required String message,
    Duration duration = const Duration(seconds: 4),
  }) {
    Get.showSnackbar(
      GetBar(
        title: title,
        message: message,
        duration: duration,
        backgroundColor: ThemeConfig.colorPalette.danger100,
      ),
    );
  }

  static void success({
    String title = 'Success!',
    required String message,
    Duration duration = const Duration(seconds: 2),
  }) {
    Get.showSnackbar(
      GetBar(
        title: title,
        message: message,
        duration: duration,
        backgroundColor: ThemeConfig.colorPalette.success100,
      ),
    );
  }
}
