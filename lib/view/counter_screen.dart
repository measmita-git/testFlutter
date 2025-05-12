import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';
import '../../../../routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(

          decoration: BoxDecoration(
            color: Colors.grey[100],

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 5.r,
                blurRadius: 7.r,
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
        // Greeting (Tappable)
        GestureDetector(
          onTap: () => Get.toNamed(AppRoutes.nameEntry),
          child: Text(
            'Hi, ${controller.userName.isEmpty ? '_ _ _ _ _' : controller.userName}',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: controller.userName.isEmpty
                  ? FontWeight.normal
                  : FontWeight.bold,


            ),
          ),
        ),

        SizedBox(height: 8.h),
         Text(
          'Your count is:',
          style: TextStyle(fontSize: 18.sp),
        ),

         SizedBox(height: 8.h),
        Text(
          '${controller.count}',
          style:  TextStyle(
            fontSize: 48.sp,
            fontWeight: FontWeight.bold,
          ),
        ),

         SizedBox(height: 32.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCounterButton(
              icon: Icons.remove,
              onPressed: controller.hasUserName
                  ? () => controller.decrement()
                  : null,
            ),
             SizedBox(width: 40.w),
            _buildCounterButton(
              icon: Icons.add,
              onPressed: controller.hasUserName
                  ? () => controller.increment()
                  : null,
            ),
          ],
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
        fixedSize:  Size(56.w, 56.h),
        elevation: 2,
      ),
      child: Icon(icon, size: 22.sp),
    );
  }
}
