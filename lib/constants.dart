import 'package:flutter/material.dart';

const kHeaderTitle = TextStyle(
  fontFamily: 'Dosis',
  fontWeight: FontWeight.w600,
  fontSize: 40.0,
  color: Colors.white,
);

const kVirus = 'assets/svg/virus.svg';

final Color kInactiveShadowColor = Color(0xFFB7B7B7).withOpacity(0.16);
final Color kActiveShadowColor = Color(0xFF4056C6).withOpacity(0.15);

const List<String> kImageList = [
  'assets/images/headache.png',
  'assets/images/sore_troath.png',
  'assets/images/cough.png',
  'assets/images/fever.png',
];
const List<String> kTextList = [
  'Dor de Cabeça',
  'Dor de Garganta',
  'Tosse',
  'Febre',
];
