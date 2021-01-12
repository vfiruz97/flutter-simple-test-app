import 'dart:math';

import 'package:flutter/material.dart';

int getRandomPrice({int min = 1, @required int max}) {
  int price = (new Random()).nextInt(max - min);
  return price + min;
}
