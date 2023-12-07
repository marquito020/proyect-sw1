import 'dart:io';

import 'package:marco_david_s_application3/controllers/index.dart';
import 'package:marco_david_s_application3/models/index.dart';
import 'package:marco_david_s_application3/services/cloudinary_service.dart';
import 'package:marco_david_s_application3/services/index.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class FormRegisterUserWidget extends StatefulWidget {
  const FormRegisterUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FormRegisterUserWidget> createState() => _FormRegisterUserWidgetState();
}

class _FormRegisterUserWidgetState extends State<FormRegisterUserWidget> {
  final registerService = RegisterUserService();

  XFile? selectedImage;

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = pickedImage;
      print(selectedImage!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    final registerForm = Provider.of<RegisterFormController>(context);
    TextEditingController dayController = TextEditingController();
    TextEditingController monthController = TextEditingController();
    TextEditingController yearController = TextEditingController();

    TextFormField buildDateInput(String label, TextEditingController controller,
        {int maxLength = 2}) {
      return TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength:
            maxLength, // Limita la entrada a dos dígitos para el día y mes
        decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      );
    }

    return Form(
      key: registerForm.formKey,
      child: Column(
        children: [
          TextFormField(
            onChanged: (value) => registerForm.user.correo = value,
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
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) => registerForm.persona.nombre = value,
            decoration: const InputDecoration(
              labelText: 'Nombre completo',
              labelStyle: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              prefixIcon: Icon(
                Icons.person_outline,
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          /* Imagen input */
          ElevatedButton(
              onPressed: _pickImage,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image_outlined),
                  SizedBox(width: 10),
                  Text('Seleccionar imagen'),
                ],
              )),
          const SizedBox(height: 16),
          if (selectedImage != null)
            Image.file(
              File(selectedImage!.path),
              height: 200,
            ),
          const SizedBox(height: 16),
          /* Calendar: Fecha Nacimiento*/
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Día
                  SizedBox(
                    width: 100,
                    child: buildDateInput('Día', dayController),
                  ),
                  // Mes
                  SizedBox(
                    width: 100,
                    child: buildDateInput('Mes', monthController),
                  ),
                  // Año
                  SizedBox(
                    width: 100,
                    child: buildDateInput('Año', yearController, maxLength: 4),
                  ),
                ],
              ),
              SizedBox(height: 20),
              /* ElevatedButton(
                onPressed: () {
                  // Aquí puedes usar fullDate como desees
                },
                child: Text('Obtener fecha de nacimiento'),
              ), */
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            onChanged: (value) => registerForm.user.password = value,
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
              contentPadding: EdgeInsets.symmetric(vertical: 0),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                /* Navigator.pushReplacementNamed(context, '/login'); */
                String day = dayController.text;
                String month = monthController.text;
                String year = yearController.text;

                // Concatenar la fecha completa
                String fullDate = '$year-$month-$day';
                print('Fecha de nacimiento: $fullDate');
                registerForm.persona.fecha_nac = fullDate;

                var image =
                    await CloudinaryService().urlCloudinary(selectedImage);
                registerForm.persona.img = image.toString();
                var response = await registerService.registerUser(
                  registerForm.user,
                  registerForm.persona,
                );
                print(response);
                if (response['obj'] != null) {
                  Navigator.pushReplacementNamed(context, '/login_screen_page');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  'Registrarse',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
