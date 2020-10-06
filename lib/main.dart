import 'package:flutter/material.dart';
import 'package:flutter_right_place_and_time/pages/home.dart';
import 'package:flutter_right_place_and_time/pages/loading.dart';
import 'package:flutter_right_place_and_time/pages/place_chooser.dart';

void main() => runApp(MaterialApp(

  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/place_chooser': (context) => PlaceChooser(),
  }
));