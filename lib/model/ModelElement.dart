
import 'package:flutter/material.dart';

class ModelElement{
  TextEditingController textEditingController;
  String labelText;
  bool enabled;
  IconData iconData;
  bool isVisible;
  bool obscureText;

  ModelElement({this.textEditingController, this.labelText, this.enabled, this.iconData, this.isVisible, this.obscureText});
}