import 'package:marco_david_s_application3/controllers/index.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/presentation/auth/register_screen/widgets/register_user_form_widget.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 30),
          child: Column(
            children: <Widget>[
              const SizedBox(
                width: double.infinity,
                child: Text(
                  'Registro',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              /* Register Form*/
              ChangeNotifierProvider(
                create: (BuildContext context) => RegisterFormController(
                    User(correo: "", password: ""),
                    Persona(
                      nombre: "",
                      id_rol: 0,
                      img: "",
                      fecha_nac: "",
                    )),
                child: const FormRegisterUserWidget(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
