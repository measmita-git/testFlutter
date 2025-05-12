import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';
import '../../../../routes/app_routes.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 320,
          height: 600,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Obx(() => _buildCounterContent()),
        ),
      ),
    );
  }

  Widget _buildCounterContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
    // Greeting
    Text(
    'Hi, ${controller.userName.isEmpty ? '_____' : controller.userName}',
      style: TextStyle(
        fontSize: 24,
        fontWeight: controller.userName.isEmpty
            ? FontWeight.normal
            : FontWeight.bold,
        decoration: controller.userName.isEmpty
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    ),

    // Count Label
    const SizedBox(height: 8),
    const Text(
    'Your count is:',
    style: TextStyle(fontSize: 18),
    ),

    // Count Value
    const SizedBox(height: 8),
    Text(
    '${controller.count}',
    style: const TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    ),
    ),

    // Counter Buttons
    const SizedBox(height: 32),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    _buildCounterButton(
    icon: Icons.remove,
    onPressed: controller.hasUserName
    ? () => controller.decrement()
        : null,
    ),
    const SizedBox(width: 40),
    _buildCounterButton(
    icon: Icons.add,
    onPressed: controller.
    hasUserName
        ? () => controller.increment()
        : null,
    ),
    ],
    ),

        // Name Edit Option
        const SizedBox(height: 16),
        TextButton(
          onPressed: () => Get.toNamed(AppRoutes.nameEntry),
          child: Text(
            controller.hasUserName ? 'Edit Name' : 'Set Name',
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCounterButton({
    required IconData icon,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.grey[700],
        shape: const CircleBorder(),
        fixedSize: const Size(56, 56),
        elevation: 2,
      ),
      child: Icon(icon, size: 24),
    );
  }
}