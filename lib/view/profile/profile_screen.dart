import 'package:co_workit/constant/custom_form_field.dart';
import 'package:co_workit/controllers/profile_controller.dart';
import 'package:co_workit/view/auth/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(), // Initialize ProfileController
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () {
                      // Handle image update
                      // Implement your image update logic here
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage("https://static.vecteezy.com/system/resources/previews/026/619/142/non_2x/default-avatar-profile-icon-of-social-media-user-photo-image-vector.jpg"), // Replace with actual image
                    ),
                  ),
                ),
                SizedBox(height: 20),
                 
                 CustomTextFormField(
                  controller: TextEditingController(text: controller.currentName),
                   validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    controller.updateName(value);
                  },
                  labelText: 'Your name',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.person),
                ), 
                CustomTextFormField(
                  controller: TextEditingController(text: controller.currentEmail),
                  
                    labelText: 'Email', 
               
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email format validation if needed
                    return null;
                  },
                  onChanged: (value) {
                    controller.updateEmail(value);
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (Form.of(context)!.validate()) {
                      // Save changes logic
                      String name = controller.currentName;
                      String email = controller.currentEmail;
                      // Implement save changes functionality here
                      print('Name: $name, Email: $email');
                    }
                  },
                  child: Text('Save Changes'),
                ),
                TextButton(onPressed: (){
                  Get.to(()=>ForgetPassword());
                }, child: Text("Forget Password")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
