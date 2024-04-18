import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            color: Colors.black, // Set the text color to black
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Set the background color of the app bar to white
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png', // Replace 'logo.png' with your actual image path
                width: 400, // Adjust width as needed
                height: 400, // Adjust height as needed
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.usernameController,
                style: TextStyle(color: Colors.black), // Set text color to white
                decoration: InputDecoration(
                  hintText: "Masukkan Username",
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white, // Set hint text color to white
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(), // Set border color
                    borderRadius: BorderRadius.circular(15), // Set border radius
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10), // Add spacing
              TextFormField(
                controller: controller.passwordController,
                obscureText: true,// Set text color to white
                decoration: InputDecoration(
                  hintText: "Masukkan Password",
                  fillColor: Colors.white,
                  filled: true,
                  hintStyle: const TextStyle(color: Colors.black),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(), // Set border color
                     // Set border radius
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20), // Add spacing
              Obx(
                    () => controller.loading.value
                    ? CircularProgressIndicator()
                    : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0), // Adjust the border radius for a slightly oval shape
                    color: Colors.white, // Set the background color to white
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.login();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0), // Set the button shape to match the container's shape
                      ),
                      primary: Colors.white, // Set the button color to white
                    ),
                    child: Text("Login", style: TextStyle(color: Colors.black)), // Set the text color to black
                  ),
                ),
              ),

              SizedBox(height: 10), // Add spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Belum punya akun?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.REGISTER),
                    child: Text(
                      "Daftar Disini",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
