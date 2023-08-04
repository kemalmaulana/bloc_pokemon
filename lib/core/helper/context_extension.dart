import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  void push({required Widget destination}) {
    Navigator.of(this).push(MaterialPageRoute(
        builder: (_) => destination));
  }
}