import 'package:companiestest/features/auth/models/user_type_model.dart';
import 'package:flutter/material.dart';

class UserTypeCard extends StatelessWidget {
  final UserTypeModel userType;
  final VoidCallback onTap;

  const UserTypeCard({super.key, required this.userType, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(userType.title),
        subtitle: Text(userType.title),
        onTap: onTap,
      ),
    );
  }
}
