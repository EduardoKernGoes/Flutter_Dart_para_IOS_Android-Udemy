import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;

  AdaptativeButton(this.label, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? 
      CupertinoButton(onPressed: onPressed, child: Text(label))
      :
      FilledButton(
        onPressed: onPressed,
        child: Text(label, style: TextStyle(fontSize: 18))
      );
  }
}