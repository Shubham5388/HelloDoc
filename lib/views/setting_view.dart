import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_doc/controller/setting_controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SettingController());

    return Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.boy_rounded),
                    title: Text(controller.username.value),
                    subtitle: Text(controller.email.value),
                  )
                ],
              ),
      ),
    );
  }
}