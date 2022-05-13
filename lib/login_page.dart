// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

import 'home_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String senha = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Vamo F1?',
        ),
        actions: [
          CustomSwitch(),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Email',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => senha = value,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  'Senha',
                  style: TextStyle(
                    fontSize: 21,
                  ),
                ),
              ),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (email == 'abc@gmail.com' && senha == '12345') {
                  Navigator.of(context).pushReplacementNamed('/home');
                } else {
                  print('login invalido');
                }
              },
              child: Text('Entrar'))
        ],
      ),
    );
  }
}
