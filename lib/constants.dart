import 'package:flutter/material.dart';

const colors = [Color(0xFF958BD1), Color(0xFF7A73BB), Color(0xFF5957A1)];
const stops = [0.0, 0.6, 0.8];
const colors1 = [Color(0xFFFF758D), Color(0xFFFF7794), Color(0xFFFF7DAE)];
const hugeText =
    'If you fell sick with any of Covid-19 symptoms please call or SMS us immediately for help.';

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
