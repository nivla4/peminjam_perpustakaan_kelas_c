import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrasi'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                width: 400,
                height: 400,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.namaController,
                style: TextStyle(color: Colors.black), // Set text color to white
                decoration: InputDecoration(
                  hintText: "Masukkan Nama",
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                  filled: true,
                  fillColor: Colors.white, // Set background color to white
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Nama tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10), // Add spacing
              TextFormField(
                controller: controller.usernameController,
                style: TextStyle(color: Colors.black), // Set text color to white
                decoration: InputDecoration(
                  hintText: "Masukkan Username",
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                  filled: true,
                  fillColor: Colors.white, // Set background color to white
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Username tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10), // Add spacing
              TextFormField(
                controller: controller.alamatController,
                style: TextStyle(color: Colors.black), // Set text color to white
                decoration: InputDecoration(
                  hintText: "Masukkan Alamat",
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                  filled: true,
                  fillColor: Colors.white, // Set background color to white
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Alamat tidak boleh kosong";
                  }
                  return null;
                },
              ),
              SizedBox(height: 10), // Add spacing
              TextFormField(
                controller: controller.telpController,
                style: TextStyle(color: Colors.black), // Set text color to white
                decoration: InputDecoration(
                  hintText: "Masukkan No Telp",
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                  filled: true,
                  fillColor: Colors.white, // Set background color to white
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "No Telp tidak boleh kosong";
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
                  hintStyle: TextStyle(color: Colors.black), // Set hint text color to white
                  filled: true,
                  fillColor: Colors.white, // Set background color to white
                ),
                validator: (value) {
                  if (value!.length < 2) {
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
                  controller.register();
                },
                child: Text("Registrasi"),
              )),
              SizedBox(height: 10), // Add spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sudah punya akun?",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () => Get.toNamed(Routes.LOGIN),
                    child: Text(
                      "Login Disini",
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
