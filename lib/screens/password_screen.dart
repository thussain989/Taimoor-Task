import 'package:flutter/material.dart';
import 'package:taimoor_task/screens/shopping_screen.dart';
import 'package:taimoor_task/strings/app_strings.dart';
import 'package:taimoor_task/widgets/primary_textfield.dart';
import 'package:taimoor_task/widgets/validation_rule.dart';

import '../widgets/primary_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  AppStrings.appName,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryTextField(
                  hintText: AppStrings.password,
                  obscureText: true,
                  textEditingController: passwordController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.passwordIsRequired;
                    }
                  },
                ),
                PrimaryTextField(
                  hintText: AppStrings.confirmPassword,
                  obscureText: true,
                  textEditingController: confirmPasswordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return AppStrings.passwordIsRequired;
                    } else if (passwordController.text != value) {
                      return AppStrings.passwordsDoNotMatch;
                    }
                    return null;
                  },
                ),
                ValidationRule(
                  rule: AppStrings.valRuleOneDigit,
                  ruleIsTrue: () {
                    return RegExp(r'(?=.*?[0-9])')
                        .hasMatch(passwordController.text);
                  },
                ),
                ValidationRule(
                  rule: AppStrings.valRuleOneLowerCaseChar,
                  ruleIsTrue: () {
                    return RegExp(r'(?=.*[a-z])')
                        .hasMatch(passwordController.text);
                  },
                ),
                ValidationRule(
                  rule: AppStrings.valRuleOneUpperCaseChar,
                  ruleIsTrue: () {
                    return RegExp(r'(?=.*[A-Z])')
                        .hasMatch(passwordController.text);
                  },
                ),
                ValidationRule(
                  rule: AppStrings.valRuleOneSpecialChar,
                  ruleIsTrue: () {
                    return RegExp(r'(?=.*?[!@#\$&*~])')
                        .hasMatch(passwordController.text);
                  },
                ),
                ValidationRule(
                  rule: AppStrings.valRuleMinLength,
                  ruleIsTrue: () {
                    return passwordController.text.length >= 8;
                  },
                ),
                const Expanded(
                  child: SizedBox(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: PrimaryButton(
                        buttonText: AppStrings.submit,
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ShoppingScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
