import 'package:chat_apps/services/auth_service.dart';
import 'package:chat_apps/utils/spaces.dart';
import 'package:chat_apps/utils/textfield_styles.dart';
import 'package:chat_apps/widgets/login_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media_buttons/social_media_button.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _mainUrl = "https://www.google.com.ph/";

  Future<void> loginUser(BuildContext context) async {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      await context.read<AuthService>().loginUser(userNameController.text);
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

  Widget _buildHeader(BuildContext context) {
    return Column(
      children: [
        Text(
          'Let\'s sign you in!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5),
        ),
        Text(
          'Welcome back! \nYou\'ve been missed!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.blueGrey),
        ),
        verticalSpacing(24),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/illustration.png'),
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        verticalSpacing(24),
      ],
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            print('Link clicked!');
            if (!await launchUrl(Uri.parse(_mainUrl))) {
              throw 'Could not launch $_mainUrl!';
            }
          },
          child: Column(
            children: [
              Text('Find us on'),
              Text(_mainUrl),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaButton.twitter(
              size: 20,
              url: "https://twitter.com/pooja_bhaumik",
            ),
            SocialMediaButton.linkedin(
              size: 20,
              url: "https://linkedin.com/in/poojab26",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Form(
          key: _formkey,
          child: Column(
            children: [
              LoginTextField(
                hintText: "Enter your username",
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Please type your username";
                  } else if (value != null && value.length < 5) {
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
                hintText: 'Enter your password',
              ),
            ],
          ),
        ),
        verticalSpacing(24),
        ElevatedButton(
          onPressed: () async {
            await loginUser(context);
          },
          child: Text(
            'Login',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1000) {
            // Web layout
            return Row(
              children: [
                Spacer(flex: 1),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildHeader(context),
                      _buildFooter(),
                    ],
                  ),
                ),
                Spacer(flex: 1),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: _buildForm(context),
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            );
          } else {
            // Mobile layout
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 40),
                  _buildHeader(context),
                  _buildForm(context),
                  _buildFooter(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
