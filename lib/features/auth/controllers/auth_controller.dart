import 'dart:convert';

import 'package:companiestest/core/constants/api_endpoints.dart';
import 'package:companiestest/core/network/api_service.dart';
import 'package:companiestest/core/utils/snackbar_helper.dart';
import 'package:companiestest/features/auth/models/user_type_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final Rx<UserTypeModel> selectedUserType =
      UserTypeModel(title: '', subTitle: '', key: '').obs;

  void setUserType(UserTypeModel userType) {
    selectedUserType.value = userType;
    debugPrint('selected userType:${selectedUserType.value.title}');
    update();
  }

  final ApiService _apiService = ApiService();

  void signup(BuildContext context) async {
    try {
      isLoading.value = true;
      final response = await _apiService.post(
          ApiEndpoints.auth.signup,
          jsonEncode({
            "user_type": selectedUserType.value.key,
            "first_name": firstNameController.text.trim(),
            "last_name": lastNameController.text.trim(),
            "username": userNameController.text.trim(),
            "email": emailController.text.trim(),
            "password": passwordController.text.trim(),
            "country": countryController.text.trim()
          }));
      isLoading.value = false;
      if (response.statusCode == 200) {
        debugPrint('SignUp Successful');
        debugPrint('Response body:${response.body}');
        var responseData = jsonDecode(response.body);
        SnackBarHelper.showSnackBar(
            context: context, message: '${responseData['message']}');
        clearFields();
      } else {
        debugPrint('Error in Signup');
        debugPrint('Response body:${response.body}');
        SnackBarHelper.showSnackBar(
            context: context,
            message: '${response.body}',
            backgroundColor: Colors.red);
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint('Error in Signup:${e.toString()}');
      SnackBarHelper.showSnackBar(
          context: context,
          message: 'Error in Signup:${e.toString()}',
          backgroundColor: Colors.red);
    }
  }

  void clearFields() {
    firstNameController.clear();
    lastNameController.clear();
    userNameController.clear();
    countryController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    update();
  }
}
