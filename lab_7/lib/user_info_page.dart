import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'constants/text_styles_value.dart';

class UserInfoPage extends StatelessWidget {

  final String name;
  final String email;
  final String phone;

  const UserInfoPage({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("user_info".tr()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("${"name".tr()}: $name", style: AppTextStyles.body),
            const SizedBox(height: 10),
            Text("${"email".tr()}: $email", style: AppTextStyles.body),
            const SizedBox(height: 10),
            Text("${"phone".tr()}: $phone", style: AppTextStyles.body),
          ],
        ),
      ),
    );
  }
}