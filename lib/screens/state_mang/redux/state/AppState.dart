import 'package:flutter/material.dart';
class RAppState {
  double sliderFontSize;
  bool bold;
  bool italic;
  RAppState(
      {@required this.sliderFontSize, this.bold = false, this.italic = false});
  RAppState.fromAppState(RAppState another) {
    sliderFontSize = another.sliderFontSize;
    bold = another.bold;
    italic = another.italic;
  }
  double get viewFontSize => sliderFontSize * 30;
}