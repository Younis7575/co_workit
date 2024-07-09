import 'package:co_workit/constant/custom_form_field.dart';
import 'package:co_workit/controllers/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  final PasswordController controller = Get.put(PasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: controller.oldPasswordController,
                onChanged: (value) => controller.oldPassword.value = value,
                labelText: 'Old Password',
                obscureText: true,
                validator: (value) => controller.validateOldPassword(value!),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.newPasswordController,
                onChanged: (value) => controller.newPassword.value = value,
                labelText: 'New Password',
                obscureText: true,
                validator: (value) => controller.validateNewPassword(value!),
              ),
              SizedBox(height: 16),
              CustomTextFormField(
                controller: controller.confirmNewPasswordController,
                onChanged: (value) =>
                    controller.confirmNewPassword.value = value,
                labelText: 'Confirm New Password',
                obscureText: true,
                validator: (value) =>
                    controller.validateConfirmNewPassword(value!),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: controller.resetPassword,
                child: Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
