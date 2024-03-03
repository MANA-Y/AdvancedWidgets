import 'dart:math';

import 'package:flutter/material.dart';

export 'example_card.dart';

Color randomColor() => Color((Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1);
double randomPos(double max) => Random().nextDouble() * max;