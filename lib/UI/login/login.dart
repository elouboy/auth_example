// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:auth_example/UI/login/login.form.dart';
import 'package:auth_example/viewmodels/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:ui_design/ui_design.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                verticalSpaceLarge,
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 34),
                ),
                verticalSpaceRegular,
                InputField(
                  controller: emailController,
                  primaryColor: Colors.white,
                  leading: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                ),
                verticalSpaceMedium,
                InputField(
                  controller: passwordController,
                  primaryColor: Colors.black,
                  password: true,
                  leading: const Icon(Icons.lock, color: Colors.black),
                ),
                verticalSpaceSmall,
                verticalSpaceLarge,
                if (model.validationMessage != null)
                  Text(
                    model.validationMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 25),
                  ),
                if (model.validationMessage != null) verticalSpaceRegular,
                GestureDetector(
                  onTap: model.saveData,
                  child: Container(
                      width: double.infinity,
                      height: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8)),
                      child: model.isBusy
                          ? const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            )),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    horizontalSpaceTiny,
                    GestureDetector(
                      onTap: model.navigateToCreateAccount,
                      child: const Text(
                        'Create an account',
                        style: TextStyle(
                          color: Color(0xFF2D3B7D),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
