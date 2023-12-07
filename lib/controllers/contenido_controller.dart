import 'package:marco_david_s_application3/models/index.dart';
import 'package:flutter/material.dart';

class ContenidoFormController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Contenido contenido;
  bool _isLoading = false;

  ContenidoFormController(this.contenido);

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
