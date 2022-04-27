import 'dart:developer';

import 'package:http/http.dart';

class Network {
  static Future<String> post({payload, url}) async {
    try {
      var request = MultipartRequest(
        'POST',
        Uri.parse(url),
      );
      request.fields.addAll(payload);
      StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        String res = await response.stream.bytesToString();
        return res;
      } else {
        return 'null';
      }
    } on Exception catch (e) {
      log('Error in post: $e');
      return 'null';
    }
  }
}
