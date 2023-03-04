import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'MyApp.dart';
import 'UI1.dart';
import 'todolist.dart';
void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: [
        ...DevicePreview.defaultTools
      ],  
      //builder: (context) => MyApp(name: 'Diu Ai', age: 21)));
      builder: (context) => todolist()));
}

