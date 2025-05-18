import 'package:flutter/material.dart';
import 'package:chat_apps/chat_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _formkey = GlobalKey<FormState>();
  void loginUser(context) {
    if (_formkey.currentState!=null && _formkey.currentState!.validate()) {
      print(userNameController.text);
      print(passwordController.text);

      Navigator.pushNamed(context, '/chat', arguments: '${userNameController.text}');
      print('login successful!');
    } else {
      print('not successful!');
    }
  }

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
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
              Image.network(
                'https://png.pngtree.com/png-vector/20190919/ourmid/pngtree-user-login-or-authenticate-icon-on-gray-background-flat-icon-ve-png-image_1742031.jpg',
                height: 200,
              ),

              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please type your username";
                        } else if (value.length < 5) {
                          return "Your username should be more than 5 characters";
                        }
                        return null;
                      },

                      controller: userNameController,
                      decoration: InputDecoration(
                        hintText: 'Add your username',
                        hintStyle: TextStyle(color: Colors.blueGrey),
                        border: OutlineInputBorder()
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 24,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Type your password',
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(
                height: 24,
              ),
              ElevatedButton(
                onPressed: () {
                  loginUser(context);
                },
                child: const Text(
                  'Login!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
              ),
              InkWell(
                splashColor: Colors.red,
                onDoubleTap: (){
                  print('double tapped!');
                },
                onLongPress: (){
                  print('onLongpressed');
                },
                onTap: (){
                  //todo: Navigate to browser
                  print('linked clicked!');
                },
                child: Column(
                  children: [
                    Text('Find us on'),
                    Text('https://www.google.com.ph/'),
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
