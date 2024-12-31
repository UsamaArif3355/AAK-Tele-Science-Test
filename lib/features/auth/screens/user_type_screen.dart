import 'package:companiestest/features/auth/controllers/auth_controller.dart';
import 'package:companiestest/features/auth/models/user_type_model.dart';
import 'package:companiestest/widgets/user_type_card.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class UserTypeScreen extends StatelessWidget {
  UserTypeScreen({super.key});

  final AuthController _authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Join Us"),
      ),
      body: ListView.builder(
          itemCount: userTypes.length,
          itemBuilder: (_, index) {
            UserTypeModel userType = userTypes[index];
            return UserTypeCard(
              userType: userType,
              onTap: () {
                _authController.setUserType(userType);
                Navigator.pushNamed(context, '/signup');
              },
            );
          }),
    );
  }
}
