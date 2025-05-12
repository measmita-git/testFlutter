import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';

class NameEntryView extends GetView<CounterController> {
  const NameEntryView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController(
      text: controller.userName,
    );

    return Scaffold(
      body: Center(
        child: Container(
          width: 320,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Get.back(),
                ),
              ),

              // Name Input
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                  onChanged: (value) {
                    controller.updateNameInput(value);
                  },
                ),
              ),


              // Submit Button
              const SizedBox(height: 16),
              Obx(() => ElevatedButton(
                onPressed: controller.isNameInputValid
                    ? () {
                  controller.updateUserName(nameController.text);
                  Get.back();
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                ),
                child: const Text('Submit'),
              )),
            ],
          ),
        ),
      ),
    );
  }
}