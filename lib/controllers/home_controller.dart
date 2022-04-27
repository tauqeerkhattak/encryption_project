import 'dart:developer';

import 'package:encrypt/encrypt.dart';
import 'package:encryption_project/utils/network.dart';
import 'package:flutter/cupertino.dart' hide Key;
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController text = TextEditingController();
  Rx<String> value = ''.obs;

  void sendMessage(String message) async {
    String keyString = 'ss3ExBI6ggHzrWiZGJl0iAASIUX6uBzU';
    log('Length of Key is: ${keyString.length}');
    final key = Key.fromUtf8(keyString);
    final iv = IV.fromUtf8('0000000000000000');
    log('IV: ${iv.bytes}');
    final encryptor = Encrypter(AES(key, mode: AESMode.cbc));
    final encrypted = encryptor.encrypt(message, iv: iv);
    final decrypted = encryptor.decrypt(encrypted, iv: iv);
    log('Encrypted: ${encrypted.base64}');
    log('Decrypted: $decrypted');
    String response = await Network.post(
      payload: {
        'text': encrypted.base64,
      },
      url: 'http://www.eusopht.com/site_audit/public/api/test/encrypt',
    );
    value.value = response;
  }
}
