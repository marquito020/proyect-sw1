import 'package:flutter/material.dart';
import 'package:marco_david_s_application3/controllers/index.dart';
import 'package:marco_david_s_application3/services/index.dart';
import 'package:provider/provider.dart';

class FormLoginScreenWidget extends StatelessWidget {
  FormLoginScreenWidget({
    Key? key,
  }) : super(key: key);

  final loginService = LoginService();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormController>(context);

    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: Form(
        key: loginForm.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) => loginForm.user.correo = value,
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                /* prefixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 50,
                ), */
                suffixIcon: Icon(
                  Icons.check,
                  color: Colors.grey,
                ),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              onChanged: (value) => loginForm.user.password = value,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                /* prefixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 50,
                ), */
                constraints: BoxConstraints.expand(height: 50),
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: Colors.grey,
                ),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  /* Navigator.pushReplacementNamed(
                      context, '/solicitarViaje'); */
                  var response =
                      await LoginService().authenticate(loginForm.user);
                  /* if (kDebugMode) {
                    print(response["token"]);
                  } */
                  if (response['token'] != null && response['token'] != '') {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Bienvenido"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, '/');
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(response['msg']),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            /* Register */
            SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '¿No tienes una cuenta?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: const Text(
                        'Regístrate',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
