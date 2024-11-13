import 'package:http/http.dart' as http;

Future<bool> isInternetAvailable() async {
  try {
    final response = await http
        .get(Uri.parse('https://www.google.com'))
        .timeout(const Duration(seconds: 5));
    if (response.statusCode == 200) {
      return true; // Internet is available
    } else {
      return false; // Server responded, but connection might not be reliable
    }
  } catch (e) {
    return false; // No internet connection
  }
}
