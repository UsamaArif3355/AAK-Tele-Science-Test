import 'package:companiestest/features/auth/controllers/auth_controller.dart';
import 'package:companiestest/widgets/app_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final AuthController _authController = Get.put(AuthController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup'),
      ),
      body: Obx(() {
        return _authController.isLoading.value
            ? const Center(
                child: CupertinoActivityIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register ${_authController.selectedUserType.value.title} Account',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text('Please enter your details below'),
                          const SizedBox(
                            height: 4,
                          ),
                          AppTextField(
                            controller: _authController.firstNameController,
                            hintText: 'First Name',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'First name cannot be empty';
                              }
                              return null;
                            },
                          ),
                          AppTextField(
                            controller: _authController.lastNameController,
                            hintText: 'Last Name',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Last name cannot be empty';
                              }
                              return null;
                            },
                          ),
                          AppTextField(
                            controller: _authController.userNameController,
                            hintText: 'Username',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Username cannot be empty';
                              }
                              return null;
                            },
                          ),
                          AppTextField(
                            controller: _authController.countryController,
                            hintText: 'Country',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Country cannot be empty';
                              }
                              return null;
                            },
                          ),
                          AppTextField(
                            controller: _authController.emailController,
                            hintText: 'Email',
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9._]+@[a-z]+\.[a-z]+")
                                  .hasMatch(value)) {
                                return "Enter a valid email";
                              }
                              return null;
                            },
                          ),
                          AppTextField(
                            controller: _authController.passwordController,
                            hintText: 'Password',
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Password cannot be empty';
                              } else if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              return null;
                            },
                          ),
                          AppTextField(
                            controller:
                                _authController.confirmPasswordController,
                            hintText: 'Confirm Password',
                            isPassword: true,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'Confirm Password cannot be empty';
                              } else if (_authController
                                      .passwordController.text !=
                                  _authController
                                      .confirmPasswordController.text) {
                                return 'Both passwords must be matched';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Center(
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _authController.signup(context);
                                    }
                                  },
                                  child: const Text('Signup')))
                        ],
                      ),
                    )),
              );
      }),
    );
  }
}
