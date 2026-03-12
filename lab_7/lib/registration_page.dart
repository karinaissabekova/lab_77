import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'user_info_page.dart';
import 'constants/colors.dart';
import 'constants/text_styles_value.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmFocus = FocusNode();

  bool obscure = true;
  bool obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("registration".tr()),
        actions: [
          IconButton(
            onPressed: () {
              context.setLocale(const Locale('en'));
            },
            icon: const Text("EN"),
          ),
          IconButton(
            onPressed: () {
              context.setLocale(const Locale('ru'));
            },
            icon: const Text("RU"),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              const SizedBox(height: 20),

              TextFormField(
                controller: nameController,
                focusNode: nameFocus,
                decoration: InputDecoration(
                  labelText: "name".tr(),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "name_error".tr();
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(emailFocus);
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: emailController,
                focusNode: emailFocus,
                decoration: InputDecoration(
                  labelText: "email".tr(),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "email_error".tr();
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(phoneFocus);
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: phoneController,
                focusNode: phoneFocus,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "phone".tr(),
                  border: const OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "phone_error".tr();
                  }
                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "phone_error".tr();
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: passwordController,
                focusNode: passwordFocus,
                obscureText: obscure,
                decoration: InputDecoration(
                  labelText: "password".tr(),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(obscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 6) {
                    return "password_error".tr();
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(confirmFocus);
                },
              ),

              const SizedBox(height: 15),

              TextFormField(
                controller: confirmController,
                focusNode: confirmFocus,
                obscureText: obscureConfirm,
                decoration: InputDecoration(
                  labelText: "confirm_password".tr(),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(obscureConfirm ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        obscureConfirm = !obscureConfirm;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value != passwordController.text) {
                    return "confirm_error".tr();
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserInfoPage(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text("register".tr()),
              )
            ],
          ),
        ),
      ),
    );
  }
}