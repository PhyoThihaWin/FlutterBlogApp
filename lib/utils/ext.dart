import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension MyExt on BuildContext {
  void next(T) {
    Navigator.push(this, MaterialPageRoute(builder: (_) => T));
  }

  void nextRemove(T){
    Navigator.pushAndRemoveUntil(this, MaterialPageRoute(builder: (context) => T,), (route) => false);
  }

}
