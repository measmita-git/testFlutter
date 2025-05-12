import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/counter_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

          decoration: BoxDecoration(
            color: Colors.grey[100],

          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Name Input field
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 32.w),
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
               SizedBox(height: 16.h),
              Obx(() => ElevatedButton(
                onPressed: controller.isNameInputValid
                    ? () {
                  controller.updateUserName(nameController.text);
                  Get.back();
                }
                    : null,
                style: ElevatedButton.styleFrom(

                  minimumSize:  Size(290.w, 40.h),
                  backgroundColor: controller.isNameInputValid ? Colors.black : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child:  Text('Submit',style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),),
              )),
            ],
          ),
        ),
      ),
    );
  }
}