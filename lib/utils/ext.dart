import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension MyExt on BuildContext {
  void next(T) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => T));
  }
}
