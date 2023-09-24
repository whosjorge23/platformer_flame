import 'dart:io';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pixel_adventure.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();
  await Flame.device.setLandscape();
  await Flame.device.setOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  await Flame.device.fullScreen();
  bool isMobile;

  if (Platform.isAndroid || Platform.isIOS) {
    isMobile = true;
  } else {
    isMobile = false;
  }

  PixelAdventure game = PixelAdventure(showControls: isMobile);
  runApp(
    GameWidget(game: kDebugMode ? PixelAdventure(showControls: isMobile) : game),
  );
}
