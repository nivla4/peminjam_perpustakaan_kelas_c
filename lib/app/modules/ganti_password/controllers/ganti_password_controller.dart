import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GantiPasswordController extends GetxController {
  final box = GetStorage();

  Future<String> changePassword(
      String currentPassword, String newPassword, String email,
      ) async {
    // Load the stored password.
    String? storedPassword = box.read('password');

    if (storedPassword != currentPassword) {
      return 'Current password is incorrect.';
    }

    // If the current password is correct, update the password.
    box.write('password', newPassword);

    // Password changed successfully.
    return 'Password changed successfully.';
  }
}