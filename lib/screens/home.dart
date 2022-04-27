import 'package:encryption_project/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  final controller = Get.put(HomeController());
  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          TextFormField(
            controller: controller.text,
            decoration: const InputDecoration(
              label: Text('Message'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.sendMessage(controller.text.text);
            },
            child: const Text('Send'),
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(
            () => Text(
              controller.value.value,
            ),
          ),
        ],
      ),
    );
  }
}
