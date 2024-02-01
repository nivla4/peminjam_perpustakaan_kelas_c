import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';


class RegisterController extends GetxController {

  final GlobalKey<FormState> formKey = GlobalKey <FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController telpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  register() async {loading(true);
  try{
    FocusScope.of(Get.context!).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      final response = await ApiProvider.instance().post(Endpoint.register,
          data: {
            "nama": namaController.text.toString(),
            "username": usernameController.text.toString(),
            "telp": int.parse(telpController.text.toString()),
            "alamat": alamatController.text.toString(),
            "password": passwordController.text.toString(),
          });
      if (response.statusCode == 201) {
        await StorageProvider.write(StorageKey.status, "logged");
        Get.offAllNamed(Routes.LOGIN);
      } else {
        Get.snackbar("sorry", "Login Gagal", backgroundColor: Colors.orange);
      }
    }loading(false);
  }on dio.DioException catch (e) {loading(false);
  if (e.response != null) {
    if (e.response?.data != null) {
      Get.snackbar("sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
    }
  } else {
    Get.snackbar("sorry", e.message ?? "", backgroundColor: Colors.red);
  }
  } catch (e) {loading(false);
  Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
  }
  }

  void increment() => count.value++;
}
