import 'package:marco_david_s_application3/models/index.dart';
import 'package:flutter/material.dart';

class PertenenciaFormController extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Pertenencia pertenencia;
  bool _isLoading = false;

  PertenenciaFormController(this.pertenencia);

  bool isValidForm() => formKey.currentState?.validate() ?? false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}