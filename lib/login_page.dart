import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Button clicked');
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView( // Prevent overflow on smaller screens
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Text(
                'Let\'s sign you in!',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
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
            const SizedBox(height: 20),
            Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                    'https://png.pngtree.com/png-vector/20190919/ourmid/pngtree-user-login-or-authenticate-icon-on-gray-background-flat-icon-ve-png-image_1742031.jpg',
                  ),
                ),
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const FlutterLogo(),
            ),
          ],
        ),
      ),
    );
  }
}
