import 'dart:io';

import 'package:get/get.dart';
import 'package:iitf_flutter_tab/app/constants/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class VersionCheckController extends GetxController {
  Future<void> checkForUpdate() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final url = Uri.parse(
        Platform.isAndroid ? getUrl() : "",
      );
      launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  String getUrl() {
    String url = '';

    if (AppSettings().isStaging) {
      url =
          'https://drive.google.com/drive/folders/16MCdKt14OPVIGlK9ba4RGLlTNsHaP1Xo?usp=sharing';
    } else {
      url =
          'https://drive.google.com/drive/folders/16MCdKt14OPVIGlK9ba4RGLlTNsHaP1Xo?usp=sharing';
    }

    return url;
  }
}
