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
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black, // Set background color to black
      body: Center(
        child: Form(
          key: controller.formkey,
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
                style: TextStyle(color: Colors.black), // Set text color to white
                decoration: InputDecoration(
                  hintText: "Masukkan Password",
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  fillColor: Colors.white, // Set hint text color to white
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20), // Add spacing
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: Text("Login"),
              )),
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
