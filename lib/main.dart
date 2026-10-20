import 'package:flutter/material.dart';
import 'package:typicode_example/app.dart';
import 'package:typicode_example/core/di/injection.dart';

void main() {
  setupLocator();
  runApp(const App());
}
