import 'package:flutter/cupertino.dart';

TextEditingController phoneController = TextEditingController();
String? phoneValidator_;
String? phone;
bool isNumeric(String s) {
  return double.tryParse(s) != null;
}

phoneValidator() {
  if (phoneController.text.isEmpty) {
    phoneValidator_ = "Por favor ingrese su numero";
  } else if (phoneController.text.length != 10 ||
      !isNumeric(phoneController.text)) {
    phoneValidator_ = "Ingrese un numero valido";
  } else {
    phoneValidator_ = null;
    phone = phoneController.text;
  }
}
