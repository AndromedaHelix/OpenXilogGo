/// Written by Juan Pablo Gutiérrez
/// 27 - 06 - 2023

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

const String fontFamily = "Manrope";

TextStyle loggeInfoStyle = const TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold, fontFamily: "Manrope");

const TextStyle defaultStyle = TextStyle(
  fontFamily: fontFamily,
  color: Colors.white,
  fontWeight: FontWeight.w700,
  fontSize: 25,
);
const TextStyle smallerDefaultStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 18,
);

const TextStyle substitleStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.w700,
  color: Colors.white,
  fontSize: 15,
);

const TextStyle titleTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 32,
);

const TextStyle bigTextStyle = TextStyle(
  fontFamily: fontFamily,
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: 52,
);

/* Widget configuration */
const double standartSpacerHeight = 30;

const double mediumSpacerHeight = 20;

const double smallerSpacerHeight = 10;

/* Color configuration */
const Color paletePink = Color(0xffFF128E);
const Color paletePurple = Color(0xff8310DE);
const Color paleteBlue = Color(0xff1D3BF4);
const Color paleteLightBlue = Color(0xff10CCDE);
const Color paleteDarkBlue = Color(0xFF2837E1);
const Color paleteBlack = Color(0xff000000);

const Color paleteGreen = Color(0xFF00FF7F);
const Color paleteTeal = Color(0xFF00FFFF);
const Color paleteYellow = Color(0xFFFFFF00);
const Color paleteLighGreen = Color(0xFF90EE90);
const Color paleteOrange = Color(0xFFFFA500);
const Color paleteCoral = Color(0xFFFF7F50);
const Color paleteDarkOrange = Color(0xFFFF8C00);
const Color paleteDarkColar = Color(0xFFFF4500);

const SweepGradient backGroundGradient = SweepGradient(
  center: FractionalOffset.topLeft,
  transform: GradientRotation(-math.pi / 4),
  colors: [
    paleteDarkBlue,
    paleteLightBlue,
    paleteBlue,
  ],
);
