import 'package:encryption_project/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const EncryptionProject());
}

class EncryptionProject extends StatelessWidget {
  const EncryptionProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Encryption Project",
      home: Home(),
    );
  }
}
