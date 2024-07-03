import 'package:flutter/material.dart';
import 'package:login_auth/auth_service.dart';
import 'package:login_auth/home.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final AuthService _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(hintText: 'Email'),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              onPressed: () async {
                dynamic result = await _auth.registerWithEmailAndPassword(
                  _emailController.text, 
                  _passwordController.text
                );
                if (result != null) {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Home(),
                  ),
                );
                } else {
                  print('Error registering');
                }
              },
              child: const Text('Create Account'),
            ),
          ],
        ),
      ),
    );
  }
}