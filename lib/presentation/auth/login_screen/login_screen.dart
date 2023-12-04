import 'package:marco_david_s_application3/controllers/index.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/presentation/auth/login_screen/widgets/login_form_widget.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30, left: 25),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Bienvenido de nuevo',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  /* color: primary, */
                ),
              ),
            ),
          ),
          /* FormLoginScreenWidget(), */
          ChangeNotifierProvider(
                  create: (BuildContext context) =>
                      LoginFormController(User(correo: "", password: "")),
                  child: FormLoginScreenWidget(),
                ),
        ],
      ),
    );
  }
}

