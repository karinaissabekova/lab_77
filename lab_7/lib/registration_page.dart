import 'package:flutter/material.dart';
import 'user_info_page.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Focus Nodes
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  bool obscurePassword = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    nameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Registration")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              // NAME
              TextFormField(
                controller: nameController,
                focusNode: nameFocus,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(emailFocus);
                },
              ),

              SizedBox(height: 15),

              // EMAIL
              TextFormField(
                controller: emailController,
                focusNode: emailFocus,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }

                  final emailRegex =
                      RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');

                  if (!emailRegex.hasMatch(value)) {
                    return "Enter a valid email";
                  }

                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(phoneFocus);
                },
              ),

              SizedBox(height: 15),

              // PHONE
              TextFormField(
                controller: phoneController,
                focusNode: phoneFocus,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Phone cannot be empty";
                  }

                  if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Only digits allowed";
                  }

                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordFocus);
                },
              ),

              SizedBox(height: 15),

              // PASSWORD
              TextFormField(
                controller: passwordController,
                focusNode: passwordFocus,
                obscureText: obscurePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscurePassword
                            ? Icons.visibility
                            : Icons.visibility_off
                    ),
                    onPressed: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }

                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }

                  return null;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(confirmPasswordFocus);
                },
              ),

              SizedBox(height: 15),

              // CONFIRM PASSWORD
              TextFormField(
                controller: confirmPasswordController,
                focusNode: confirmPasswordFocus,
                obscureText: obscureConfirm,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                        obscureConfirm
                            ? Icons.visibility
                            : Icons.visibility_off
                    ),
                    onPressed: () {
                      setState(() {
                        obscureConfirm = !obscureConfirm;
                      });
                    },
                  ),
                ),
                validator: (value) {

                  if (value == null || value.isEmpty) {
                    return "Confirm your password";
                  }

                  if (value != passwordController.text) {
                    return "Passwords do not match";
                  }

                  return null;
                },
              ),

              SizedBox(height: 25),

              // BUTTON
              ElevatedButton(
                child: Text("Register"),
                onPressed: () {

                  if (_formKey.currentState!.validate()) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserInfoPage(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                        ),
                      ),
                    );

                  }

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}