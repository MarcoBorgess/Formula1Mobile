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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 64,
                  width: 256,
                  child: Image.network(
                      'https://logodownload.org/wp-content/uploads/2016/11/formula-1-logo-5-3.png'),
                ),
              ),
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
        ),
      ),
    );
  }
}
