
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_portal_app/presentation/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {

  LoginPage({super.key});
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: controller.signInWithGoogle,
          child: Text('Sign In With Google'),
        ),
      ),
    );
  }
}
