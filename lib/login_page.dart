import 'package:chat_apps/utils/spaces.dart';
import 'package:chat_apps/utils/textfield_styles.dart';
import 'package:chat_apps/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:chat_apps/chat_page.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _mainUrl = "https://www.google.com.ph/";

  void loginUser(context) {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: '${userNameController.text}',
      );
      print('login successful!');
    } else {
      print('not successful!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  'Let\'s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Text(
                  'Welcome Back!\nYou\'ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.blueGrey,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/illustration.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your username",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please type your username";
                        } else if (value.length < 5) {
                          return "Your username should be more than 5 characters";
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hasAsterisk: true,
                      controller: passwordController,
                      hintText: "Enter your password",
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: const Text(
                  'Login!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                splashColor: Colors.red,
                onDoubleTap: () {
                  print('double tapped!');
                },
                onLongPress: () {
                  print('onLongpressed');
                },
                onTap: () async {
                  print('link clicked!');
                  if (!await launch(_mainUrl)) {
                    throw 'Could not launch this!';
                  }
                },
                child: Column(
                  children: [
                    const Text('Find us on'),
                    Text(_mainUrl),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialMediaButton.twitter(
                          color: Colors.blue,
                          url: "https://twitter.com",
                        ),
                        SocialMediaButton.facebook(
                          color: Colors.blue,
                          url: "https://facebook.com",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
